#include <unistd.h>
#include <strings.h>
#include "General.h"

main()
{
  char* output_string = "Hello World.\n";
  if (write( STDOUT_FILENO, output_string, strlen(output_string) ) == -1)
    syserr("Write failed");
}
