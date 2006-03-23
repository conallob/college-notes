/*
#ifndef _utent_h_
#define _utent_h_
*/

/*
** File: utent.h
** Desc: A replacement for the *ut* functions not provided in some
**       benighted backwaters. ;o) Also sorts out the use of getuxent()
** Auth: Cian Synnott <pooka@redbrick.dcu.ie>
** Date: Thu May  6 15:43:54 IST 1999
**
** $Id: utent.h,v 1.2 2001/12/30 23:26:06 c-hey Exp $
*/

#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

//#include "config.h"

/* Include the right flavour of utmp */
/*
#ifndef HAVE_UTMPX_H

#include <utmp.h>

#else
*/
#include <utmpx.h>
/*
#endif
*/
/* If the system isn't providing getutent() and friends, we'll have to */

/*
#ifndef HAVE_GETUTENT

void setutent();
struct utmp *getutent();
void endutent();

#endif


#endif

*/
