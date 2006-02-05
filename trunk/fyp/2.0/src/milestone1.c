// $Id$

#include "apr.h"
#include "apr_file_io.h"

#include <string.h>
	
int main(int argc, char *argv[]) {

		  char *buffer;
		  char* storage;

		  int i = 0;

		  apr_pool_t *p, *q;
		  apr_file_t *fp_in, *fp_out;

		  apr_initialize();

		  atexit(apr_terminate);

		  apr_pool_create(&p, NULL);
		  apr_pool_create(&q, NULL);

		  apr_file_open_stdin(&fp_in, p);
		  apr_file_open_stdout(&fp_out, q);

		  apr_file_printf(fp_out, "Input:\n");

		  apr_file_gets(buffer, 80, fp_in);
		  strcpy(buffer, storage);
		 
		  apr_file_printf(fp_out, "Output:\n");

		  apr_file_printf(fp_out, storage);

		  return 0;

}
