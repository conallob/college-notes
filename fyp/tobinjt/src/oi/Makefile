# The difference between -I and -isystem is that -isystem suppresses annoying
# warning messages about prototypes etc - basically it cuts down on the clutter
# from header files I can do nothing (much) about.
GLIB_CFLAGS = $(shell pkg-config --cflags glib-2.0 | sed -e 's/-I/-isystem /g')
#GLIB_LFLAGS = -L/usr/lib/debug $(shell pkg-config --libs glib-2.0 )

all:
	make -C ../lib
	${CC} ${GLIB_CFLAGS} ${GLIB_LFLAGS} ${CFLAGS} -DHEY_COMPATIBILITY \
		-c -I../lib *.c

clean:
	-rm -f *.o
