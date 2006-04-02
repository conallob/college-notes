/*
#include "apr_file_io.h"
*/

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

struct _oi_user_ {
     char name [17]; /* + 1 for adding \0 termination */
     char tty  [9]; /*   Same */
     char exists; 
     char login;
	  char mesg;
};

typedef struct _oi_user_ oi_user;

