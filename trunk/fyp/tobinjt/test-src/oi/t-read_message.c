/* $Id$ */
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#include <glib.h>
#include "debug.h"
#include "read_message.h"
#include "check_argv.h"
#include "misc.h"

int main ( int argc, const gchar * * argv ) {

	GPtrArray * message;

	debug_sub_enter;
	printerr_set_name ( "t-read_message.c" );
	debug_set_file ( stdout );

	check_argv ( argc, argv, "t-read_message.c" );

	message = read_message ();

	free_string_array ( message );

	debug_sub_exit;

	return ( 0 );
}
