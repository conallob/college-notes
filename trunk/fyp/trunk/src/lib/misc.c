#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#include "debug.h"
#include "error.h"
#include "misc.h"

/* strings is presumed to be a GPtrArray of GString *; all GStrings in the array
 * will be freed, and the array itself freed.
 */

void free_string_array ( GPtrArray * strings ) {

	gsize i;

	debug_sub_enter;

	debug_assert ( strings != NULL, "passed a NULL strings array" );

	for ( i = 0; i < strings->len; i++ ) {
		g_string_free ( g_ptr_array_index ( strings, i ), TRUE );
	}
	g_ptr_array_free ( strings, TRUE );

	debug_sub_exit;
}

/* Append the contents of source to destination.  Destination will be unchanged.
 * The strings in destination will not be deeply copied; you'll end up with two
 * pointers to the same string.
 */

void append_string_array ( GPtrArray * destination, GPtrArray * source ) {

	gsize i;

	debug_sub_enter;

	debug_assert ( destination != NULL, "passed a NULL destination array" );
	debug_assert ( source != NULL, "passed a NULL source array" );

	for ( i = 0; i < source->len; i++ ) {
		g_ptr_array_add ( destination,
				g_ptr_array_index ( source, i ) );
	}

	debug_sub_exit;
}

/* Duplicate the string array strings. */

GPtrArray * copy_string_array ( const GPtrArray * strings ) {

	GPtrArray * copy;
	GString * string, * new_string;
	gsize i;

	debug_sub_enter;

	debug_assert ( strings != NULL, "passed a NULL strings array to copy" );

	copy = g_ptr_array_new ();
	for ( i = 0; i < strings->len; i++ ) {
		string = g_ptr_array_index ( strings, i );
		new_string = g_string_new_len ( string->str, string->len );
		g_ptr_array_add ( copy, new_string );
	}

	debug_sub_exit;

	return ( copy );
}
