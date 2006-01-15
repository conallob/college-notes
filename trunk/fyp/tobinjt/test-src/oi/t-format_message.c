/* $Id$ */
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#include <glib.h>
#include <readline/readline.h>

#include "debug.h"
#include "error.h"
#include "colours.h"
#include "recipient.h"
#include "format_message.h"
#include "check_argv.h"
#include "misc.h"

int main ( int argc, const gchar * * argv ) {

	gchar * line;
	const gchar * prompt = NULL;
	GPtrArray * message, * formatted_message, * line_wrapped;
	GPtrArray * tab_expanded;
	GString * string;
	gsize wrap_after = 76, i, j;
	recipient * root, * roots [3];

	debug_sub_enter;
	printerr_set_name ( "format_message.c" );
	debug_set_file ( stdout );

	check_argv ( argc, argv, "format_message.c" );

	debug_print ( DEBUG_VERBOSE, "initialising global recipient\n" );
	init_Recipient ();
	/* Hopefully root will always exist as a user . . . */
	debug_print ( DEBUG_VERBOSE, "copying global recipient\n" );
	roots[0] = copy_recipient ( Recipient, "root" );
	roots[1] = copy_recipient ( Recipient, "root" );
	roots[2] = copy_recipient ( Recipient, "root" );

	debug_print ( DEBUG_VERBOSE, "changing different user preferences\n" );
	/* Leave roots[0] at default preferences. */
	roots[1]->justify = JCENTRE;
	roots[2]->justify = JRIGHT;

	roots[1]->sig = copy_pref ( roots[1]->sig );
	roots[1]->to = copy_pref ( roots[1]->to );
	roots[1]->from = copy_pref ( roots[1]->from );
	roots[1]->sig->justify = JLEFT;
	roots[1]->to->justify = JCENTRE;
	roots[1]->from->justify = JRIGHT;
	roots[1]->to->pref = PREF_FIXED;
	g_string_assign ( roots[1]->to->fixed_string,
			"Hi there, matey" );

	roots[2]->sig = copy_pref ( roots[2]->sig );
	roots[2]->to = copy_pref ( roots[2]->to );
	roots[2]->from = copy_pref ( roots[2]->from );
	roots[2]->sig->pref = PREF_NONE;
	roots[2]->to->pref = PREF_USERNAME_TO;
	roots[2]->from->pref = PREF_USERNAME_FROM;

	/* Personally I like red on black. */
	for ( i = COLOUR_START; i <= COLOUR_END; i++ ) {
		roots[1]->colours [i]	= COLOUR_red;
	}

	for ( i = COLOUR_START_BG; i <= COLOUR_END_BG; i++ ) {
		roots[1]->colours [i]	= COLOUR_black_bg;
	}

	/* This is a hideous combination of colours. */
	roots[2]->colours [COLOUR_TL]	= COLOUR_red_light;
	roots[2]->colours [COLOUR_T]	= COLOUR_green_light;
	roots[2]->colours [COLOUR_TR]	= COLOUR_yellow_light;
	roots[2]->colours [COLOUR_L]	= COLOUR_blue_light;
	roots[2]->colours [COLOUR_R]	= COLOUR_magenta_light;
	roots[2]->colours [COLOUR_BL]	= COLOUR_cyan_light;
	roots[2]->colours [COLOUR_B]	= COLOUR_white_light;
	roots[2]->colours [COLOUR_BR]	= COLOUR_purple_light;
	roots[2]->colours [COLOUR_TEXT]	= COLOUR_black_light;

	roots[2]->colours [COLOUR_TL_BG]	= COLOUR_black_bg;
	roots[2]->colours [COLOUR_T_BG]		= COLOUR_red_bg;
	roots[2]->colours [COLOUR_TR_BG]	= COLOUR_green_bg;
	roots[2]->colours [COLOUR_L_BG]		= COLOUR_yellow_bg;
	roots[2]->colours [COLOUR_R_BG]		= COLOUR_blue_bg;
	roots[2]->colours [COLOUR_BL_BG]	= COLOUR_magenta_bg;
	roots[2]->colours [COLOUR_B_BG]		= COLOUR_cyan_bg;
	roots[2]->colours [COLOUR_BR_BG]	= COLOUR_white_bg;
	roots[2]->colours [COLOUR_TEXT_BG]	= COLOUR_purple_bg;

	message = g_ptr_array_new ();
	debug_print ( DEBUG_VERBOSE, "starting to read message\n" );
	/* Make sure tabs are treated as normal characters. */
	rl_bind_key ( '\t', rl_insert );
	/* Only prompt when reading from a terminal. */
	if ( isatty ( STDIN_FILENO ) ) {
		debug_print ( DEBUG_VERBOSE, "stdin is a tty\n" );
		prompt = "format_message.c: ";
	} else {
		debug_print ( DEBUG_VERBOSE, "stdin is not a tty\n" );
		prompt = "";
	}
	line = readline ( prompt );
	while ( line != NULL ) {
		string = g_string_new ( line );
		debug_print ( DEBUG_LOOP_VERBOSE, "read this line: \"%s\"\n",
				line );
		g_free ( line );
		g_ptr_array_add ( message, string );
		line = readline ( prompt );
	}
	/* Make sure there's a newline after the last prompt when reading from
	 * stdin.
	 */
	if ( isatty ( STDIN_FILENO ) ) {
		printf ( "\n" );
	}
	debug_print ( DEBUG_VERBOSE, "finished reading message\n" );

	debug_print ( DEBUG_VERBOSE, "expanding tabs in message\n" );
	tab_expanded = tabs_to_spaces ( message );
	debug_print ( DEBUG_DUMP, "tab expanded message:\n" );
	debug_print_string_array ( DEBUG_DUMP, tab_expanded );

	debug_print ( DEBUG_VERBOSE, "line wrapping message\n" );
	line_wrapped = line_wrap ( tab_expanded, wrap_after );
	debug_print ( DEBUG_DUMP, "line wrapped message:\n" );
	debug_print_string_array ( DEBUG_DUMP, line_wrapped );

	debug_print ( DEBUG_VERBOSE, "number of recipients: %d\n",
			G_N_ELEMENTS ( roots ) );
	for ( i = 0; i < G_N_ELEMENTS ( roots ); i++ ) {
		debug_print ( DEBUG_VERBOSE, "recipient %d\n", i );
		root = roots [i];
		debug_print ( DEBUG_VERBOSE, "calling format_message for %s\n",
				root->username->str );
		formatted_message = format_message ( line_wrapped, root, 0,
				wrap_after );
		debug_print ( DEBUG_VERBOSE, "back from format_message "
				"for %s\n", root->username->str );
		debug_print ( DEBUG_VERBOSE, "formatted message for %s:\n",
				root->username->str );
		/* I use an explicit loop rather than debug_print_string_array
		 * so the lines aren't indented.
		 */
		for ( j = 0; j < formatted_message->len; j++ ) {
			string = g_ptr_array_index ( formatted_message, j );
			printf ( "%s\n", string->str );
		}
		debug_print ( DEBUG_VERBOSE,
				"finished printing formatted message:\n" );
		free_string_array ( formatted_message );
		free_recipient ( root );
	}

	debug_sub_exit;

	return ( 0 );
}
