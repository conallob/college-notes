// $Id$

#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <stdio.h>
#include "General.h"

extern int errno;  // The reason for an error
extern int sys_nerr;  // sys_errlist size
extern char *sys_errlist[];  // Descriptions of the errors

// Give the relevant system error message and terminate.
void syserr(char *msg)
{
   printf("Error: %s (%d: %s)\n",msg,errno,sys_errlist[errno]);
   exit(1);  // Terminate the program (system call)
}

