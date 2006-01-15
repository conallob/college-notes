/* $Id$ */
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include "read_message.h"

#include <glib.h>
#include <readline/readline.h>
#include "debug.h"
#include "error.h"

/* Clear the screen and redisplay the full message when the user types ^L. */

int redisplay_message ( G_GNUC_UNUSED int count, G_GNUC_UNUSED int key );

/* Required in both read_message () and redisplay_message (). */

GPtrArray * message_being_read;

/* Reads an unlimited number of lines of unlimited length from the user,
 * returning them in a GPtrArray of GStrings which is the responsibility of the
 * caller to free.  The message will be completely unchanged, except: trailing
 * newlines will be removed, and the terminitating line will be discarded.
 * 
 * Internally this uses readline () for user convenience, so refer to the
 * readline () docs for customisation info, including how to read from an
 * alternate source.
 *
 * The really clever bit is that when the user types ^L the entire message, plus
 * additional information, will be displayed :)
 */

GPtrArray * read_message ( void ) {

	GPtrArray * message;
	GString * new_line;
	gchar * line_read;
	gsize eof = 0;

	gchar * error_message;

	rl_command_func_t * tab, * ctrl_l;

	debug_sub_enter;

	error_message = g_strdup_printf ( "compiled with readline version %s, "
			"linked against readline version %d",
			G_STRINGIFY ( RL_READLINE_VERSION ),
			rl_readline_version );
	debug_assert ( RL_READLINE_VERSION == rl_readline_version,
			error_message );
	g_free ( error_message );
	debug_print ( DEBUG_VERBOSE, "passed sanity check of "
			"readline compile-time version versus "
			"readline link-time version\n" );

	debug_print ( DEBUG_VERBOSE, "rebinding keys\n" );
	/* We want tabs to be tabs, not trigger filename completion. */
	tab = rl_function_of_keyseq ( "\t", NULL, NULL );
	rl_bind_key ( '\t', rl_insert );

	/* Redisplay the full message when the user types ^L. */
	ctrl_l = rl_function_of_keyseq ( "\\C-l", NULL, NULL );
	rl_bind_key ( CTRL ( 'L' ), redisplay_message );

	/* readline () will use this when reading the user's inputrc to decide
	 * on application specific config stuff.  Happily readline () will
	 * automatically read the right config file - yay!
	 */
	rl_readline_name = "oi";

	message_being_read = g_ptr_array_new ();

	/* Now read the message. */
	while ( ! eof ) {
		line_read = readline ( NULL );
		if ( line_read == NULL ||
				strcmp ( line_read, "." ) == 0 ) {
			debug_print ( DEBUG_VERBOSE,
					"finished reading message\n" );
			eof = 1;
		} else {
			debug_print ( DEBUG_LOOP_VERBOSE,
					"just read this line: %s\n",
					line_read );
			new_line = g_string_new ( line_read );
			g_ptr_array_add ( message_being_read, new_line );
		}
		g_free ( line_read );
	}

	debug_print ( DEBUG_DUMP, "full message:\n" );
	debug_print_string_array ( DEBUG_DUMP, message_being_read );

	debug_print ( DEBUG_VERBOSE, "restoring original keybindings\n" );
	rl_bind_key ( '\t', tab );
	rl_bind_key ( CTRL ( 'L' ), ctrl_l );

	/* Try to ensure that if redisplay_message is called from outside
	 * read_message things will break horribly, and point to the bug.
	 */
	message = message_being_read;
	message_being_read = NULL;

	debug_sub_exit;

	return ( message );
}


/* Clear the screen and redisplay the full message when the user types ^L. */

int redisplay_message ( G_GNUC_UNUSED int count, G_GNUC_UNUSED int key ) {

	debug_sub_enter;

	debug_assert ( message_being_read != NULL, "redisplay_message was "
			"called (via readline ()) from outside read_message; "
			"this should never happen" );

	printerr ( "redisplay_message called\n" );
	rl_forced_update_display ();

	debug_sub_exit;

	return ( 0 );
}
