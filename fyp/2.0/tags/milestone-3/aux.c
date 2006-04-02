/*
** File: aux.c
** Desc: Some generally useful functions for c-hey ...
** Auth: Cian Synnott <pooka@redbrick.dcu.ie>
** Date: Mon Dec 14 16:28:43 GMT 1998
**
** $Id: aux.c,v 1.3 2003/08/11 01:21:45 c-hey Exp $
*/

#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "aux.h"

/* Do 'perror(msg)' and then exit with error .. */
void perror_exit(char *msg) {
	perror(msg);
	exit(1);
}

/* Printf-formatted error to stderr, then exit .. */
void printerr_exit(char *fmt, ...) {
	va_list args;

	va_start(args, fmt);
	vfprintf(stderr, fmt, args);

	exit(1);
}
	
/* Printf-formatted error, but no exit ... */
void printerr(char *fmt, ...) {
	va_list args;

	va_start(args, fmt);
	vfprintf(stderr, fmt, args);

	return;
}

/* If there's no system strdup(), make one up */
/*
#ifndef HAVE_STRDUP

char *mystrdup(const char *str) {
	char *ptr;

	if ((ptr = (char *) malloc(strlen(str) + 1)) == NULL) 
		return NULL;

	strncpy(ptr, str, strlen(str));

	return ptr;
}

#endif
*/

/* strcat functions, which dynamically allocates extra space as needed */

/*
char * m_strcat(char *string, char *cat) {

	if((string = realloc(string, strlen(string) + strlen(cat) + 1)) == NULL) {
		perror_exit("hey: out of memory\n");
	}

	strcpy(&string[strlen(string)] , cat);

	return string;
}
*/
