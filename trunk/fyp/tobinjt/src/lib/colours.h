/* $Id$ */
#ifndef COLOURS_H
#define COLOURS_H


/* The colours used by oi */

/* Indices to get colours out of Colours; there is no connection between these
 * indices and the indices in recipient.h.
 */

#define COLOUR_reset                    0
#define COLOUR_reset_bg                 1
#define COLOUR_black                    2
#define COLOUR_black_light              3
#define COLOUR_black_bg                 4
#define COLOUR_red                      5
#define COLOUR_red_light                6
#define COLOUR_red_bg                   7
#define COLOUR_green                    8
#define COLOUR_green_light              9
#define COLOUR_green_bg                 10
#define COLOUR_yellow                   11
#define COLOUR_yellow_light             12
#define COLOUR_yellow_bg                13
#define COLOUR_blue                     14
#define COLOUR_blue_light               15
#define COLOUR_blue_bg                  16
#define COLOUR_magenta                  17
#define COLOUR_magenta_light            18
#define COLOUR_magenta_bg               19
#define COLOUR_cyan                     20
#define COLOUR_cyan_light               21
#define COLOUR_cyan_bg                  22
#define COLOUR_white                    23
#define COLOUR_white_light              24
#define COLOUR_white_bg                 25
#define COLOUR_purple                   26
#define COLOUR_purple_light             27
#define COLOUR_purple_bg                28

#define NUM_COLOURS                     29


/* The type of colours. */

typedef const gchar * colour;
typedef const gchar * colour_name;

/* The escape sequence necessary to clear to the end of the line. */

extern const colour clear_eol;

/* The escape sequence necessary to reset colours. */

extern const colour reset_colour;

/* An array of colour names.  The index that gets you a particular colour also
 * gets you the name of that colour.
 */

extern const colour_name Colour_names [NUM_COLOURS];

/* Spit out the correct string to set the foreground and background colours.
 * This string is statically allocated, will be overwritten by the next call to
 * gimme_colour, and should not be freed by the caller.
 */

gchar * gimme_colour ( gsize foreground, gsize background );

#endif /* COLOURS_H */
