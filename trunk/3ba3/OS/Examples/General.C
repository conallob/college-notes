#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include "General.h"

extern int errno;  // The reason for an error
extern int sys_nerr;  // sys_errlist size
extern char *sys_errlist[];  // Descriptions of the errors

// Give the relevant system error message and terminate.
void syserr(char *msg)
{
   if ((errno > 0) && (errno < sys_nerr))
      printf("Error: %s (%d: %s)\n",msg,errno,sys_errlist[errno]);
   else printf("Error: %s (%d)\n",msg,errno);
   exit(1);  // Terminate the program (system call)
}

