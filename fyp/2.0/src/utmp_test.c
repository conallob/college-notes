/* $Id$ */

/*
 * #include "oi_structs.h"
 */
#include "oi_logins.h"
#include "utent.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h> 

#define WRITE_BIN "/usr/bin/write"
#define COMMANDLEN 64

int main(int argc, char **argv) {

		  oi_user *u;

		  char command[COMMANDLEN];
		  FILE *pipe;
		  char *ptr;

		  strncpy(u->name, argv[1], NAMELEN);

		  u->tty[0] = 0;
		  u->exists = 0;
		  u->login = 0;
		  u->mesg = 0;

		  ptr = "Testing 123\n";

		  if (!oi_user_exists(u)) {
					 fprintf(stderr, "Stop talking to imaginary people!");
					 exit(-1);
		  }

		  if (u->exists) {
					switch(oi_user_login(u)) {
							  case NOT_LOGGED_ON:
										 fprintf(stderr, "%s is not logged in on tty %s\n", u->name, u->tty);
										 break;

								case NOT_MESG_Y:
										 fprintf(stderr, "%s has messages turned off\n", u->name);
										 break;

								default:
										 exit(-1);
					}
		  }

			snprintf(command, COMMANDLEN, "%s %s ", WRITE_BIN, u->name);		

			if (u->tty[0]) strncat(command, u->tty, (COMMANDLEN - 1));

			if (!(pipe = popen(command, "w"))) {
					  fprintf(stderr, "Aaaagh! Can't open pipe!\n");
					  exit(-1);
			}

			fprintf(pipe, "%s\n", ptr);

}


