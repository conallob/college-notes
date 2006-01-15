/* $Id$ */

/* The various structs and enums required for per-recipient preferences.  Every
 * reasonable preference should be per-recipient - at the moment the only one I
 * can think of that shouldn't be is debugging, although I'm considering making
 * that per-recipient too . . .  Every function in oi should take per-recipient
 * preferences into account, unless there's a bloody good reason not to.
 */

#ifndef RECIPIENT_H
#define RECIPIENT_H

#include <glib.h>
#include "colours.h"

enum mail_pref {
	/* Send mail without asking. */
	AUTO_MAIL,
	/* Ask. */
	ASK_MAIL,
	/* Never send mail; discard the recipient. */
	NEVER_MAIL
};

enum justify {
	JLEFT,
	JCENTRE,
	JRIGHT
};

/* PREF_USERNAME_TO and PREF_USERNAME_FROM use different usernames, but
 * also put them into different strings:
 * PREF_USERNAME_TO		-> "Oi %s,"
 * PREF_USERNAME_FROM		-> "%s says . . . "
 * Likewise with PREF_GECOS_TO and PREF_GECOS_FROM.
 */
enum pref {
	/* Don't use a whatever. */
	PREF_NONE,
	/* Just use the username of the recipient. */
	PREF_USERNAME_TO,
	/* Just use the username of the sender. */
	PREF_USERNAME_FROM,
	/* Use name of the recipient from gecos field in /etc/passwd. */
	PREF_GECOS_TO,
	/* Use name of the sender from gecos field in /etc/passwd. */
	PREF_GECOS_FROM,
	/* User supplied fixed string. */
	PREF_FIXED,
	/* Randomly picked from a list of files. */
	PREF_RANDOM,
};


/* colours_to_box_chars and box_chars_to_colours rely on BOX_* being equal to
 * COLOUR_*, and the colours bein contiguous.
 */

/* Indexes to get parts of the box out of box_chars. */
#define BOX_START	0
#define BOX_TL		0
#define BOX_T		1
#define BOX_TR		2
#define BOX_L		3
#define BOX_R		4
#define BOX_BL		5
#define BOX_B		6
#define BOX_BR		7
#define BOX_END		7

#define NUM_BOX_CHARS	8

/* Indices to get colours out of struct recipient->colours. */
#define COLOUR_START	0
#define COLOUR_TL	0
#define COLOUR_T	1
#define COLOUR_TR	2
#define COLOUR_L	3
#define COLOUR_R	4
#define COLOUR_BL	5
#define COLOUR_B	6
#define COLOUR_BR	7
#define COLOUR_TEXT	8
#define COLOUR_END	8
#define NUM_COLOUR_FG	9

#define COLOUR_START_BG	COLOUR_START	+ NUM_COLOUR_FG
#define COLOUR_TL_BG	COLOUR_TL	+ NUM_COLOUR_FG
#define COLOUR_T_BG	COLOUR_T	+ NUM_COLOUR_FG
#define COLOUR_TR_BG	COLOUR_TR	+ NUM_COLOUR_FG
#define COLOUR_L_BG	COLOUR_L	+ NUM_COLOUR_FG
#define COLOUR_R_BG	COLOUR_R	+ NUM_COLOUR_FG
#define COLOUR_BL_BG	COLOUR_BL	+ NUM_COLOUR_FG
#define COLOUR_B_BG	COLOUR_B	+ NUM_COLOUR_FG
#define COLOUR_BR_BG	COLOUR_BR	+ NUM_COLOUR_FG
#define COLOUR_TEXT_BG	COLOUR_TEXT	+ NUM_COLOUR_FG
#define COLOUR_END_BG	COLOUR_END	+ NUM_COLOUR_FG
#define NUM_COLOUR_BG	NUM_COLOUR_FG

#define NUM_BOX_COLOURS	NUM_COLOUR_FG	+ NUM_COLOUR_BG

/* These structures are ref-counted, so I don't needlessly duplicate them.  The
 * parser is the only piece of code which should be allocating any of these, and
 * it'll be going through the copy/allocate/free functions here.
 */

struct recipient_pref {
	enum pref pref;
	enum justify justify;
	GString * fixed_string;
	/* A GPtrArray of GStrings, as usual. */
	GPtrArray * random_files;
	/* Index into the global Colours array. */
	gsize fg_colour;
	gsize bg_colour;
	gsize ref_count;
};

typedef struct recipient_pref recipient_pref;

struct recipient {
	/* Username of this recipient, making this structure self-contained. */
	GString * username;
	enum mail_pref mailem;
	enum justify justify;

/*
 * To:		Oi tobinjt,
 * From:	John Tobin says . . . 
 * Message:                       J--------------o
 *                                | kjisdvidsvi. |
 *                                h--------------n
 * Signature:                  Soul of a New Machine
 */

/* POSSIBLY: Possibilities:
 * %substitutions in From, To and Signature?
 * Basically how configurable should they be?  Make things simple for now, but
 * extensible later.
 */
	recipient_pref * sig;
	recipient_pref * to;
	recipient_pref * from;

	/* Indexs into the global Colours array. */
	gsize colours [NUM_BOX_COLOURS];
	/* One extra character (\0) for printing. */
	gchar box_chars [ NUM_BOX_CHARS + 1 ];
};

typedef struct recipient recipient;

/* The global recipient that all subsequent recipients inherit from.  Default
 * settings go here, and can obviously be modified at any time.
 */

extern recipient * Recipient;

/* Initialise the global recipient. */

void init_Recipient ( void );

/* Copy source recipient and return destination recipient, handling
 * ref-counting.  source->username will NOT be copied, it will be set to a copy
 * of username.
 */

recipient * copy_recipient ( const recipient * source,
		const gchar * username );

/* Free a recipient, handling ref-counting.  If the ref-count of any of the
 * recipient_prefs drops to zero they'll be freed too.  victim->username WILL
 * be freed also.
 */

void free_recipient ( recipient * victim );

/* Copy pref, duplicating any associated structures, and decrementing the
 * refcount.  die ()s if the refcount is already zero.
 */

recipient_pref * copy_pref ( recipient_pref * pref );

/* Map a recipient->colours index to a recipient->box_chars index. */

gsize colours_to_box_chars ( gsize i );

/* Map a recipient->box_chars index to a recipient->colours index. */

gsize box_chars_to_colours ( gsize i );

#endif
