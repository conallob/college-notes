#include "oi_structs.h"
#include "oi_logins.h"
#include <string.h>

int main(int argc, char **argv) {

		  oi_user *u;
		  char command[64];
		  FILE *pipe;
		  char *ptr;

		  /*u = malloc(sizeof(oi_user));*/

		  strcpy(u->name, "conall");
		  u->tty[0] = 0;
		  u->exists = 0;
		  u->login = 0;
		  u->mesg = 0;

		  if (!oi_user_exist(u)) {
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

			sprintf(command, 64, "%s %s ", WRITE_BIN, u->name);		
			/*if (u->tty[0]) strncat(command, u->tty, 63);*/

			if (!(pipe = popen(command, "w"))) {
					  fprintf(stderr, "Aaaagh! Can't open pipe!\n");
					  exit(-1);
			}

			fprintf(pipe, "%s\n", ptr);

}


