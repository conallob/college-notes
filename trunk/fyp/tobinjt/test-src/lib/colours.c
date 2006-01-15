/* $Id$ */
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#include "debug.h"
#include "error.h"
#include "colours.h"
#include "check_argv.h"

int main ( int argc, const gchar * * argv ) {

	gsize i;

	debug_sub_enter;

	check_argv ( argc, argv, "colours.c" );

	for ( i = COLOUR_black; i < NUM_COLOURS; i++ ) {
		debug_print ( DEBUG_LOOP_VERBOSE, "displaying colour %s\n",
				Colour_names [i] );
		printf ( "This should be %s%s%s\n",
				gimme_colour ( i, COLOUR_reset_bg ),
				Colour_names [i], reset_colour );
	}
	printf ( "\n" );

	/* BUG: This loop has too much knowledge of colours.h internals. */
	for ( i = COLOUR_black; i < NUM_COLOURS; i += 3 ) {
		debug_print ( DEBUG_LOOP_VERBOSE, "displaying %s on %s\n",
				Colour_names [i], Colour_names [i - 1]);
		printf ( "This should be %s%s on %s%s\n",
				gimme_colour ( i, i - 1 ),
				Colour_names [i], Colour_names [i - 1],
				reset_colour );
	}

	/* The loop is just to start a new scope, so I can declare the strings
	 * near where they're used.
	 */
	do {
		const gchar * string1 = "This line should end "
			"after the arrow -->>";
		const gchar * string2 = "you shouldn't see this - argh!!";
		/* Print the strings. */
		printf ( "%s%s", string1, string2 );
		/* Move the cursor back. */
		printf ( "\e[%dD", strlen ( string2 ) );
		/* And clear to the end of the line. */
		printf ( "%s\n", clear_eol );
	} while ( 0 );

	debug_sub_exit;

	return ( 0 );
}
