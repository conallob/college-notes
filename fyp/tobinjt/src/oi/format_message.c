/* $Id$ */

/* Functions to format the message the user wants to send.  The original message
 * is left unaltered, and a new one returned.  format_message () should be
 * called once for every recipient, to take recipient specific preferences into
 * account.  It'll do all the required formatting - including adding the
 * signature etc.
 */

#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#include <glib.h>
/* Next two required for struct passwd and getpwnam. */
#include <sys/types.h>
#include <pwd.h>

#include "debug.h"
#include "error.h"
#include "misc.h"
#include "recipient.h"
#include "colours.h"
#include "format_message.h"

/* All of these function assume that lines in the message parameter have the
 * trailing newline stripped.  If it isn't stripped, things will go wrong - the
 * box in particular will be fucked.
 */

/* Randomly pick an entry from one of the files listed in filelist - a GPtrArray
 * of GStrings.  numlines gives the maximum number of lines allowed in the entry
 * returned; longer entries will not be selected.  numlines == 0 means no line
 * limit.  lines will be wrapped at wrap_after characters; wrap_after == 0 means
 * no wrapping.  die()s if filelist has zero entries.  Returns NULL if it can't
 * find a suitable entry.  entry_type is the type to display in the error
 * message when we can't find an entry: probably one of "signature", "to",
 * "from".
 */

GPtrArray * pick_entry ( GPtrArray * filelist, gsize numlines, gsize wrap_after,
		const gchar * entry_type );

/* Function to make adding box characters easier. */

void add_box_char ( GString * string, recipient * recipient, gsize box_char,
		gboolean reset );

/* A helper function used by format_message: it puts the box around message,
 * adding the new lines to formatted_message.
 */

void box_message ( const GPtrArray * message, GPtrArray * formatted_message,
		recipient * recipient, gsize wrap_after );

/* A helper function used by box_message: add the justified contents of line to
 * new_line.  If prepend is non-NULL it'll be inserted between the left padding
 * and line; similarly append will be added between the line and the right
 * padding if non-NULL.  prepend and append are intended to be used for colour
 * escape sequences, so their length is not taken into account when calculating
 * the length of padding necessary.  The trailing padding will be added if
 * pad_on_right is TRUE.
 */

void add_justified_line ( gsize justify, const GString * line,
		GString * new_line, const gchar * padding, gsize max_length,
		const gchar * prepend, const gchar * append,
		gboolean pad_on_right );

/* Helper function used by format_message: adds the correct
 * signature/to/from to formatted_message for the specified recipient, or
 * does nothing if it isn't required.  Handles all possible settings for
 * recipient_pref->pref.  All strings added will NOT include a trailing newline.
 * All lines in the added strings will include the appropriate colours.  Strings
 * will be wrapped at wrap_after characters.  Randomly picked strings will be no
 * longer than numlines.
 */

void format_pref ( recipient * recipient, GPtrArray * formatted_message,
		const recipient_pref * pref, const gchar * type,
		gsize numlines, gsize wrap_after );

/* Helper function used by pick_entry - reads all the entries in filename,
 * stuffing them into entries.  Entries longer than numlines lines won't be
 * added.  Returns true if it successfully opened filename - this doesn't imply
 * that it successfully added any entries, but you can figure that out by
 * comparing pre and post values of entries->len.
 */
gboolean read_entries ( const GString * filename, GPtrArray * entries,
		gsize numlines );

/* Randomly pick an entry from one of the files listed in filelist - a GPtrArray
 * of GStrings.  numlines gives the maximum number of lines allowed in the entry
 * returned; longer entries will not be selected.  numlines == 0 means no line
 * limit.  lines will be wrapped at wrap_after characters; wrap_after == 0 means
 * no wrapping.  die()s if filelist has zero entries.  Returns NULL if it can't
 * find a suitable entry.  entry_type is the type to display in the error
 * message when we can't find an entry: probably one of "signature", "to",
 * "from".
 */

GPtrArray * pick_entry ( GPtrArray * filelist, gsize numlines, gsize wrap_after,
		const gchar * entry_type ) {

/* POSSIBLY: think about these for pick_entry:
 * caching file contents, in the recipient_pref struct?
 * have a global hash mapping filenames to raw file contents, before and/or
 * after tabs_to_spaces and word wrapping?
 */

	/* entries and wrapped_entries are GPtrArrays of GPtrArrays of GStrings,
	 * viz each entry is represented by a GPtrArray of GStrings, and the
	 * entries are bundled up in a GPtrArray.
	 */
	GPtrArray * entries, * wrapped_entries;
	GPtrArray * entry, * choosen_entry;
	GPtrArray * wrapped_entry, * tab_expanded_entry;
	GString * filename;
	gsize random_index, i;
	gboolean opened_successfully = FALSE;

	debug_sub_enter;
	debug_assert ( filelist != NULL, "passed a NULL filelist" );
	debug_assert ( entry_type != NULL, "passed a NULL entry_type" );
	debug_assert ( filelist->len == 0, "passed an empty filelist" );

	/* I'm assuming there'll be at least one entry per file, so start off
	 * that large.
	 */
	entries = g_ptr_array_sized_new ( filelist->len );
	debug_print ( DEBUG_INFO, "reading files to pick a %s\n", entry_type );
	for ( i = 0; i < filelist->len; i++ ) {
		filename = g_ptr_array_index ( filelist, i );
		debug_print ( DEBUG_VERBOSE, "reading contents of %s\n",
				filename->str );
		opened_successfully |= read_entries ( filename, entries,
				numlines );
	}

	if ( ! opened_successfully ) {
		debug_assert ( entries->len == 0,
				"How can I have read any entries when I "
					"didn't open any files????" );
		printerr ( "Failed opening any files while looking for a %s\n",
				entry_type );
		g_ptr_array_free ( entries, TRUE );
		debug_sub_exit;
		return ( NULL );
	}

	wrapped_entries = g_ptr_array_new ();
	for ( i = 0; i < entries->len; i++ ) {
		debug_print ( DEBUG_LOOP_VERBOSE, "tab expanding and line "
				"wrapping entry %" G_GSIZE_FORMAT "\n", i );
		entry = g_ptr_array_index ( entries, i );
		tab_expanded_entry = tabs_to_spaces ( entry );
		wrapped_entry = line_wrap ( tab_expanded_entry, wrap_after );
		free_string_array ( tab_expanded_entry );

		debug_assert ( wrapped_entry->len != 0, "How can I have a "
				"zero length entry?\n" );
		if ( numlines == 0 || wrapped_entry->len <= numlines ) {
			debug_print ( DEBUG_LOOP_VERBOSE, "adding new entry "
					"%" G_GSIZE_FORMAT "/%" G_GSIZE_FORMAT
					"\n", wrapped_entry->len, numlines );
			g_ptr_array_add ( wrapped_entries, wrapped_entry );
		} else {
			debug_print ( DEBUG_LOOP_VERBOSE, "skipping long entry "
					"%" G_GSIZE_FORMAT "/%" G_GSIZE_FORMAT
					"\n", wrapped_entry->len, numlines );
			free_string_array ( wrapped_entry );
		}
	}
	for ( i = 0; i < entries->len; i++ ) {
		entry = g_ptr_array_index ( entries, i );
		debug_print ( DEBUG_LOOP_VERBOSE, "freeing %s entry "
				"%" G_GSIZE_FORMAT "\n", entry_type, i );
		free_string_array ( entry );
	}
	g_ptr_array_free ( entries, TRUE );

	if ( wrapped_entries->len == 0 ) {
		if ( numlines == 0 ) {
			printerr ( "Failed finding a %s\n", entry_type );
		} else {
			printerr ( "Failed finding a %s shorter than %"
					G_GSIZE_FORMAT " lines\n",
					entry_type, numlines );
		}
		g_ptr_array_free ( wrapped_entries, TRUE );
		debug_sub_exit;
		return ( NULL );
	}

	random_index = g_random_int_range ( 0, (gint32) wrapped_entries->len );
	choosen_entry = g_ptr_array_remove_index_fast ( wrapped_entries,
			random_index );
	debug_print ( DEBUG_INFO, "Picked a %s:\n", entry_type );
	debug_print_string_array ( DEBUG_DUMP, choosen_entry );

	for ( i = 0; i < wrapped_entries->len; i++ ) {
		wrapped_entry = g_ptr_array_index ( wrapped_entries, i );
		debug_print ( DEBUG_LOOP_VERBOSE, "freeing wrapped %s entry "
				"%" G_GSIZE_FORMAT "\n", entry_type, i );
		free_string_array ( wrapped_entry );
	}
	g_ptr_array_free ( wrapped_entries, TRUE );

	debug_sub_exit;
	return ( choosen_entry );
}


/* Format the contents of message (leaving message unchanged) according to the
 * preferences specified in recipient.  The formatted message will be returned
 * and it's the caller's responsibility to free the associated memory.  No extra
 * formatting should be required; the signature etc will be added by this
 * function.  Colours will be added as required, and the caller may want to
 * strip them before logging the message to a file.
 */

/* This function depends on the recipient having no uninitialised fields; I
 * dunno how realistic that is.  But the alternatives are icky, and I don't like
 * them.  I can either write boilerplate code to merge the settings, sprinkle
 * this function with if statements to take the "right" value, or pass the buck
 * to the parser.  If the global recipient has no unitialised fields (easy
 * enough) and the parser makes everything inherit or replace then it would
 * work, I guess.  The code here is written with that restriction in mind;
 * changing it would be a whole lot of work.
 */

GPtrArray * format_message ( const GPtrArray * message,
		recipient * recipient, gsize numlines, gsize wrap_after ) {

	GPtrArray * formatted_message;

	debug_sub_enter;
	debug_assert ( message != NULL, "passed a NULL message" );
	debug_assert ( recipient != NULL, "passed a NULL recipient" );

	/* There'll usually be at least five extra lines added. */
	formatted_message = g_ptr_array_sized_new ( message->len + 5 );

	debug_print ( DEBUG_INFO, "determining \"to\" for %s\n",
			recipient->username->str );
	/* Add 4 characters to wrap_after to take the four box characters into
	 * account.  Without this centre and right justified lines would be too
	 * far to the left.
	 */
	format_pref ( recipient, formatted_message, recipient->to,
			"to", numlines, wrap_after + 4 );

	debug_print ( DEBUG_INFO, "determining \"from\" for %s\n",
			recipient->username->str );
	format_pref ( recipient, formatted_message, recipient->from,
			"from", numlines, wrap_after + 4 );

	debug_print ( DEBUG_INFO, "calling box_message ()\n" );
	box_message ( message, formatted_message, recipient, wrap_after );
	debug_print ( DEBUG_INFO, "back from box_message ()\n" );

	debug_print ( DEBUG_INFO, "determining \"signature\" for %s\n",
			recipient->username->str );
	format_pref ( recipient, formatted_message, recipient->sig,
			"signature", numlines, wrap_after + 4 );

	debug_sub_exit;
	return ( formatted_message );
}

/* Function to make adding box characters easier. */

void add_box_char ( GString * string, recipient * recipient, gsize box_char,
		gboolean reset ) {

	gsize colour_index, colour_fg, colour_bg;

	debug_sub_enter;

	debug_assert ( string != NULL, "passed a NULL string to append to" );
	debug_assert ( recipient != NULL, "passed a NULL recipient to "
			"pull colours from" );

	colour_index = box_chars_to_colours ( box_char );
	colour_fg = recipient->colours [colour_index];
	colour_bg = recipient->colours [colour_index + COLOUR_START_BG];
	g_string_append ( string, gimme_colour ( colour_fg, colour_bg ) );
	g_string_append_c ( string, recipient->box_chars [box_char] );

	if ( reset ) {
		g_string_append ( string, reset_colour );
	}

	debug_sub_exit;
}

/* A helper function used by format_message: it puts the box around message,
 * adding the new lines to formatted_message.  tabs_to_spaces and line_wrap
 * should have been called before box_message.  Newlines will NOT be added to
 * the end.
 */

void box_message ( const GPtrArray * message, GPtrArray * formatted_message,
		recipient * recipient, gsize wrap_after ) {

	GString * line, * new_line, * left_padding;
	gchar * inside_padding;
	gsize max_length, i, left_pad_length, new_string_length;

	debug_sub_enter;

	debug_assert ( message != NULL, "passed a NULL message" );
	debug_assert ( formatted_message != NULL,
			"passed a NULL formatted_message" );
	debug_assert ( recipient != NULL, "passed a NULL recipient" );

	debug_print ( DEBUG_VERBOSE, "figuring out the maximum line length "
			"in the message\n" );
	max_length = 0;
	for ( i = 0; i < message->len; i++ ) {
		line = g_ptr_array_index ( message, i );
		if ( line->len > max_length ) {
			max_length = line->len;
		}
	}
	debug_print ( DEBUG_VERBOSE, "longest line is %" G_GSIZE_FORMAT
			" characters long\n", max_length );
	debug_assert ( max_length <= wrap_after, "longest line in message is "
			"longer than the number of characters to "
			"line wrap after" );
	/* wrap_after is exclusive of the box characters, so no need to include
	 * them in this calculation.
	 */
	left_pad_length = ( wrap_after - max_length ) / 2;
	left_padding = g_string_sized_new ( left_pad_length );
	/* Make clear_eol the first thing in the string; if it's at the end of
	 * the string and the string is the same width as the terminal the last
	 * character will be chopped off.
	 */
	g_string_append ( left_padding, clear_eol );
	for ( i = 0; i < left_pad_length; i++ ) {
		g_string_append_c ( left_padding, ' ' );
	}
	/* left padding + max line length . . . */
	new_string_length = left_pad_length + max_length
	/* + box + box colours + body colours + colour resets + clear_eol. */
		+ 4 + ( 12 * 2 ) + 12 + ( 8 * 3 ) + 3;
	debug_print ( DEBUG_VERBOSE, "new_string_length is %d\n",
			new_string_length );

	debug_print ( DEBUG_VERBOSE, "adding the top of the box\n" );
	new_line = g_string_sized_new ( new_string_length );
	g_string_append ( new_line, left_padding->str );
	add_box_char ( new_line, recipient, BOX_TL, TRUE );
	add_box_char ( new_line, recipient, BOX_T, FALSE );
	/* max_length + 1, not max_length + 2, because we've already added one
	 * BOX_T character.
	 */
	for ( i = 0; i < max_length + 1; i++ ) {
		debug_print ( DEBUG_LOOP_VERBOSE, "adding %dth '%c'\n",
				i, recipient->box_chars [BOX_T] );
		g_string_append_c ( new_line, recipient->box_chars [BOX_T] );
	}
	add_box_char ( new_line, recipient, BOX_TR, TRUE );
	g_ptr_array_add ( formatted_message, new_line );
	debug_print ( DEBUG_VERBOSE, "top of the box: %s\n", new_line->str );

	inside_padding = g_strnfill ( max_length, ' ' );
	for ( i = 0; i < message->len; i++ ) {
		line = g_ptr_array_index ( message, i );
		debug_print ( DEBUG_LOOP_VERBOSE, "adding line %" G_GSIZE_FORMAT
				": \"%s\"\n", line->len, line->str );
		new_line = g_string_sized_new ( new_string_length );
		g_string_append ( new_line, left_padding->str );

		/* Append the left side of the box. */
		add_box_char ( new_line, recipient, BOX_L, TRUE );

		/* Justify the message. */
		g_string_append ( new_line,
				gimme_colour (recipient->colours [COLOUR_TEXT],
					recipient->colours [COLOUR_TEXT_BG] )
				);
		g_string_append_c ( new_line, ' ' );
		add_justified_line ( recipient->justify, line, new_line,
				inside_padding, max_length, NULL, NULL, TRUE );
		g_string_append_c ( new_line, ' ' );
		g_string_append ( new_line, reset_colour );

		/* Append the right side of the box. */
		add_box_char ( new_line, recipient, BOX_R, TRUE );

		g_ptr_array_add ( formatted_message, new_line );
		debug_print ( DEBUG_LOOP_VERBOSE, "formatted line %"
				G_GSIZE_FORMAT "\"%s\"\n",
				i, new_line->str );
	}

	debug_print ( DEBUG_VERBOSE, "adding the bottom of the box\n" );
	new_line = g_string_sized_new ( new_string_length );
	g_string_append ( new_line, left_padding->str );
	add_box_char ( new_line, recipient, BOX_BL, TRUE );
	add_box_char ( new_line, recipient, BOX_B, FALSE );
	for ( i = 0; i < max_length + 1; i++ ) {
		debug_print ( DEBUG_LOOP_VERBOSE, "adding %dth '%c'\n",
				i, recipient->box_chars [BOX_B] );
		g_string_append_c ( new_line, recipient->box_chars [BOX_B] );
	}
	add_box_char ( new_line, recipient, BOX_BR, TRUE );
	g_ptr_array_add ( formatted_message, new_line );
	debug_print ( DEBUG_VERBOSE, "bottom of the box: %s\n", new_line->str );

	/* Clean up. */
	g_string_free ( left_padding, TRUE );
	g_free ( inside_padding );

	debug_sub_exit;
}

/* A helper function used by box_message: add the justified contents of line to
 * new_line.  If prepend is non-NULL it'll be inserted between the left padding
 * and line; similarly append will be added between the line and the right
 * padding if non-NULL.  prepend and append are intended to be used for colour
 * escape sequences, so their length is not taken into account when calculating
 * the length of padding necessary.  The trailing padding will be added if
 * pad_on_right is TRUE.
 */

void add_justified_line ( gsize justify, const GString * line,
		GString * new_line, const gchar * padding, gsize max_length,
		const gchar * prepend, const gchar * append,
		gboolean pad_on_right ) {

	gsize pad_length;
	/* A weird side effect of adding this variable and associated code in
	 * the JCENTRE: case is that the silly warnings about code that won't be
	 * executed in the JLEFT: case have stopped.  Maybe it's because this
	 * function is now slightly too big to be inlined?
	 */
	gboolean extra_right_pad;

	debug_sub_enter;

	debug_assert ( line != NULL, "passed a NULL line\n");
	debug_assert ( new_line != NULL, "passed a NULL new_line\n");
	debug_assert ( padding != NULL, "passed a NULL padding\n");
	debug_assert ( line->len <= max_length, "length of line to justify "
			"is longer than max_length" );

	switch ( justify ) {
		case JLEFT:
			debug_print ( DEBUG_LOOP_VERBOSE, "left justifying\n" );
			pad_length = max_length - line->len;
			if ( prepend != NULL ) {
				debug_print ( DEBUG_LOOP_VERBOSE,
						"prepending string\n" );
				g_string_append ( new_line, prepend );
			}
			g_string_append_len ( new_line, line->str, line->len );
			if ( append != NULL ) {
				debug_print ( DEBUG_LOOP_VERBOSE,
						"appending string\n" );
				g_string_append ( new_line, append );
			}
			if ( pad_on_right ) {
				debug_print ( DEBUG_LOOP_VERBOSE,
						"adding trailing padding\n" );
				g_string_append_len ( new_line, padding,
						pad_length );
			}
			break;
		case JCENTRE:
			debug_print ( DEBUG_LOOP_VERBOSE,
					"centre justifying\n" );
			pad_length = ( max_length - line->len ) / 2;
			/* If the total amount of padding is odd we need to add
			 * an extra space on the right because:
			 * ( x / 2 ) + ( x / 2 ) != x
			 * when x is odd and integer.
			 */
			extra_right_pad = ( max_length - line->len ) % 2 == 1;
			g_string_append_len ( new_line, padding, pad_length );
			if ( prepend != NULL ) {
				debug_print ( DEBUG_LOOP_VERBOSE,
						"prepending string\n" );
				g_string_append ( new_line, prepend );
			}
			g_string_append_len ( new_line, line->str, line->len );
			if ( append != NULL ) {
				debug_print ( DEBUG_LOOP_VERBOSE,
						"appending string\n" );
				g_string_append ( new_line, append );
			}
			if ( pad_on_right ) {
				debug_print ( DEBUG_LOOP_VERBOSE,
						"adding trailing padding\n" );
				g_string_append_len ( new_line, padding,
						pad_length );
				if ( extra_right_pad ) {
					g_string_append_c ( new_line, ' ' );
				}
			}
			/* g_string_append ( new_line, " " ); */
			break;
		case JRIGHT:
			debug_print ( DEBUG_LOOP_VERBOSE,
					"right justifying\n" );
			pad_length = max_length - line->len;
			g_string_append_len ( new_line, padding, pad_length );
			if ( prepend != NULL ) {
				debug_print ( DEBUG_LOOP_VERBOSE,
						"prepending string\n" );
				g_string_append ( new_line, prepend );
			}
			g_string_append_len ( new_line, line->str, line->len );
			if ( append != NULL ) {
				debug_print ( DEBUG_LOOP_VERBOSE,
						"appending string\n" );
				g_string_append ( new_line, append );
			}
			break;
		default:
			die ( "add_justified_line: unknown justification "
					"setting (%" G_GSIZE_FORMAT ")\n",
					justify );
			break;
	}

	debug_sub_exit;
}

/* Helper function used by format_message: adds the correct
 * signature/to/from to formatted_message for the specified recipient, or
 * does nothing if it isn't required.  Handles all possible settings for
 * recipient_pref->pref.  All strings added will NOT include a trailing newline.
 * All lines in the added strings will include the appropriate colours.  Strings
 * will be wrapped at wrap_after characters.  Randomly picked strings will be no
 * longer than numlines.
 */

void format_pref ( recipient * recipient, GPtrArray * formatted_message,
		const recipient_pref * pref, const gchar * type,
		gsize numlines, gsize wrap_after ) {

	GPtrArray * string_array;
	GPtrArray * tab_expanded_strings, * wrapped_strings;
	GString * new_string, * justified_string;
	gchar * padding = NULL, * set_colour = NULL;
	gboolean handled = FALSE, wrapped = FALSE;
	gsize i;

	debug_sub_enter;
	debug_assert ( recipient != NULL, "passed a NULL recipient" );
	debug_assert ( formatted_message != NULL,
			"passed a NULL formatted_message" );
	debug_assert ( pref != NULL, "passed a NULL recipient_pref" );
	debug_assert ( type != NULL, "passed a NULL type string" );

	debug_print ( DEBUG_INFO, "Determining %s for %s\n",
			type, recipient->username->str );

	string_array = g_ptr_array_new ();

	/* TO - use recipient's username/real name.
	 * FROM - use user's username/real name.
	 */

	if ( pref->pref == PREF_NONE ) {
		handled = TRUE;
		debug_print ( DEBUG_VERBOSE, "%s preference set "
				"to NONE: doing nothing\n", type );
	}

	if ( pref->pref == PREF_USERNAME_FROM ) {
		const gchar * username;
		handled = TRUE;
		username = g_get_user_name ();
		new_string = g_string_new ( "" );
		g_string_append_printf ( new_string, "%s says . . . ",
				username );
		g_ptr_array_add ( string_array, new_string );
		debug_print ( DEBUG_VERBOSE, "%s preference set "
				"to PREF_USERNAME_FROM: expanding to %s\n",
				type, new_string->str );
	}

	if ( pref->pref == PREF_USERNAME_TO ) {
		handled = TRUE;
		new_string = g_string_new ( "" );
		g_string_append_printf ( new_string, "Oi %s,",
				recipient->username->str );
		g_ptr_array_add ( string_array, new_string );
		debug_print ( DEBUG_VERBOSE, "%s preference set "
				"to PREF_USERNAME_TO: expanding to %s\n",
				type, new_string->str );
	}

	if ( pref->pref == PREF_GECOS_FROM ) {
		const gchar * gecos;
		handled = TRUE;
		gecos = g_get_real_name ();
		new_string = g_string_new ( "" );
		g_string_append_printf ( new_string, "%s says:", gecos );
		g_ptr_array_add ( string_array, new_string );
		debug_print ( DEBUG_VERBOSE, "%s preference set to "
				"PREF_GECOS_FROM: expanding to %s\n", 
				type, new_string->str );
	}
	/* BUG: Once oi becomes networked, this will have to disappear, or the
	 * assertion below be removed.
	 */
	if ( pref->pref == PREF_GECOS_TO ) {
		handled = TRUE;
		gchar * gecos, * comma;
		struct passwd * passwd;
		passwd = getpwnam ( recipient->username->str );
		debug_assert ( passwd != NULL, "failed finding passwd entry "
				"for recipient; recipient should never have "
				"gotten this far" );
		/* BUG? Why do I copy this, instead of modifying it inplace? */
		gecos = g_strdup ( passwd->pw_gecos );
		comma = strchr ( gecos, ',' );
		if ( comma != NULL ) {
			*comma = '\0';
		}
		if ( strlen ( gecos ) == 0 ) {
			printerr ( "zero-length gecos name for %s:\n",
					recipient->username->str );
		}

		new_string = g_string_new ( "" );
		g_string_append_printf ( new_string, "Oi %s,", gecos );
		g_ptr_array_add ( string_array, new_string );
		g_free ( gecos );
		debug_print ( DEBUG_VERBOSE, "%s preference set to "
				"PREF_GECOS_TO: expanding to %s\n", 
				type, new_string->str );
	}

	if ( pref->pref == PREF_FIXED ) {
		handled = TRUE;
		new_string = g_string_new ( pref->fixed_string->str );
		g_ptr_array_add ( string_array, new_string );
		debug_print ( DEBUG_VERBOSE, "%s preference set to "
				"PREF_FIXED: expanding to %s\n", 
				type, new_string->str );
	}

	if ( pref->pref == PREF_RANDOM ) {
		handled = TRUE;
		/* The strings returned from pick_entry () will already be
		 * wrapped and expanded.
		 */
		wrapped = TRUE;
		g_ptr_array_free ( string_array, TRUE );
		string_array = pick_entry ( pref->random_files, numlines,
				wrap_after, type );
		debug_print ( DEBUG_VERBOSE, "%s preference set to "
				"PREF_RANDOM: expanding to:\n", type );
		debug_print_string_array ( DEBUG_DUMP, string_array );
	}

	if ( ! handled ) {
		die ( "format_pref: %s->pref is set to an "
				"unhandled value (%d)\n", type, pref->pref );
	}

	if ( ! wrapped ) {
		tab_expanded_strings = tabs_to_spaces ( string_array );
		wrapped_strings = line_wrap ( tab_expanded_strings,
				wrap_after );
		debug_print ( DEBUG_DUMP, "tab expanding and line wrapping "
				"%s preference gives:\n", type );
		debug_print_string_array ( DEBUG_DUMP, wrapped_strings );
		free_string_array ( string_array );
		free_string_array ( tab_expanded_strings );
	} else {
		wrapped_strings = string_array;
	}

	padding = g_strnfill ( wrap_after, ' ' );
	debug_print ( DEBUG_VERBOSE, "justifying and adding colour to "
			"%s line\n", type );
	for ( i = 0; i < wrapped_strings->len; i++ ) {
		new_string = g_ptr_array_index ( wrapped_strings, i );
		justified_string = g_string_new ( clear_eol );
		set_colour = gimme_colour ( pref->fg_colour, pref->bg_colour );
		add_justified_line ( pref->justify, new_string,
				justified_string, padding, wrap_after,
				set_colour, reset_colour, FALSE );
		g_ptr_array_add ( formatted_message, justified_string );
		g_string_free ( new_string, TRUE );
		debug_print ( DEBUG_DUMP, "%s\n", justified_string->str );
	}

	g_free ( padding );
	g_ptr_array_free ( wrapped_strings, TRUE );
	debug_sub_exit;
	return;
}


/* Helper function used by pick entry - reads all the entries in filename,
 * stuffing them into entries.  Entries longer than numlines lines won't be
 * added.  Returns true if it successfully opened filename - this doesn't imply
 * that it successfully added any entries, but you can figure that out by
 * comparing pre and post values of entries->len.
 */

gboolean read_entries ( const GString * filename, GPtrArray * entries,
		gsize numlines ) {

	GIOChannel * file;
	GIOStatus result;
	GError * error = NULL;
	GString * new_line;
	GPtrArray * new_entry, * new_entries;
	gchar * line;
	gsize length, end, i;
	gboolean seen_seperator;

	debug_sub_enter;
	debug_assert ( filename != NULL, "Passed a NULL filename" );
	debug_assert ( filename->str != NULL, "Passed a NULL filename" );
	debug_assert ( entries != NULL, "Passed a NULL list of entries" );

	debug_print ( DEBUG_INFO, "opening file: %s\n", filename->str );
	file = g_io_channel_new_file ( filename->str, "r", &error );
	if ( file == NULL ) {
		printerr ( "Failed opening %s: %s", filename->str,
				error->message );
		g_error_free ( error );
		debug_sub_exit;
		return ( FALSE );
	}

	seen_seperator = FALSE;
	new_entry = NULL;
	new_entries = g_ptr_array_new ();
	result = g_io_channel_read_line ( file, &line, &length, &end,
			&error );
	while ( result == G_IO_STATUS_NORMAL ) {
		/* chomp () */
		line [end] = '\0';
		if ( line [0] == '%' && line [1] == '\0' ) {
			/* This is a seperator line. */
			seen_seperator = TRUE;
			new_entry = NULL;
			g_free ( line );
			result = g_io_channel_read_line ( file, &line,
					&length, &end, &error );
			continue;
		}

		/* This is not a seperator line. */
		if ( new_entry == NULL ) {
			new_entry = g_ptr_array_new ();
			g_ptr_array_add ( new_entries, new_entry );
		}
		new_line = g_string_new_len ( line, end );
		g_free ( line );
		g_ptr_array_add ( new_entry, new_line );

		result = g_io_channel_read_line ( file, &line, &length, 
				&end, &error );
	}

	if ( result != G_IO_STATUS_EOF ) {
		printerr ( "failure reading %s: %s", filename->str,
				error->message );
		printerr ( "continuing anyway" );
		g_error_free ( error );
	}

	g_io_channel_shutdown ( file, FALSE, NULL );
	/* It's not particularly clear from the documentation, but when the
	 * reference count drops to 0 the channel will be freed - there is no
	 * g_io_channel_free () or similar function.  Makes sense from the point
	 * of view of sharing one channel across lots of bits of code, but it's
	 * still kinda unclear.
	 */
	g_io_channel_unref ( file );

	if ( new_entries->len == 0 ) {
		debug_print ( DEBUG_WARNING, "no entries found in %s\n",
				filename->str );
		g_ptr_array_free ( new_entries, TRUE );
		return ( TRUE );
	}

#ifdef HEY_COMPATIBILITY

	/* Hey compatibility: hey uses single line quotes, with no seperator.
	 * If I haven't seen a seperator assume it's a hey-style quotes file,
	 * and process appropriately.  Happily we have each line as a single
	 * GString, we just need to put it into it's own GPtrArray, after
	 * checking that it's not empty.
	 */

	if ( ! seen_seperator ) {
		GPtrArray * hey_quotes = NULL;
		debug_assert ( new_entries->len == 1, "I haven't seen a % "
				"seperator, how can I have more then one "
				"entry?" );
		debug_print ( DEBUG_INFO, "assuming %s is a "
				"hey(1)-style quotes file\n",
				filename->str );
		hey_quotes = g_ptr_array_remove_index ( new_entries, 0 );
		for ( i = 0; i < hey_quotes->len; i++ ) {
			new_line = g_ptr_array_index ( hey_quotes, i );
			if ( new_line->len == 0 ) {
				g_string_free ( new_line, TRUE );
			} else {
				new_entry = g_ptr_array_new ();
				g_ptr_array_add ( new_entry, new_line );
				g_ptr_array_add ( entries, new_entry );
			}
		}
		g_ptr_array_free ( hey_quotes, TRUE );
		g_ptr_array_free ( new_entries, TRUE );

		return ( TRUE );
	}
	
#endif

	/* Check if the entry is longer than numlines and discard it if it is.
	 * Also check for entries which consist of just one empty line, and
	 * discard those.
	 */
	for ( i = 0; i < new_entries->len; i++ ) {
		new_entry = g_ptr_array_index ( new_entries, i );
		if ( numlines != 0 && new_entry->len > numlines ) {
			/* Entry is too long. */
			free_string_array ( new_entry );
		} else {
			GString * line_one = g_ptr_array_index ( new_entry, 0 );
			if ( new_entry->len == 1 && line_one->len == 0 ) {
				/* Entry is empty. */
				free_string_array ( new_entry );
			} else {
				g_ptr_array_add ( entries, new_entry );
			}
		}
	}

	g_ptr_array_free ( new_entries, TRUE );

	return ( TRUE );
}

/* This function should be called before format_message: wrap all the lines in
 * message to <= wrap_after, respecting word boundaries.  Returns a new
 * GPtrArray of new GStrings, all of which need to be freed by the caller.
 */

/* This whole function is I18N broken.  I suspect most of oi is. */

GPtrArray * line_wrap ( const GPtrArray * message, gsize wrap_after ) {

	GPtrArray * wrapped_message;
	GString * new_line, * line;
	gchar * start_from;
	gsize i, j, remainder;

	debug_sub_enter;
	debug_assert ( message != NULL, "passed a NULL message" );

	debug_print ( DEBUG_VERBOSE, "linewrapping %" G_GSIZE_FORMAT " lines\n",
			message-> len );

	wrapped_message = g_ptr_array_sized_new ( message->len );

	/* Don't wrap if wrap_after == 0. */
	if ( wrap_after == 0 ) {
		for ( i = 0; i < message->len; i++ ) {
			line = g_ptr_array_index ( message, i );
			new_line = g_string_new_len ( line->str, line->len );
			g_ptr_array_add ( wrapped_message, new_line );
		}

		debug_sub_exit;
		return ( wrapped_message );
	}

	for ( i = 0; i < message->len; i++ ) {
		line = g_ptr_array_index ( message, i );
		/* This next line is ugly, but it'll basically print:
		 * "linewrapping line 7/22: 45/76 characters: %s", where %s is
		 * the line.
		 */
		debug_print ( DEBUG_LOOP_VERBOSE, "linewrapping line "
				"%" G_GSIZE_FORMAT
				"/%" G_GSIZE_FORMAT
				": %" G_GSIZE_FORMAT
				"/%" G_GSIZE_FORMAT
				" characters: \"%s\"\n", i + 1, message->len,
				line->len, wrap_after, line->str );

		if ( line->len <= wrap_after ) {
			debug_print ( DEBUG_LOOP_VERBOSE,
					"no wrapping required.\n" );
			new_line = g_string_new_len ( line->str, line->len );
			g_ptr_array_add ( wrapped_message, new_line );
			continue;
		}
		/* else . . . line wrap. */

		start_from = line->str;
		remainder = line->len;
		while ( start_from != NULL ) {
			/* Handle the simple case of having fewer than
			 * wrap_after characters left.
			 */
			if ( remainder <= wrap_after ) {
				debug_print ( DEBUG_LOOP_VERBOSE,
						"%" G_GSIZE_FORMAT
						"/%" G_GSIZE_FORMAT
						" characters left, "
						"\"%s\" wrapped.\n",
						remainder, wrap_after,
						start_from );
				new_line = g_string_new_len ( start_from,
						remainder );
				g_ptr_array_add ( wrapped_message, new_line );
				start_from = NULL;
				break;
			}

			/* Start from the end, working backwards looking for a
			 * whitespace character.  We start at [wrap_after],
			 * which is actually the (wrap_after + 1)th character,
			 * so that we can break at a trailing space.
			 */
			for ( j = wrap_after; j > 0; j-- ) {
				if ( g_ascii_isspace ( start_from [j] ) ) {
					break;
				}
			}
			if ( ! g_ascii_isspace ( start_from [j] ) ) {
				/* We didn't find a whitespace character; break
				 * the line at wrap_after characters, even
				 * though it'll break a word.
				 */
				j = wrap_after;
			}
			if ( j == wrap_after ) {
				/* Move j back one; we include the character
				 * at start_from [j] later.
				 */
				j--;
			}

			/* Include the character at start_from [j], so that we
			 * grab trailing spaces and the start of the next line
			 * looks prettier.
			 */
			new_line = g_string_new_len ( start_from, j + 1 );
			g_ptr_array_add ( wrapped_message, new_line );
			/* Start processing after j; we've removed j + 1
			 * characters from the line.
			 */
			start_from = & start_from [ j + 1 ];
			remainder -= j + 1;

			debug_print ( DEBUG_LOOP_VERBOSE, "wrapped after "
					"%" G_GSIZE_FORMAT
					"/%" G_GSIZE_FORMAT
					" characters; "
					"%" G_GSIZE_FORMAT
					" remaining: \"%s\"\n", j + 1,
					wrap_after, remainder, start_from );
		}
	}

	debug_sub_exit;
	return ( wrapped_message );
}

/* This function should be called before line_wrap: expand all tabs within the
 * line to eight spaces (not configurable; tabs are eight spaces, regardless of
 * what the heathens might say) so that line_wrap is dealing with physical
 * character counts rather than virtual counts.  Returns a new GPtrArray of new
 * GStrings, all of which need to be freed by the caller.
 */

GPtrArray * tabs_to_spaces ( const GPtrArray * message ) {

	GPtrArray * expanded_message;
	GString * new_line, * line;
	gchar * tab;
	gsize i, j, k, num_spaces, num_tabs, tab_length = 8;

	debug_sub_enter;
	debug_assert ( message != NULL, "passed a NULL message" );

	debug_print ( DEBUG_INFO, "expanding tabs in %" G_GSIZE_FORMAT
			" lines\n", message->len );

	expanded_message = g_ptr_array_sized_new ( message->len );
	for ( i = 0; i < message->len; i++ ) {
		line = g_ptr_array_index ( message, i );
		debug_print ( DEBUG_LOOP_VERBOSE, "expanding tabs in line "
				"%" G_GSIZE_FORMAT
				"/%" G_GSIZE_FORMAT
				": %s\n", i, message->len, line->str );

		tab = strchr ( line->str, '\t' );
		if ( tab == NULL ) {
			debug_print ( DEBUG_LOOP_VERBOSE,
					"no tab expansion necessary.\n" );
			new_line = g_string_new_len ( line->str, line->len );
			g_ptr_array_add ( expanded_message, new_line );
			continue;
		}
		/* else . . . there are tabs to be expanded. */

		num_tabs = 0;
		new_line = g_string_sized_new ( line->len );
		for ( j = 0; j < line->len; j++ ) {
			if ( line->str [j] != '\t' ) {
				g_string_append_c ( new_line, line->str [j] );
				continue;
			}

			num_tabs++;
			num_spaces = tab_length
				- ( new_line->len % tab_length );
			if ( num_spaces == 0 ) {
				num_spaces = tab_length;
			}
			for ( k = 0; k < num_spaces; k++ ) {
				g_string_append_c ( new_line, ' ' );
			}
		}
		g_ptr_array_add ( expanded_message, new_line );

		/* Quick consistency check . . . */
		debug_assert ( num_tabs > 0, "I found a tab, or I wouldn't "
				"have reached here.  Why is the tab count "
				"zero?\n" );
		debug_print ( DEBUG_LOOP_VERBOSE, "expanded "
				"%" G_GSIZE_FORMAT
				" tabs to "
				"%" G_GSIZE_FORMAT
				"spaces\n",
				num_tabs, new_line->len - line->len );
	}

	debug_sub_exit;
	return ( expanded_message );
}
