/*#ifndef _oi_logins_h_
#define _oi_logins_h_
*/

/*
 * File: oi_logins.h 
 * Desc: Routines to check if a username exists/is logged in
 * Auth: Cian Synnott <pooka@redbrick.dcu.ie>
 * Date: Mon Nov 16 03:33:41 GMT 1998
 *
 * $Id$
 */

#include <pwd.h>


#include "oi_structs.h"
/*#include "oi_arg.h"*/

/* Does a user exist on the system ? */
extern int oi_user_exists(oi_user *u); 

/* Are toi logged on (and on the tty specified)? */
extern int oi_user_login(oi_user *u);

/* Mesg flags */
typedef enum _mesg_flag {MESG_N,MESG_Y} mesg_flag;

/* Am I mesg y? */
extern mesg_flag my_mesg();

/* set my mesg status */
extern int set_mesg(mesg_flag);

/* Possible return values for oi_user_login */
enum {
	NOT_LOGGED_ON,
	NOT_MESG_Y,
	LOGGED_ON
};

/*#endif*/
