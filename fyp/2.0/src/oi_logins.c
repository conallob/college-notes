/*
** File: oi_logins.c 
** Desc: Routines to check if a username exists/is logged in
** Auth: Cian Synnott <pooka@redbrick.dcu.ie>
** Date: Mon Nov 16 03:30:11 GMT 1998
**
** $Id: oi_logins.c,v 1.3 2003/08/11 01:21:45 c-oi Exp $
*/

#include <sys/stat.h>
#include <unistd.h>

#include "apr_strings.h"

#include "oi_logins.h"
#include "utent.h"
//#include "aux.h"


/* Does a user exist on the system ? */
int oi_user_exists(oi_user *u) {
	return u->exists = (getpwnam(u->name) ? 1 : 0);
}

/* Check permissions of a device file ... */
int oi_mesg_on(char *tty) {
	char filename[FILENAME_MAX];
	struct stat s;

	apr_snprintf(filename, FILENAME_MAX, "/dev/%s", tty);

	if(tty[0]==':') /* we need to ignore ":0" type tty's on X systems */
		return 0;

	
	if (stat(filename, &s) == -1) 
		printerr_exit("Woah. Error statting %s in oi_mesg_on.\n", filename);

	if (s.st_mode & S_IWGRP)
		return 1;
	else 
		return 0;
}

/* Are toi logged on (to tty specified) ? 
** This is pretty full of conditional code, but it's just for the whole
** utmp/utmpx thing. Hopefully this won't happen many other places in the
** program */
int oi_user_login(oi_user *u) {

#ifndef HAVE_UTMPX_H
	struct utmp *ent;
#else
	struct utmpx *ent;
	
#define ut_name		ut_user
#define getutent()	getutxent()
#define setutent()  	setutxent()
#define endutent()	endutxent()

#endif

	setutent();

	while ((ent = getutent()) != NULL) {
		/* Skip unless it's the name we're interested in */
		if (strncmp (u->name, ent->ut_name, NAMELEN)) 
			continue;

#ifdef HAVE_UTMPX_H
		if(ent->ut_type != USER_PROCESS)	
			continue;
#endif

		/* It's one we want */
		if (!u->login) {
			if (u->tty[0]) {
				if (!strncmp(u->tty, ent->ut_line, TTYLEN)) {
					u->login = 1;
					break;
				}
			}
			else u->login = 1;
		}

		/* Check if mesg is on on this tty, but only if we've not already 
		** found a mesg y one */
		if (!u->mesg)
			u->mesg = oi_mesg_on(ent->ut_line);
		
	}

	endutent();

#ifndef HAVE_UTMPX_H

#undef ut_name
#undef getutent
#undef setutent
#undef endutent

#endif


	if (!u->login) 
		return NOT_LOGGED_ON;
	
	if (u->tty[0])
		u->mesg = oi_mesg_on(u->tty);
	
	if (!u->mesg) {
		return NOT_MESG_Y;
	}
	
	return LOGGED_ON;
}


/* detects the users mesg status */
mesg_flag my_mesg() {
	struct stat tty_stat;
	char *tty;

	if ((tty = ttyname(STDERR_FILENO)) == NULL ||
	     stat(tty, &tty_stat) < 0) {
		printerr_exit("oi: error detecting mesg status\n");
	}

	if (tty_stat.st_mode & S_IWGRP) {
		return MESG_Y;
	}
	
	return MESG_N;
}


/* sets the users mesg status */
int set_mesg(mesg_flag status) {
	struct stat tty_stat;
	char *tty;

        if ((tty = ttyname(STDERR_FILENO)) == NULL ||
             stat(tty, &tty_stat) < 0) {
                printerr_exit("oi: error detecting mesg status\n");
        }

	if(status == MESG_N) {
		if (!(chmod(tty, tty_stat.st_mode & 01777) < 0)) {
			return 1;
		}
	}
	else if(status == MESG_Y) {
		if (!(chmod(tty, tty_stat.st_mode | 01777) < 0)) {
			return 1;
		}
	}
   
	return 0;
}
                    
