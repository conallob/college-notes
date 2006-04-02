/* 
 * File: oid.c   
 * Description: Server to accept and echo messages
 * Author: Conall O'Brien <conallob@maths.tcd.ie>
 * $Date: $
 * $Id $
 */


/* libc stuff... */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

/* APR stuff... */

#include "apr_network_io.h"
#include "apr_file_io.h"
#include "apr_errno.h"
#include "apr_general.h"
#include "apr_getopt.h"
#include "apr_poll.h"

/* local stuff... */

#include "oi_logins.h"
#include "utent.h"
#include "linklist.h"

/* conditional #defines */

#ifndef WRITE_BIN
	#define WRITE_BIN "/usr/bin/write"
#endif

/* #defines */

#define SERVICEPORT 5222
#define COMMANDLEN 64
#define NAMELEN 16
#define STRLEN 15

static void closeapr(void) {
    apr_terminate();
}


int main(int argc, const char * const argv[]) {

    apr_pool_t *context, *sin, *sout, *serr;
    apr_socket_t *sock, *sock2;
    apr_size_t length;
    apr_int32_t rv;
    apr_pollfd_t *sdset;
    char user[NAMELEN];
    const char *bind_to_ipaddr = NULL;
    char *local_ipaddr, *remote_ipaddr;
    apr_port_t local_port, remote_port;
    apr_sockaddr_t *localsa = NULL, *remotesa;
    apr_status_t stat;
    int family = APR_UNSPEC;
    char buf[128];
    apr_getopt_t *opt;
    const char *optarg;
    char optchar;

	 apr_pool_t *p, *q, *e;
	 apr_file_t *fp_in, *fp_out, *fp_err;

	 oi_user *u;
    char command[COMMANDLEN];
	 FILE *pipe;
	 char *ptr, *mesg, *datarecv;

	 
    if (apr_initialize() != APR_SUCCESS) {
        fprintf(stderr, "Something went wrong\n");
        exit(-1);
    }

    atexit(closeapr);

    if (apr_pool_create(&context, NULL) != APR_SUCCESS) {
        fprintf(stderr, "Could not create a context\n");
        exit(-1);
    }

    if (apr_getopt_init(&opt, context, argc, argv)) {
        fprintf(stderr, "failed to initialize opts\n");
        exit(-1);
    }

	 if (apr_pool_create(&sin, NULL) != APR_SUCCESS) {
				fprintf(stderr, "Could not create a sin pool");
				exit(-1);
	 }

	 if (apr_pool_create(&sout, NULL) != APR_SUCCESS) {
				fprintf(stderr, "Could not create a sout pool");
				exit(-1);
	 }

	 if (apr_pool_create(&serr, NULL) != APR_SUCCESS) {
				fprintf(stderr, "Could not create a serr pool");
				exit(-1);
	 }

	 /* Open stdin, stdout & stderr */

	 if (apr_file_open_stdin(&fp_in, sin) != APR_SUCCESS) {
				fprintf(stderr, "Could not open stdin");
				exit(-1);
	 }

	 if (apr_file_open_stdout(&fp_out, sout) != APR_SUCCESS) {
				fprintf(stderr, "Could not open stdout");
				exit(-1);
	 }

	 if (apr_file_open_stderr(&fp_err, serr) != APR_SUCCESS) {
				fprintf(stderr, "Could not open stderr");
				exit(-1);
	 }
	 
    while ((stat = apr_getopt(opt, "i:", &optchar, &optarg)) == APR_SUCCESS) {
        switch(optchar) {
        case 'i':
            bind_to_ipaddr = optarg;
            break;
        }
    }
    if (stat != APR_EOF) {
        apr_file_printf(fp_err,
                "usage: %s [-i local-interface-ip-address]\n",
                argv[0]);
        exit(-1);
    }

    if (bind_to_ipaddr) {
        /* First, parse/resolve ipaddr so we know what address family of
         * socket we need.  We'll use the returned sockaddr later when
         * we bind.
         */
        stat = apr_sockaddr_info_get(&localsa, bind_to_ipaddr, APR_UNSPEC, 8021, 0,
                               context);
        if (stat != APR_SUCCESS) {
            apr_file_printf(fp_err,
                    "Couldn't build the socket address correctly: %s\n",
                    apr_strerror(stat, buf, sizeof buf));
            exit(-1);
        }
        family = localsa->sa.sin.sin_family;
    }

    if (apr_socket_create(&sock, family, SOCK_STREAM, context) != APR_SUCCESS) {
        apr_file_printf(fp_err, "Couldn't create socket\n");
        exit(-1);
    }

	 fprintf(stdout, "created socket...\n");

    if (apr_setsocketopt(sock, APR_SO_NONBLOCK, 1) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Couldn't set socket option\n");
        exit(-1);
    }

	 fprintf(stdout, "Made socket NONBLOCKING...\n");

    if (apr_setsocketopt(sock, APR_SO_REUSEADDR, 1) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Couldn't set socket option\n");
        exit(-1);
    }

	 fprintf(stdout, "Made socket REUSEADDR...\n");

    if (!localsa) {
        apr_socket_addr_get(&localsa, APR_LOCAL, sock);
        apr_sockaddr_port_set(localsa, SERVICEPORT);
    }

    if ((stat = apr_bind(sock, localsa)) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Could not bind: %s\n",
                apr_strerror(stat, buf, sizeof buf));
        exit(-1);
    }
    
	 fprintf(stdout, "binding socket to %u...\n", SERVICEPORT);

    if (apr_listen(sock, 5) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Could not listen\n");
        exit(-1);
    }

	 fprintf(stdout, "listening to socket\n");

    apr_poll_setup(&sdset, 1, context);
    apr_poll_socket_add(sdset, sock, APR_POLLIN);
    
    rv = 1; 
    if (apr_poll(sdset, 1, &rv, -1) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Select caused an error\n");
        exit(-1);
    }
    else if (rv == 0) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "I should not return until rv == 1\n");
        exit(-1);
    }

	 fprintf(stdout, "polling socket\n");

    if (apr_accept(&sock2, sock, context) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Could not accept connection.\n");
        exit(-1);
    }
	 
	 fprintf(stdout, "accepting connection\n");

    apr_socket_addr_get(&remotesa, APR_REMOTE, sock2);
    apr_sockaddr_ip_get(&remote_ipaddr, remotesa);
    apr_sockaddr_port_get(&remote_port, remotesa);
    apr_socket_addr_get(&localsa, APR_LOCAL, sock2);
    apr_sockaddr_ip_get(&local_ipaddr, localsa);
    apr_sockaddr_port_get(&local_port, localsa);

    apr_file_printf(fp_out, "Server socket: %s:%u -> %s:%u\n", local_ipaddr, local_port, remote_ipaddr, remote_port);

    length = NAMELEN;

    if (apr_recv(sock2, user, &length) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_socket_close(sock2);
        apr_file_printf(fp_err, "Problem recving username\n");
        exit(-1);
    }

	 fprintf(stdout, "got the username...\n");

	 if( !(u = (oi_user *) malloc(sizeof(oi_user)))   ) {
				fprintf(stderr, "Error allocating memory for user structure\n");
				exit(-4);
	 }
	 
	 strncpy(u->name, user, NAMELEN);

	 fprintf(stdout, "I'm looking for \"%s\" (%d)...\n", u->name, strlen(u->name));

    length = STDIN_BUFFER_LEN * 2048;

	 if( !(mesg = (char*) malloc(sizeof(char)*length))   ) {
				fprintf(stderr, "Error allocating memory for message\n");
				exit(-4);
	 }
	
    if (apr_recv(sock2, mesg, &length) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_socket_close(sock2);
        apr_file_printf(fp_err, "Problem recving data\n");
        exit(-1);
    }
        
	 u->tty[0] = 0;
	 u->exists = 0;
	 u->login = 0;
	 u->mesg = 0;
	
	 if (!oi_user_exists(u)) {
				fprintf(stderr, "Stop talking to imaginary people!\n");
				exit(-1);
	 }

      
	 if (u->exists) {
	
				switch(oi_user_login(u)) {

						  case NOT_LOGGED_ON:

									 fprintf(stderr, "%s is not logged in", u->name);

									 if (u->tty[0]) printerr(" on %s", u->tty);
									 printerr(".\n");
									 exit(-1);
									 
									 break;

									 
									
						  case NOT_MESG_Y:

									 fprintf(stderr, "%s has messages turned off\n", u->name);
			  						 exit(-1);
			
									 break;

				}

	 }

	 snprintf(command, COMMANDLEN, "%s %s ", WRITE_BIN, u->name);

	 fprintf(stdout, "passing message over to write...\n");

	 if (u->tty[0]) strncat(command, u->tty, (COMMANDLEN - 1));

	 if (!(pipe = popen(command, "w"))) {
				fprintf(stderr, "Aaaagh! Can't open pipe!\n");
				exit(-1);
	 }

	 fprintf(pipe, "%s\n", mesg);

	 /* Close the pipe */

	 if(pclose(pipe) == -1) {
				perror("oi: failure");
				exit(1);
	 }

	 /* Success message */

	 printf("oi: %s", u->name);

	 if (u->tty[0]) printf(".%s", u->tty);
	

    length = STRLEN;
    if (apr_send(sock2, datarecv, &length) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_socket_close(sock2);
        apr_file_printf(fp_err, "Problem sending data\n");
        exit(-1);
    }

	 fprintf(stdout, "sending status message\n");
    
    if (apr_shutdown(sock2, APR_SHUTDOWN_READ) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_socket_close(sock2);
        apr_file_printf(fp_err, "Problem shutting down\n");
        exit(-1);
    }

	 fprintf(stdout, "shutdown socket...\n");
    
    if (apr_socket_close(sock2) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Problem closing down\n");
        exit(-1);
    }
    
	 fprintf(stdout, "shutdown socket...\n");
    
    if (apr_socket_close(sock) != APR_SUCCESS) {
        apr_file_printf(fp_err, "Problem closing down\n");
        exit(-1);
    }

	 fprintf(stdout, "closed socket...\n");

    return 1;
}
