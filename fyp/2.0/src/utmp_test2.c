/*
** File: hey_main.c
** Desc: main() function for hey
** Auth: Cian Synnott <pooka@redbrick.dcu.ie>
** Date: Tue Nov 10 18:50:57 GMT 1998
**
** $Id: hey_main.c,v 1.8 2004/02/19 21:50:34 c-hey Exp $
*/

#include "oi_logins.h"
#include "aux.h"

#define COMMANDLEN 64

#define WRITE_PROG "/usr/bin/write"

/* the initial mesg status */
mesg_flag init_mesg_status;


int main(int argc, char *argv[]) {
	char command[COMMANDLEN];
	oi_user *u; 
	FILE *pipe;
	char *ptr;


	/* Setup signal handlers and parse environment & options */

/*	
 	oi_signal_setup();
	oi_terminal_setup();
	oi_get_env();
	oi_parse_options(argc, argv);
*/

	/* Warn if a user isn't logged on/doesn't exist */
	strncpy(u->name, argv[1], 16);

	/* Firstly, do toi exist? */
	if (!oi_user_exists(u)) {
		printerr("oi: warning - %s does not exist\n", u->name);
	}

	/* Check if toi're logged in on terminal specified (if any) */
	switch (oi_user_login(u)) {
		case NOT_LOGGED_ON:
			printerr("oi: warning - %s is not logged in", u->name);
			if (u->tty[0]) printerr(" on %s", u->tty);
			printerr(".\n");
			break;

		case NOT_MESG_Y:
			printerr("oi: warning - %s has messages disabled", u->name);
			if (u->tty[0]) printerr(" on %s", u->tty);
			printerr(".\n");
			break;
	
	}


	/* Read user input and then format it */

	/*
	oi_user_input();
	oi_format_input();
	*/

	/* deal with their mesg status */
/*	init_mesg_status = my_mesg();		
	if (init_mesg_status == MESG_N) {
		if(!set_mesg(MESG_Y)) {
			printerr_exit("oi: error going mesg y\n");
		}
	}
	*/
	/* call oi_cleanup when we exit */
/*	atexit(oi_cleanup);	*/

	/* Iterate through user list */

		if (!u->exists) { 
			printerr("oi: %s does not exist\n", u->name);
		}
		else if (!u->login) {
			printerr("oi: %s is not logged in", u->name);
			if (u->tty[0]) printerr(" on %s", u->tty);
			printerr(".\n");
		}
		else if (!u->mesg) {
			printerr("oi: %s has messages disabled", u->name);
			if (u->tty[0]) printerr(" on %s", u->tty);
			printerr(".\n");
		}

		/* Prepare to cycle through the page & print it out */
	
		/* Open the pipe to write */
		snprintf(command, COMMANDLEN, "%s %s ", WRITE_PROG, u->name);
		if (u->tty[0]) strncat(command, u->tty, COMMANDLEN - 1);
		if (!(pipe = popen(command, "w"))) 
			printerr_exit("oi: couldn't open pipe to write.\n");

		/* Print out the page to write */

		ptr = "Testing 123\n";

		fprintf(pipe, "%s\n", ptr);

		/* Close the pipe */
		if(pclose(pipe) == -1) {
			perror("oi: failure");
			exit(1);
		}

		/* Success message */
		printf("oi: %s", u->name);
		if (u->tty[0]) printf(".%s", u->tty);
		printf(" - success\n");
   
	return 0;
}

