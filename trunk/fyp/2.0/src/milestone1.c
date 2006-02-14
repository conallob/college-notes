/* 
 * File: milestone1.c 
 * Description: Milestone #1 - Simple Local Echo Test
 * Author: Conall O'Brien <conallob@maths.tcd.ie>
 * Date: $Date$
 * 
 * Id: $Id$
 */

#define STDIN_BUFFER_LEN 80

/* Use APR */
#include "apr.h"
#include "apr_file_io.h"

#include "dyn_page.h"

/* Use String manipulation functions */
#include <string.h>


#include "linklist.h"

int main(int argc, char *argv[]) {

		  /* input buffer */
		  char *buffer;  
		  char *storage = "\0";  

		  int i = 0; /* loop counter */

		  /* APR pools, 1 for stdin, stdout & stderr */
		  apr_pool_t *p, *q, *e; 

		  /* APR files, for stdin, stdout & stderr */
		  apr_file_t *fp_in, *fp_out, *fp_err; 

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

		  /* Debug output */
		  apr_file_printf(fp_err, "Input:\n"); 

		  /* Until we hit the end of stdin, grab 80 characters from stdin 
			* and store in buffer */
		  while (apr_file_gets(buffer, STDIN_BUFFER_LEN, fp_in) == 0) {
					 /* Push contents of buffer onto a Linked List */
					 LinkListPush(storage, strdup(buffer));
		  }

		  /* Debug output */
		  apr_file_printf(fp_err, "Output:\n");

		  /* Print out input buffer */
		  apr_file_printf(fp_out, storage);

		  exit(0); /* And I'm spent... */

					 /* Print out input buffer */
					 apr_file_printf(fp_out, tmp->val);
		  }

}
