/* $Id$ */

/* Functions to format the message the user wants to send.  The original message
 * is left unaltered, and a new one returned.  format_message () should be
 * called once for every recipient, to take recipient specific preferences into
 * account.  It'll do all the required formatting - including adding the
 * signature etc.
 */

#ifndef FORMAT_MESSAGE_H
#define FORMAT_MESSAGE_H

#include <glib.h>

#include "recipient.h"

/* All of these function assume that lines in the message parameter have the
 * trailing newline stripped.  If it isn't stripped, things will go wrong - the
 * box in particular will be fucked.
 */

/* This function should be called before line_wrap: expand all tabs within the
 * line to eight spaces (not configurable; tabs are eight spaces, regardless of
 * what the heathens might say) so that line_wrap is dealing with physical
 * character counts rather than virtual counts.  Returns a new GPtrArray of new
 * GStrings, all of which need to be freed by the caller.
 */

GPtrArray * tabs_to_spaces ( const GPtrArray * message );

/* This function should be called before format_message: wrap all the lines in
 * message to <= wrap_after, respecting word boundaries.  Returns a new
 * GPtrArray of new GStrings, all of which need to be freed by the caller.
 */

GPtrArray * line_wrap ( const GPtrArray * message, gsize wrap_after );

/* Format the contents of message (leaving it unchanged) according to the
 * preferences specified in recipient.  The formatted message will be returned
 * and it's the caller's responsibility to free the associated memory.  No extra
 * formatting should be required; the signature etc will be added by this
 * function.  Colours will be added as required, and the caller may want to
 * strip them before logging the message to a file.
 */

GPtrArray * format_message ( const GPtrArray * message,
		recipient * recipient, gsize numlines, gsize wrap_after );

#endif /* FORMAT_MESSAGE_H */
