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

#define STRLEN 15

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
	char buffer[STDIN_BUFFER_LEN];
	item *tmp;
	linklist *storage; 

	int i = 0; /* loop counter */

	/* Initialise APR */
	apr_initialize(); 
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

	#ifdef DEBUG
		apr_file_printf(fp_err, "Input:\n"); 
	#endif
	
	/* Until we hit the end of stdin, grab 80 characters from stdin 
	 * and store in buffer */
	while (apr_file_gets(buffer, STDIN_BUFFER_LEN, fp_in) == 0) {
		/* Push contents of buffer onto a Linked List */
      LinkListPush(storage, strdup(buffer));
	}

	datasend = LinkListMerge(storage);

	 #ifdef DEBUG
		apr_file_printf(fp_err, "Output:\n");
	 #endif

    setbuf(stdout, NULL);
    if (argc > 1) {
        dest = argv[1];
    }

    if (argc > 2) {
        read_timeout = APR_USEC_PER_SEC * atoi(argv[2]);
    }

    if (apr_initialize() != APR_SUCCESS) {
        apr_file_printf(fp_err, "Something went wrong\n");
        exit(-1);
    }

    atexit(closeapr);

    if (apr_pool_create(&context, NULL) != APR_SUCCESS) {
        apr_file_printf(fp_err, "Something went wrong\n");
        exit(-1);
    }

    if ((stat = apr_sockaddr_info_get(&remote_sa, dest, APR_UNSPEC, 8021, 0, context)) 
        != APR_SUCCESS) {
        apr_file_printf(fp_err, "Address resolution failed for %s: %s\n", 
                dest, apr_strerror(stat, msgbuf, sizeof(msgbuf)));
        exit(-1);
    }

    if (apr_socket_create(&sock, remote_sa->sa.sin.sin_family, SOCK_STREAM,
                          context) != APR_SUCCESS) {
        apr_file_printf(fp_err, "Couldn't create socket\n");
        exit(-1);
    }

    stat = apr_connect(sock, remote_sa);

    if (stat != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Could not connect: %s (%d)\n", 
				apr_strerror(stat, msgbuf, sizeof(msgbuf)), stat);
        fflush(stderr);
        exit(-1);
    }

    apr_socket_addr_get(&remote_sa, APR_REMOTE, sock);
    apr_sockaddr_ip_get(&remote_ipaddr, remote_sa);
    apr_sockaddr_port_get(&remote_port, remote_sa);
    apr_socket_addr_get(&local_sa, APR_LOCAL, sock);
    apr_sockaddr_ip_get(&local_ipaddr, local_sa);
    apr_sockaddr_port_get(&local_port, local_sa);

	 #ifdef DEBUG
    	apr_file_printf(fp_out, "Client socket: %s:%u -> %s:%u\n", 
				local_ipaddr, local_port, remote_ipaddr, remote_port);
	 #endif

    length = strlen(datasend);

    if (apr_send(sock, datasend, &length) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Problem sending data\n");
        exit(-1);
    }
   
    stat = apr_setsocketopt(sock, APR_SO_TIMEOUT, read_timeout);
    if (stat) {
        apr_file_printf(fp_err, "Problem setting timeout: %d\n", stat);
        exit(-1);
    }

    length = STRLEN; 

    if ((stat = apr_recv(sock, datarecv, &length)) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Problem receiving data: %s (%d)\n", 
				apr_strerror(stat, msgbuf, sizeof(msgbuf)), stat);
        exit(-1);
    }

    if (apr_shutdown(sock, APR_SHUTDOWN_WRITE) != APR_SUCCESS) {
        apr_socket_close(sock);
        apr_file_printf(fp_err, "Could not shutdown socket\n");
        exit(-1);
    }

    if (apr_socket_close(sock) != APR_SUCCESS) {
        apr_file_printf(fp_err, "Could not shutdown socket\n");
        exit(-1);
    }

	exit(0); /* And I'm spent... */
}
