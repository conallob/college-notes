/* $Id$ */

/* Oi's error handling - nicely centralised so I can replace it later if I
 * want.  Any function that reports an error should do it through this
 * interface.
 */

/* Should I include debugging statements in these functions?  I'm thinking that
 * I can either have error reporting with debugging or debugging with error
 * reporting; having neither is obviously silly, and having both is a recursion
 * nightmare.  Both are areas where the code should be simple, so no magic
 * recursion avoidance will be added.  I think I'll go with non-debugged error
 * reporting, debugged other error stuff (debug_get_file etc) and debugging with
 * error reporting/handling.
 */

#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#include <glib.h>

#include "debug.h"
#include "error.h"


/* Free the memory used by printerr_program_name to cut down on the output from
 * valgrind.  Not strictly necessary, but it tidies testing up.
 */

void printerr_free_name ( void );

/* Helper function used by printerr and die. */

void printerror ( const gchar * error_format, va_list error_args );

/* Exit immediately - usually called because of some fatal error.  Should not be
 * used for normal exit.  May cause a core dump for debugging at some point.  No
 * newline is added.
 */

void die ( const gchar * error_format, ... ) {
	va_list error_args;
	
	va_start ( error_args, error_format );
	printerror ( error_format, error_args );
	va_end ( error_args );

	_exit ( EXIT_FAILURE );
}

/* Print an error message to somewhere useful.  No newline is added. */

FILE * errors_to = NULL;
void printerr ( const gchar * error_format, ... ) {

	va_list error_args;
	
	va_start ( error_args, error_format );
	printerror ( error_format, error_args );
	va_end ( error_args );
}

/* Get and set the FILE used for error messages. */

FILE * printerr_get_file ( void ) {

	debug_sub_enter;
	debug_sub_exit;
	return ( errors_to );
}

void printerr_set_file ( FILE * errors_new ) {

	debug_sub_enter;
	errors_to = errors_new;
	debug_sub_exit;
}

/* Get and set the program name used in error messages - this is automatically
 * prepended to messages printed using printerr and die.  Note that the string
 * passed to printerr_set_name will be copied, not just referenced, and that the
 * string returned by printerr_get_name is a newly allocated copy, which you
 * should deallocate when finished with.
 */

gchar * printerr_program_name = NULL;
const gchar * printerr_get_name ( void ) {
	
	debug_sub_enter;
	debug_sub_exit;
	return ( g_strdup ( printerr_program_name ) );
}

void printerr_set_name ( const gchar * new_name ) {

	debug_sub_enter;
	debug_assert ( new_name != NULL, "Can't set program name to NULL" );
	if ( printerr_program_name == NULL ) {
		/* Register a cleanup function to be called at exit. */
		g_atexit ( printerr_free_name );
	} else {
		g_free ( printerr_program_name );
	}
	printerr_program_name = g_strdup ( new_name );
	debug_sub_exit;
}

/* Free the memory used by printerr_program_name to cut down on the output from
 * valgrind.  Not strictly necessary, but it tidies testing up.
 */

void printerr_free_name ( void ) {

	debug_sub_enter;
	debug_assert ( printerr_program_name != NULL,
			"printerr_free_name () called but printerr_program_name"
			" is NULL" );
	g_free ( printerr_program_name );
	debug_sub_exit;
}

/* Helper function used by printerr and die. */

void printerror ( const gchar * error_format, va_list error_args ) {

	/* This function may be called (indirectly) from printerr_set_file, so I
	 * don't want to call printerr_set_file, despite the code duplication.
	 * If printerr_set_file ever gets more complicated I may need to
	 * reconsider, but not at the moment.
	 */
	if ( errors_to == NULL ) {
		errors_to = stderr;
	}
	if ( printerr_program_name == NULL ) {
		printerr_set_name ( "YOU SHOULD HAVE CALLED"
				" printerr_set_name ()!!" );
	}
	fprintf ( errors_to, "%s: ", printerr_program_name );
	vfprintf ( errors_to, error_format, error_args );
}
