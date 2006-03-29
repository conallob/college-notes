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

#define NAMELEN 16

int main(int argc, char **argv) {

		  oi_user *u;

		  char command[COMMANDLEN];
		  FILE *pipe;
		  char *ptr;

		  if( !(u = (oi_user *) malloc(sizeof(oi_user)))	) {
					 fprintf(stderr, "Error allocating memory for user structure\n");
					 exit(-4);
		  }

		  strncpy(u->name, argv[1], NAMELEN);

		  u->tty[0] = 0;
		  u->exists = 0;
		  u->login = 0;
		  u->mesg = 0;

		  ptr = "Testing 123\n";

		  if (!oi_user_exists(u)) {
					 fprintf(stderr, "Stop talking to imaginary people!\n");
					 exit(-1);
		  }

		  fprintf(stdout, "u->name is %s\n", u->name);

		  fprintf(stdout, "u->exists is set to %d\n", u->exists);
		  
		  fprintf(stdout, "oi_user_login(u) is %d\n", oi_user_exists(u));

		  if (u->exists) {
					switch(oi_user_login(u)) {
							  case NOT_LOGGED_ON:
										 fprintf(stderr, "%s is not logged in", u->name);
										 if (u->tty[0]) printerr(" on %s", u->tty);
										 printerr(".\n");
										 exit(-1);
										 break;

								case NOT_MESG_Y:
										 fprintf(stderr, "%s has messages turned off\n", u->name);
										 exit(-1);
										 break;

					}
		  }
			snprintf(command, COMMANDLEN, "%s %s ", WRITE_BIN, u->name);		
			if (u->tty[0]) strncat(command, u->tty, (COMMANDLEN - 1));

			if (!(pipe = popen(command, "w"))) {
					  fprintf(stderr, "Aaaagh! Can't open pipe!\n");
					  exit(-1);
			}

			fprintf(pipe, "%s\n", ptr);

			/* Close the pipe */
			if(pclose(pipe) == -1) {
					  perror("hey: failure");
					  exit(1);
			}
			
			/* Success message */
			printf("oi: %s", u->name);
			if (u->tty[0]) printf(".%s", u->tty);

			printf(" - sent\n");

			return 0;
}


