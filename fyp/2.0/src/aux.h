#ifndef _aux_h_
#define _aux_h_

/*
** File: aux.h
** Desc: Some generally useful functions for c-hey ...
** Auth: Cian Synnott <pooka@redbrick.dcu.ie>
** Date: Mon Dec 14 16:28:43 GMT 1998
**
** $Id: aux.h,v 1.2 2001/12/30 23:26:06 c-hey Exp $
*/

/*
#include "config.h"
*/

/* Do 'perror(msg)' and then exit with error .. */
extern void perror_exit(char *msg);

/* Printf-formatted error to stderr, then exit .. */
extern void printerr_exit(char *fmt, ...);

/* Printf-formatted error, but no exit ... */
extern void printerr(char *fmt, ...);

/* If there's no strdup() available, use my own */
/*
#ifndef HAVE_STRDUP


extern char *mystrdup(const char *str);


#define strdup mystrdup

#endif
*/

/* Memory allocating strcat function */

/*
	extern char *m_strcat(char *string, char *cat);
*/

#endif
