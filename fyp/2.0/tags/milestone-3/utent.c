/*
** File: utent.c
** Desc: A replacement for the *ut* functions not provided by some systems
** Auth: Cian Synnott <pooka@redbrick.dcu.ie>
** Date: Thu May  6 15:43:54 IST 1999
**
** $Id: utent.c,v 1.3 2003/08/11 01:21:45 c-hey Exp $
*/

#include "utent.h"

/*
static int utfile;

void setutent(void) {
	if ((utfile = open(_PATH_UTMP, O_RDONLY)) < 0) {	
		printf("Argh. Couldn't open %s, for some reason.\n", _PATH_UTMP);
		exit(1);
	}
}

struct utmp *getutent(void) {
	static struct utmp u;
	int ret;

	ret = read(utfile, (void *)&u, sizeof(struct utmp));
	switch(ret) {
		case -1: 
			printf("Argh. Error reading from %s, for some reason.\n", _PATH_UTMP);
			break;
		case 0:
			return NULL;
			break;
	}
	
	return &u;

}

void endutent(void) {
	close(utfile);
}
*/
