/*
#include "apr_file_io.h"
*/

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#define WRITE_BIN "/usr/bin/write"

struct oi_user {
     char name[17]; /* + 1 for adding \0 termination */
     char tty[9]; /*   Same */
     char exists; 
     char login;
	  char mesg;
};
/*oi_user;*/
