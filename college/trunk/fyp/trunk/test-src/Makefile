# The difference between -I and -isystem is that -isystem suppresses annoying
# warning messages about prototypes etc - basically it cuts down on the clutter
# from header files I can do nothing (much) about.
GLIB_CFLAGS = $(shell pkg-config --cflags glib-2.0 | sed -e 's/-I/-isystem /g')
GLIB_LFLAGS = -L/usr/lib/debug $(shell pkg-config --libs glib-2.0 )
EXTRA_FLAGS = -DHEY_COMPATIBILITY
all:
	for source in *.c; do \
		output=`basename "$$source" .c`; \
		${CC} ${GLIB_CFLAGS} ${GLIB_LFLAGS} ${CFLAGS} ${EXTRA_FLAGS} \
		-I../../src/lib ../../src/lib/*.c \
		-I../../src/oi ../../src/oi/*.c \
		-lreadline \
		-o "$$output" "$$source"; \
	done

test:	all
	#--gen-suppressions=yes --track-fds=yes 
	for source in *.c; do \
		exe=`basename "$$source" .c`; \
		LD_LIBRARY_PATH=/usr/lib/debug valgrind --quiet --tool=memcheck --leak-check=yes --show-reachable=yes "$$exe" 6; \
	done
