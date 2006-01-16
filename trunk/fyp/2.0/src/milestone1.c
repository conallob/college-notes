#include "apr.h"
#include "apr_file_io.h"
	
int main(int argc, char *argv[])
{
		  apr_pool_t *p;
		  apr_file_t *fp;

		  apr_initialize();

		  atexit(apr_terminate);
		  apr_pool_create(&p, NULL);

		  apr_file_open_stdout(&fp, p);
		  apr_file_printf(fp, "Hello World\n");

		  return 0;
}
