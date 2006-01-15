/* $Id$ */
#ifndef READ_MESSAGE_H
#define READ_MESSAGE_H

#include <glib.h>

/* Reads an unlimited number of lines of unlimited length from the user,
 * returning them in a GPtrArray of GStrings which is the responsibility of the
 * caller to free.  The message will be completely unchanged, except: trailing
 * newlines will be removed, and the terminitating line will be discarded.
 * 
 * Internally this uses readline () for user convenience, so refer to the
 * readline () docs for customisation info, including how to read from an
 * alternate source.
 *
 * The really clever bit is that when the user types ^L the entire message, plus
 * additional information, will be displayed :)
 */

GPtrArray * read_message ( void );

#endif /* READ_MESSAGE_H */
