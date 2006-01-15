/* $Id$ */

/* Oi will have debugging built in from the start, rather than as an
 * afterthought.  See the individual function docs for more details.
 * Basically the idea is to sprinkle debugging statements throughout the code
 * that can be selectively enabled at run time, so when I'm debugging something
 * I can run 'oi --debug 6 tobinjt' and watch the info spew out.
 */

#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#include <glib.h>

#include "debug.h"

/* We don't call debug_sub_enter or debug_sub_exit here because we'd just
 * endlessly recurse.
 */
volatile gsize debug_indent = 0;
volatile gsize debug_global = 0;

/* Debugging messages will be printed only when the global debugging level is >=
 * the message's debugging level, so they're available when necessary.  No
 * newline is added.  The first line output will be indented appropriately,
 * based on the depth of the call stack.
 */
void debug_print ( gsize debug_level, const gchar * debug_format, ... ) {

	va_list print_args;
	
	if ( debug_enabled ( debug_level ) ) {
		va_start ( print_args, debug_format );
		debug_print_vargs ( debug_format, print_args );
		va_end ( print_args );
	}
}


/* Set the global debug level */
void debug_set_level ( gsize debug_level ) {
	debug_sub_enter;
	debug_global = debug_level;
	debug_sub_exit;
}

/* Get the global debug level */
gsize debug_get_level ( void ) {
	debug_sub_enter;
	debug_sub_exit;
	return ( debug_global );
}

/* return TRUE if the global debug level is >= the given debug_level, FALSE
 * otherwise.  Useful if you want to pretty-print a struct when the debug level
 * is high enough, or perform sanity checks or something.
 */
gboolean debug_enabled ( gsize debug_level ) {
	return ( debug_global >= debug_level ? TRUE : FALSE );
}

/* Debugging messages will go to stderr by default, but you can't use it at
 * compile time.
 */

FILE * debug_to = NULL;

/* The eventual destination of all debug messages, these wrapper functions make
 * redirecting debug messages easier in future.  The first line output will be
 * indented appropriately, based on the depth of the call stack.
 */

void debug_print_real ( const gchar * debug_format, ... ) {

	va_list print_args;
	
	if ( debug_to == NULL ) {
		debug_to = stderr;
	}

	debug_print_indent ();
	va_start ( print_args, debug_format );
	vfprintf ( debug_to, debug_format, print_args );
	va_end ( print_args );
}

void debug_print_vargs ( const gchar * debug_format, va_list debug_args ) {

	if ( debug_to == NULL ) {
		debug_to = stderr;
	}

	debug_print_indent ();
	vfprintf ( debug_to, debug_format, debug_args );
}

/* Get and set the FILE used for debug messages */

FILE * debug_get_file ( void ) {

	debug_sub_enter;
	debug_sub_exit;
	return ( debug_to );
}
void debug_set_file ( FILE * debug_new ) {

	debug_sub_enter;
	debug_assert ( debug_new != NULL, "You can't set the debugging"
			" output FILE to NULL" );
	debug_to = debug_new;
	debug_sub_exit;
}

/* Helper functions for debug_sub_enter and debug_sub_exit. */
void debug_print_indent ( void ) {

	gsize i;

	if ( debug_to == NULL ) {
		debug_to = stderr;
	}

	for ( i = 0; i < debug_indent; i++ ) {
		fprintf ( debug_to, "  " );
	}
}

void debug_indent_dec ( void ) {
	debug_indent--;
}

void debug_indent_inc ( void ){
	debug_indent++;
}

/* Print all the strings in printme, unchanged in any way, if the current
 * debugging level is >= debug_level.  Unlike other debug functions, this one
 * adds a newline to every string printed.
 */

void debug_print_string_array ( gsize debug_level, GPtrArray * printme ) {

	GString * string;
	gsize i;

	debug_sub_enter;

	debug_assert ( printme != NULL, "passed a NULL printme array" );

	if ( debug_enabled ( debug_level ) ) {
		for ( i = 0; i < printme->len; i++ ) {
			string = g_ptr_array_index ( printme, i );
			debug_print_real ( "%s\n", string->str );
		}
	}

	debug_sub_exit;
}
