/* 
 * File: milestone1.c 
 * Description: Milestone #1 - Simple Local Echo Test
 * Author: Conall O'Brien <conallob@maths.tcd.ie>
 * Date: $Date$
 * 
 * Id: $Id: /college/trunk/fyp/2.0/src/milestone1.c 2138 2006-02-07T21:25:22.382090Z conall  $
 */

#define STDIN_BUFFER_LEN 80

/* Use APR */
#include "apr.h"
#include "apr_file_io.h"

/* Use String manipulation functions */
#include <string.h>
#include <stdlib.h>


#include "linklist.h"

int main(int argc, char *argv[]) {

		  /* input buffer */
		  char buffer[STDIN_BUFFER_LEN];
		  item *tmp;
		  linklist *storage; 

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
					 /* Push contents of bufer onto a Linked List */
					 LinkListPush(storage, buffer);
		  }

		  /* Debug output */
		  apr_file_printf(fp_err, "Output:\n");

		  while(storage->size > 0) {
					 tmp = LinkListPop(storage);

					 /* Print out input buffer */
					 apr_file_printf(fp_out, tmp->val);
		  }

					 /* Print out input buffer */
					 apr_file_printf(fp_out, tmp->val);
		  }

		  exit(0); /* And I'm spent... */

					 /* Print out input buffer */
					 apr_file_printf(fp_out, tmp->val);
		  }

}
