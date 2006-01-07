/* $Id$ */
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#include <glib.h>

#include "check_argv.h"
#include "debug.h"
#include "error.h"

void check_argv ( int argc, const gchar * * argv, const gchar * name ) {

	gsize level = 0;

	debug_sub_enter;

	printerr_set_name ( name );
	if ( argc > 2 ) {
		die ( "Usage: %s <number>\n"
				"<number> is the debug level to use\n",
				name );
	}

	if ( argc == 2 ) {
		gchar * end = NULL;
		level = strtol ( argv [1], & end, 0 );
		if ( argv [1] [0] == '\0' || end [0] != '\0' ) {
			die ( "%s: invalid debug level: %s\n",
					name, argv [1] );
		}
	}

	debug_set_level ( level );

	debug_sub_exit;
}

