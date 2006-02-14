#ifndef MISC_H
#define MISC_H

/* Misc helper functions used in oi. */

/* strings is presumed to be a GPtrArray of GString *; all GStrings in the array
 * will be freed, and the array itself freed.
 */

void free_string_array ( GPtrArray * strings );

/* Append the contents of source to destination.  Destination will be unchanged.
 * The strings in destination will not be deeply copied; you'll end up with two
 * pointers to the same string.
 */

void append_string_array ( GPtrArray * destination, GPtrArray * source );

/* Duplicate the string array strings. */

GPtrArray * copy_string_array ( const GPtrArray * strings );

#endif /* MISC_H */
