/* $Id$ */
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#include <glib.h>

#include "error.h"
#include "debug.h"
#include "check_argv.h"

int main ( int argc, const gchar * * argv ) {

	gsize set_level, print_level;
	FILE * debug_to = stdout;

	/* BUG: This knows that DEBUG_START is zero. */
#define MACRO_TO_STRING(STRING) #STRING
	const gchar * level_names [] = {
		MACRO_TO_STRING ( DEBUG_OFF ),
		MACRO_TO_STRING ( DEBUG_MINIMAL ),
		MACRO_TO_STRING ( DEBUG_WARNING ),
		MACRO_TO_STRING ( DEBUG_INFO ),
		MACRO_TO_STRING ( DEBUG_SUBS ),
		MACRO_TO_STRING ( DEBUG_VERBOSE ),
		MACRO_TO_STRING ( DEBUG_LOOP_VERBOSE ),
		MACRO_TO_STRING ( DEBUG_DUMP ),
		MACRO_TO_STRING ( DEBUG_DUMP_ALL ),
	};


	debug_sub_enter;

	check_argv ( argc, argv, "debug.c" );

	/* Output messages to stdout so that we fit the standard test model. */
	debug_set_file ( debug_to );
	for ( set_level = DEBUG_START; set_level <= DEBUG_END; set_level++ ) {
		debug_set_level ( set_level );
		fprintf ( debug_to, "debug level set to %s\n",
				level_names [set_level] );
		
		for ( print_level = DEBUG_START; print_level <= DEBUG_END;
				print_level++ ) {
			debug_print ( print_level, "printing at level %s\n",
					level_names [print_level] );
		}
	}

	debug_sub_exit;
	return ( 0 );
}
