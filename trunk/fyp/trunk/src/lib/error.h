/* $Id$ */

/* Oi's error handling - nicely centralised so I can replace it later if I
 * want.  Any function that reports an error should do it through this
 * interface.
 */

#ifndef ERROR_H
#define ERROR_H

#include <stdio.h>
#include <glib.h>

/* Exit immediately - usually called because of some fatal error.  Should not be
 * used for normal exit.  May cause a core dump for debugging at some point.  No
 * newline is added.
 */

void die ( const gchar * error_format, ... )
	G_GNUC_PRINTF( 1, 2 )
	G_GNUC_NORETURN;

/* Print an error message to somewhere useful.  No newline is added. */

void printerr ( const gchar * error_format, ... )
	G_GNUC_PRINTF( 1, 2 );

/* Get and set the FILE used for error messages. */

FILE * printerr_get_file ( void );
void printerr_set_file ( FILE * errors_new );

/* Get and set the program name used in error messages - this is automatically
 * prepended to messages printed using printerr and die.
 */

const gchar * printerr_get_name ( void );
void printerr_set_name ( const gchar * );

#endif /* ERROR_H */
