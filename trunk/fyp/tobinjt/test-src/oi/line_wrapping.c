#include "debug.h"
#include "error.h"
#include "misc.h"
#include "format_message.h"

int main ( int argc, char * * argv ) {
	GString * orig_string, * wrapped_string;
	GPtrArray * orig_array, * wrapped_array;
	gsize i;
	const gchar * strings [] = {
		"x",
		"123456",
		"1234567",
		"123456 890",
		"1234567890",
		"123 567890",
		"123456 89012 456789",
	};

	debug_set_level ( (gsize) argc );
	argc = sizeof argv;

	orig_array = g_ptr_array_new ();
	for ( i = 0; i < G_N_ELEMENTS ( strings ); i++ ) {
		orig_string = g_string_new ( strings [i] );
		g_ptr_array_add ( orig_array, orig_string );
	}
	wrapped_array = line_wrap ( orig_array, 7 );
	for ( i = 0; i < wrapped_array->len; i++ ) {
		wrapped_string = g_ptr_array_index ( wrapped_array, i );
		debug_print ( DEBUG_MINIMAL, "line %" G_GSIZE_FORMAT "/%"
				G_GSIZE_FORMAT ": \"%s\"\n",
				i + 1, wrapped_array->len,
				wrapped_string->str );
	}
	free_string_array ( orig_array );
	free_string_array ( wrapped_array );

	return 0;
}
