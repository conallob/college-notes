#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#include "debug.h"
#include "error.h"
#include "misc.h"
#include "recipient.h"

/* $Id$ */

/* The global recipient that all subsequent recipients inherit from.  Default
 * settings go here, and can obviously be modified at any time.
 */

recipient * Recipient = NULL;

/* Initialise the global recipient. */

void init_Recipient ( void ) {

	gsize i;

	debug_sub_enter;

	debug_print ( DEBUG_INFO, "allocating Recipient\n" );
	Recipient = g_malloc ( sizeof ( * Recipient ) );

	debug_print ( DEBUG_VERBOSE, "setting misc attributes in "
			"GLOBAL RECIPIENT: username, mailem, justify\n" );
	Recipient->username	= g_string_new ( "!!! GLOBAL RECIPIENT !!!" );
	Recipient->mailem	= ASK_MAIL;
	Recipient->justify	= JLEFT;
	Recipient->sig		= g_malloc ( sizeof ( * Recipient->sig ) );
	Recipient->to		= g_malloc ( sizeof ( * Recipient->to ) );
	Recipient->from		= g_malloc ( sizeof ( * Recipient->from ) );

	/* I allocate the GStrings and GPtrArrays here to avoid having to litter
	 * the parser and other code with "if ( recipient->foo->bar != NULL ) {"
	 * This also enables me to litter my code with debug_assert ()
	 * statements checking those values are non-NULL.
	 */

	debug_print ( DEBUG_VERBOSE, "setting \"signature\" attributes in "
			"GLOBAL RECIPIENT\n" );
	Recipient->sig->ref_count		= 1;
	Recipient->sig->fg_colour		= COLOUR_cyan_light;
	Recipient->sig->bg_colour		= COLOUR_reset_bg;
	Recipient->sig->justify			= JCENTRE;
	Recipient->sig->random_files		= g_ptr_array_new ();
	Recipient->sig->pref			= PREF_FIXED;
	Recipient->sig->fixed_string		=
		g_string_new ( "Sent using ~tobinjt/bin/oi" );

	debug_print ( DEBUG_VERBOSE, "setting \"to\" attributes in "
			"GLOBAL RECIPIENT\n" );
	Recipient->to->ref_count		= 1;
	Recipient->to->fg_colour		= COLOUR_cyan_light;
	Recipient->to->bg_colour		= COLOUR_reset_bg;
	Recipient->to->justify			= JLEFT;
	Recipient->to->random_files		= g_ptr_array_new ();
	Recipient->to->pref			= PREF_GECOS_TO;
	Recipient->to->fixed_string		= g_string_new ( "" );

	debug_print ( DEBUG_VERBOSE, "setting \"from\" attributes in "
			"GLOBAL RECIPIENT\n" );
	Recipient->from->ref_count		= 1;
	Recipient->from->fg_colour		= COLOUR_cyan_light;
	Recipient->from->bg_colour		= COLOUR_reset_bg;
	Recipient->from->justify		= JLEFT;
	Recipient->from->random_files		= g_ptr_array_new ();
	Recipient->from->pref			= PREF_GECOS_FROM;
	Recipient->from->fixed_string		= g_string_new ( "" );

	debug_print ( DEBUG_VERBOSE, "setting colour attributes in "
			"GLOBAL RECIPIENT\n" );
	/* This may look like I'm cheating, but the whole point of
	 * COLOUR_END and COLOUR_END_BG is for loops like this.
	 */
	for ( i = COLOUR_START; i <= COLOUR_END; i++ ) {
		Recipient->colours [i]	= COLOUR_reset;
	}
	for ( i = COLOUR_START_BG; i <= COLOUR_END_BG; i++ ) {
		Recipient->colours [i]	= COLOUR_reset_bg;
	}

	debug_print ( DEBUG_VERBOSE, "setting \"colour\" attributes in "
			"GLOBAL RECIPIENT\n" );
	Recipient->box_chars [BOX_TL]	= '/';
	Recipient->box_chars [BOX_T]	= '-';
	Recipient->box_chars [BOX_TR]	= '\\';
	Recipient->box_chars [BOX_L]	= '|';
	Recipient->box_chars [BOX_R]	= '|';
	Recipient->box_chars [BOX_BL]	= '\\';
	Recipient->box_chars [BOX_B]	= '-';
	Recipient->box_chars [BOX_BR]	= '/';

	debug_sub_exit;
}

/* Copy source recipient and return destination recipient, handling
 * ref-counting.  source->username will NOT be copied, it will be set to a copy
 * of username.
 */

recipient * copy_recipient ( const recipient * source,
		const gchar * username ) {

	recipient * destination;

	debug_sub_enter;

	debug_assert ( source != NULL, "passed a NULL source recipient" );
	debug_assert ( source->to != NULL, "passed a source recipient "
			"with a NULL to" );
	debug_assert ( source->from != NULL, "passed a source recipient "
			"with a NULL from" );
	debug_assert ( source->sig != NULL, "passed a source recipient "
			"with a NULL sig" );
	debug_assert ( username != NULL, "passed a NULL username for "
			"new recipient" );

	debug_print ( DEBUG_VERBOSE, "allocating new recipient for %s\n",
			username );
	destination = g_malloc ( sizeof ( * destination ) );

	debug_print ( DEBUG_VERBOSE, "copying attributes from recipient %s\n",
			source->username->str );
	debug_print ( DEBUG_VERBOSE, "setting misc attributes for %s\n",
			username );
	destination->username	= g_string_new ( username );
	destination->mailem	= source->mailem;
	destination->justify	= source->justify;

	debug_print ( DEBUG_VERBOSE, "copying ref-counted recipient_prefs "
			"for %s\n", username );
	destination->sig	= source->sig;
	destination->to		= source->to;
	destination->from	= source->from;
	destination->sig->ref_count++;
	destination->to->ref_count++;
	destination->from->ref_count++;

	debug_print ( DEBUG_VERBOSE, "copying colours for %s\n", username );
	g_memmove ( destination->colours, source->colours,
			sizeof ( destination->colours ) );
	debug_print ( DEBUG_VERBOSE, "copying box_chars for %s\n", username );
	g_memmove ( destination->box_chars, source->box_chars,
			sizeof ( destination->box_chars ) );

	debug_sub_exit;
	return ( destination );
}

/* Free a recipient, handling ref-counting.  If the ref-count of any of the
 * recipient_prefs drops to zero they'll be freed too.  victim->username WILL
 * be freed also.
 */

void free_recipient ( recipient * victim ) {

	recipient_pref * prefs [3];
	const gchar * pref_names [ G_N_ELEMENTS ( prefs ) ];
	gsize i;

	debug_sub_enter;

	debug_assert ( victim != NULL,
			"passed a NULL victim recipient to free" );

	/* I'm taking the approach of setting everything to NULL, so that I'm
	 * more likely to segfault if I use a recipient after freeing it.
	 */

	prefs [0] = victim->sig;
	prefs [1] = victim->to;
	prefs [2] = victim->from;
	pref_names [0] = "sig";
	pref_names [1] = "to";
	pref_names [2] = "from";

	for ( i = 0; i < G_N_ELEMENTS ( prefs ); i++ ) {
		debug_print ( DEBUG_VERBOSE, "freeing %s prefs of %s\n",
				pref_names [i], victim->username->str );
		prefs [i]->ref_count--;
		if ( prefs [i]->ref_count != 0 ) {
			/* Ref-count hasn't dropped to zero yet. */
			continue;
		}

		debug_print ( DEBUG_VERBOSE, "%s prefs of %s has "
				"zero ref-count, fully freeing it\n",
				pref_names [i], victim->username->str );

		g_string_free ( prefs [i]->fixed_string, TRUE );
		free_string_array ( prefs [i]->random_files );
		prefs [i]->fixed_string = NULL;
		prefs [i]->random_files = NULL;
		/* cyan on magenta is probably the worst colour combination I've
		 * seen - only green on red comes close.
		 */
		prefs [i]->fg_colour = COLOUR_cyan;
		prefs [i]->bg_colour = COLOUR_magenta_bg;
		g_free ( prefs [i] );
	}

	victim->sig = NULL;
	victim->to = NULL;
	victim->from = NULL;

	/* If these are reused, we'll get white text on a white background. */
	debug_print ( DEBUG_VERBOSE, "overwriting colours\n" );
	for ( i = COLOUR_START_BG; i <= COLOUR_END_BG; i++ ) {
		victim->colours [i] = COLOUR_white_bg;
	}
	for ( i = COLOUR_START; i <= COLOUR_END; i++ ) {
		victim->colours [i] = COLOUR_white;
	}
	debug_print ( DEBUG_VERBOSE, "overwriting box_chars\n" );
	for ( i = BOX_START; i <= BOX_END; i++ ) {
		/* Things will get noisy if these are used :) */
		victim->box_chars [i] = '\a';
	}

	debug_print ( DEBUG_VERBOSE, "freeing username\n" );
	g_string_free ( victim->username, TRUE );
	victim->username = NULL;

	debug_print ( DEBUG_INFO, "freeing victim struct\n" );
	g_free ( victim );

	debug_sub_exit;
}

/* Copy pref, duplicating any associated structures, and decrementing the
 * refcount.  die ()s if the refcount is already zero.
 */

recipient_pref * copy_pref ( recipient_pref * pref ) {

	recipient_pref * copy;

	debug_sub_enter;

	debug_assert ( pref != NULL, "passed a NULL pref to duplicate" );
	debug_assert ( pref->random_files != NULL,
			"pref->random_files is NULL" );
	debug_assert ( pref->fixed_string != NULL,
			"pref->fixed_string is NULL" );
	debug_assert ( pref->ref_count != 0,
			"pref->ref_count is already zero" );

	copy = g_malloc ( sizeof ( * copy ) );
	copy->pref = pref->pref;
	copy->justify = pref->justify;
	copy->fg_colour = pref->fg_colour;
	copy->bg_colour = pref->bg_colour;
	copy->fixed_string = g_string_new_len ( pref->fixed_string->str,
			pref->fixed_string->len );
	copy->random_files = copy_string_array ( pref->random_files );

	copy->ref_count = 1;
	pref->ref_count--;

	debug_sub_exit;

	return ( copy );
}

/* Map a recipient->colours index to a recipient->box_chars index. */

gsize colours_to_box_chars ( gsize i ) {

	gsize result;

	debug_sub_enter;

	debug_assert ( i <= COLOUR_END_BG, "colour index must be <= to "
			G_STRINGIFY ( COLOUR_END_BG ) "\n" );

	if ( i <= COLOUR_END ) {
		result = i;
	} else {
		result = i - NUM_COLOUR_FG;
	}
	debug_sub_exit;
	return ( result );
}

/* Map a recipient->box_chars index to a recipient->colours index. */

gsize box_chars_to_colours ( gsize i ) {

	/* This function is called very frequently from box_message, and
	 * seriously clutters up the debug output.  You may need to comment out
	 * the calls to debug_sub_enter and debug_sub_exit below.
	 */

	debug_sub_enter;

	debug_assert ( i <= BOX_END, "box_chars index must be <= to "
			G_STRINGIFY ( BOX_END ) "\n" );

	debug_sub_exit;
	return ( i );
}


