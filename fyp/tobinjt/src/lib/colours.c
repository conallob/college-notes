/* $Id$ */
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <glib.h>

#include "colours.h"
#include "debug.h"

/* The colours used by oi */

/* see http://vt100.net/docs/vt220-rm/chapter4.html#S4.12 for other escape
 * sequences.
 */

const colour clear_eol = "\e[K";
const colour reset_colour = "\e[0m";

/* See http://www.termsys.demon.co.uk/vtansi.htm and
 * http://www.theedge.net/~dingo/ansi.html
 */

const colour Colours [NUM_COLOURS] = {
	"0",
	"0",
	"30",
	"1;30",
	"40",
	"31",
	"1;31",
	"41",
	"32",
	"1;32",
	"42",
	"33",
	"1;33",
	"43",
	"34",
	"1;34",
	"44",
	"35",
	"1;35",
	"45",
	"36",
	"1;36",
	"46",
	"37",
	"1;37",
	"47",
	"35",
	"1;35",
	"45",
};


const colour_name Colour_names [NUM_COLOURS] = {
	"reset",
	"reset_bg",
	"black",
	"black_light",
	"black_bg",
	"red",
	"red_light",
	"red_bg",
	"green",
	"green_light",
	"green_bg",
	"yellow",
	"yellow_light",
	"yellow_bg",
	"blue",
	"blue_light",
	"blue_bg",
	"magenta",
	"magenta_light",
	"magenta_bg",
	"cyan",
	"cyan_light",
	"cyan_bg",
	"white",
	"white_light",
	"white_bg",
	"purple",
	"purple_light",
	"purple_bg",
};

/* The string to be returned by gimme_colour ().  The longest string will be:
 * "\e1;%s;%sm\0", where the first %s is up to 4 characters long, and the second
 * %s up to 2 characters long, giving a total of 12 . . . so I'm thinking of
 * allocating 15, just to be sure.  I think I'll leave it at 12 for now - better
 * to catch mistakes early.
 */
gchar __gimme_colour [12];

/* Spit out the correct string to set the foreground and background colours.
 * This string is statically allocated, will be overwritten by the next call to
 * gimme_colour, and should not be freed by the caller.
 */

gchar * gimme_colour ( gsize foreground, gsize background ) {

	debug_sub_enter;

	debug_assert ( foreground < NUM_COLOURS, "given a foreground colour "
			"greater than the number of colours\n" );
	debug_assert ( background < NUM_COLOURS, "given a background colour "
			"greater than the number of colours\n" );

	debug_print ( DEBUG_LOOP_VERBOSE, "foreground: %s; background: %s\n",
			Colour_names [foreground], Colour_names [background] );
	g_snprintf ( __gimme_colour, G_N_ELEMENTS ( __gimme_colour ),
			"\e[%s;%sm",
			Colours [foreground], Colours [background] );
	debug_sub_exit;
	return ( __gimme_colour );
}

