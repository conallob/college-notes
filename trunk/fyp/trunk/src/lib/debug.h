/* $Id$ */

/* Oi will have debugging built in from the start, rather than as an
 * afterthought.  See the individual function docs for more details.
 * Basically the idea is to sprinkle debugging statements throughout the code
 * that can be selectively enabled at run time, so when I'm debugging something
 * I can run 'oi --debug 6 tobinjt' and watch the info spew out.
 */

#ifndef DEBUG_H
#define DEBUG_H

#include <stdio.h>

#include <glib.h>

#include "error.h"

/* The various debugging levels. */
#define DEBUG_START	0
/* Off, obviously. */
#define DEBUG_OFF	0
/* Minimum debugging info - the major steps of the program. */
#define DEBUG_MINIMAL	1
/* Turn on warning messages for stuff. */
#define DEBUG_WARNING	2
/* Display general info about what's going on. */
#define DEBUG_INFO	3
/* Verbose info. */
#define DEBUG_VERBOSE	4
/* Print on entry and exit of subroutine calls. */
#define DEBUG_SUBS	5
/* Seriously verbose info - stuff that'll be printed each time through loops. */
#define DEBUG_LOOP_VERBOSE	6
/* Dump data structures my code generates. */
#define DEBUG_DUMP	7
/* Dump all data structures I can dump. */
#define DEBUG_DUMP_ALL	8
#define DEBUG_END	8

/* The eventual destination of all debug messages, these wrapper functions make
 * redirecting debug messages easier in future.  These are really meant for use
 * by debug.c only, but debug_sub_enter and debug_sub_exit use them.  No
 * newlines will be added.  The first line output will be indented
 * appropriately, based on the depth of the call stack.
 */

void debug_print_real ( const gchar * debug_format, ... );
void debug_print_vargs ( const gchar * debug_format, va_list debug_args );

/* Debugging messages will be printed only when the global debugging level is >=
 * the message's debugging level, so they're available when necessary. No
 * newline is added.  The first line output will be indented appropriately,
 * based on the depth of the call stack.
 */
void debug_print ( gsize debug_level, const gchar * debug_format, ... )
	G_GNUC_PRINTF( 2, 3 );

/* Set the global debug level */
void debug_set_level ( gsize debug_level );

/* Get the global debug level */
gsize debug_get_level ( void );

/* return TRUE if the global debug level is >= the given debug_level, FALSE
 * otherwise.  Useful if you want to pretty-print a struct when the debug level
 * is high enough, or perform sanity checks or something.
 */
gboolean debug_enabled ( gsize debug_level );

/* Helper functions for debug_sub_enter and debug_sub_exit. */

void debug_print_indent ( void );
void debug_indent_dec ( void );
void debug_indent_inc ( void );

/* I'll almost always be using gcc, but y'never know */
#ifdef __GNUC__
#define DEBUG_FUNCTION __FUNCTION__
#else
#define DEBUG_FUNCTION "(unknown function)"
#endif

/* Print message on sub entry, if global debug level is >= DEBUG_SUBS.
 * The message will be prefixed by spaces, twice the depth of the call stack.
 */
#ifdef __GNUC__
#define debug_sub_enter \
	do { \
		if ( debug_enabled ( DEBUG_SUBS ) ) { \
			debug_print_real ( "Entering %s\n", DEBUG_FUNCTION ); \
		} \
		debug_indent_inc ();\
	} while ( 0 )
#else
#define debug_sub_enter
#endif

/* Print message on sub exit, if global debug level is >= DEBUG_SUBS.
 * The message will be prefixed by spaces, twice the depth of the call stack.
 */

#ifdef __GNUC__
#define debug_sub_exit \
	do { \
		debug_indent_dec ();\
		if ( debug_enabled ( DEBUG_SUBS ) ) { \
			debug_print_real ( "Exiting  %s\n", DEBUG_FUNCTION ); \
		} \
	} while ( 0 )
#else
#define debug_sub_exit
#endif


/* die() if expr is false.  No newline will be added. */
#define DEBUG_ASSERT 1
#ifdef DEBUG_ASSERT
#define debug_assert( expr, message ) \
	do { \
		if ( ! ( expr ) ) { \
			die ( "%s: assertion failed: " \
					G_STRINGIFY ( expr ) ": %s", \
					DEBUG_FUNCTION, message ); \
		} \
	} while ( 0 )
#else
#define debug_assert( expr, message )
#endif

/* Get and set the FILE used for debug messages */

FILE * debug_get_file ( void );
void debug_set_file ( FILE * debug_new );

/* Print all the strings in printme, unchanged in any way, if the current
 * debugging level is >= debug_level.  Unlike other debug functions, this one
 * adds a newline to every string printed.
 */

void debug_print_string_array ( gsize debug_level, GPtrArray * printme );

#endif /* DEBUG_H */
