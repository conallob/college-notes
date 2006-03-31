/* 
 * File: oi_client.c 
 * Description: Client to read in and transmit a message
 * Author: Conall O'Brien <conallob@maths.tcd.ie>
 * $Date: 2006-02-20T21:20:07.467301Z $
 * 
 * $Id$ 
 */

#include "apr.h"
#include "apr_file_io.h"
#include "apr_network_io.h"
#include "apr_errno.h"
#include "apr_general.h"

#include <string.h>
#include <stdlib.h>
#include <errno.h>

#include "linklist.h"

#define OI_VERSION 2.01
#define STRLEN 15
#define SERVICEPORT 5222

static void closeapr(void) {
    apr_terminate();
}

int main(int argc, char *argv[]) {

    apr_pool_t *context, *p, *q, *e;
    apr_socket_t *sock;
    apr_size_t length;
    apr_status_t stat;
    char *datasend;
    char datarecv[STRLEN];
    char msgbuf[80];
    char *local_ipaddr, *remote_ipaddr;
    char *dest = "localhost";
	 apr_file_t *fp_in, *fp_out, *fp_err; 
    apr_port_t local_port, remote_port;
    apr_interval_time_t read_timeout = 2 * APR_USEC_PER_SEC;
    apr_sockaddr_t *local_sa, *remote_sa;

	/* input buffer */
	char buffer[STDIN_BUFFER_LEN], *username, *host, *brkt;
	item *tmp;
	linklist *storage; 

	int i = 0; /* loop counter */

	/* initialise APR... */
   if (apr_initialize() != APR_SUCCESS) {
       apr_file_printf(fp_err, "Something went wrong initialising APR\n");
       exit(-1);
   }

   atexit(closeapr);

	atexit(apr_terminate);

	storage = (linklist*) LinkListMkList();

	/* initialise APR pool e, p, q */
	apr_pool_create(&e, NULL);
	apr_pool_create(&p, NULL);
	apr_pool_create(&q, NULL);

	/* Open stdin, stdout & stderr */
	apr_file_open_stderr(&fp_err, e); 
	apr_file_open_stdin(&fp_in, p);   
	apr_file_open_stdout(&fp_out, q); 

	/* Until we hit the end of stdin, grab 80 characters from stdin 
	 * and store in buffer */
	while (apr_file_gets(buffer, STDIN_BUFFER_LEN, fp_in) == 0) {
		/* Push contents of buffer onto a Linked List */
      LinkListPush(storage, strdup(buffer));
	}

	/* condense the contents of storage into a single string */
	datasend = LinkListMerge(storage);

   setbuf(stdout, NULL);

	if (argc > 0) {
		apr_file_printf(fp_out, "this is oi, version %d\n", OI_VERSION);
		exit(0);
	}
	
   if (argc > 1) {
	   /* expect user@example.com as value for argv[1] */

	   /* the first part before '@' is the username */
      username = strtok_r(argv[1], "@", &brkt); 

	   /* now check to see if there is something beyond '@'
	  	*	if so, that's the remote host, if not
	  	*	just talk to localhost...
	  	*/
	   if( !(dest = strtok_r(NULL, "@", &brkt)) ) 
	  		 dest = "localhost";
   }

	 /* accept an optional timeout (in secs) from argv[2] */
    if (argc > 2) {
        read_timeout = APR_USEC_PER_SEC * atoi(argv[2]);
    }


	 /* create pool called context */
    if (apr_pool_create(&context, NULL) != APR_SUCCESS) {
        apr_file_printf(fp_err, "Something went wrong creating APR pool context\n");
        exit(-1);
    }

	 /*  */
    if ((stat = apr_sockaddr_info_get(&remote_sa, dest, APR_UNSPEC, SERVICEPORT, 0, context)) 
        != APR_SUCCESS) {
        apr_file_printf(fp_err, "Address resolution failed for %s: %s\n", 
                dest, apr_strerror(stat, msgbuf, sizeof(msgbuf)));
        exit(-1);
    }

	 /*  */
    if (apr_socket_create(&sock, remote_sa->sa.sin.sin_family, SOCK_STREAM,
                          context) != APR_SUCCESS) {
        apr_file_printf(fp_err, "Couldn't create socket\n");
        exit(-1);
    }

	 /* ET phone home... */
    stat = apr_connect(sock, remote_sa);

	 /* "I'm sorry, there is nobdy to take your call..." */
    if (stat != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Could not connect: %s (%d)\n", 
				apr_strerror(stat, msgbuf, sizeof(msgbuf)), stat);
        fflush(stderr);
        exit(-1);
    }

	 /*  */
    apr_socket_addr_get(&remote_sa, APR_REMOTE, sock);
    apr_sockaddr_ip_get(&remote_ipaddr, remote_sa);
    apr_sockaddr_port_get(&remote_port, remote_sa);

	 /*  */
    apr_socket_addr_get(&local_sa, APR_LOCAL, sock);
    apr_sockaddr_ip_get(&local_ipaddr, local_sa);
    apr_sockaddr_port_get(&local_port, local_sa);

	 /* #ifdef DEBUG */
    	apr_file_printf(fp_out, "Client socket: %s:%u -> %s:%u\n", 
				local_ipaddr, local_port, remote_ipaddr, remote_port);
	 /* #endif */

    length = strlen(username);

	 /* send the username to the remote node... */
    if (apr_send(sock, username, &length) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Problem sending data\n");
        exit(-1);
    }
   
    length = strlen(datasend);

	 /* send the payload to the remote node... */
    if (apr_send(sock, datasend, &length) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Problem sending data\n");
        exit(-1);
    }
   
	 /* set the socke timeout... */
    stat = apr_setsocketopt(sock, APR_SO_TIMEOUT, read_timeout);
    if (stat) {
        apr_file_printf(fp_err, "Problem setting timeout: %d\n", stat);
        exit(-1);
    }

    length = STRLEN; 

	 /* receive status message from the remote node */
    if ((stat = apr_recv(sock, datarecv, &length)) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Problem receiving data: %s (%d)\n", 
				apr_strerror(stat, msgbuf, sizeof(msgbuf)), stat);
        exit(-1);
    }

	 /* shut down socket... */
    if (apr_shutdown(sock, APR_SHUTDOWN_WRITE) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Could not shutdown socket\n");
        exit(-1);
    }

	 /* close socket... */
    if (apr_socket_close(sock) != APR_SUCCESS) {
        apr_file_printf(fp_err, "Could not shutdown socket\n");
        exit(-1);
    }

	exit(0); /* And I'm spent... */
}
