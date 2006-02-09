/* 
 * File: milestone1.c 
 * Description: Milestone #1 - Simple Local Echo Test
 * Author: Conall O'Brien <conallob@maths.tcd.ie>
 * Date: $Date$
 * 
 * Id: $Id: /college/trunk/fyp/2.0/src/milestone1.c 2138 2006-02-07T21:25:22.382090Z conall  $
 */

/* Use APR */
#include "apr.h"
#include "apr_file_io.h"

#include "dyn_page.h"

/* Use String manipulation functions */
#include <string.h>
#include <stdlib.h>


int main(int argc, char *argv[]) {

		  /* input buffer */
		  char *buffer;  
		  char *storage = "\0";  

		  int i = 0; /* loop counter */

		  /* APR pools, 1 for stdin, stdout & stderr */
		  apr_pool_t *p, *q, *e; 
		  /* APR files, for stdin, stdout & stderr */
		  apr_file_t *fp_in, *fp_out, *fp_err; 

		  apr_initialize(); /* Initialise APR */

		  atexit(apr_terminate);

		  apr_pool_create(&e, NULL); /* initialise APR pool e */
		  apr_pool_create(&p, NULL); /* initialise APR pool p */
		  apr_pool_create(&q, NULL); /* initialise APR pool q */

		  /* Open stdin, stdout & stderr */
		  apr_file_open_stderr(&fp_err, e); 
		  apr_file_open_stdin(&fp_in, p);   
		  apr_file_open_stdout(&fp_out, q); 

		  /* Debug output */
		  apr_file_printf(fp_err, "Input:\n"); 

		  /* Grab 80 characters from stdin and store in buffer */
		  while(!= EOF) {
					 apr_file_gets(buffer, 80, fp_in); 
					 strcat(storage, buffer);
		  }

		  /* Debug output */
		  apr_file_printf(fp_err, "Output:\n");

		  /* Print out input buffer */
		  apr_file_printf(fp_out, storage);

		  exit(0); /* And I'm spent... */

}
