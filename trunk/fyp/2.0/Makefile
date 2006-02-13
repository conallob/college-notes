# $Id: /college/trunk/fyp/2.0/Makefile 2071 2006-02-05T18:01:21.570734Z conall  $

CC=gcc


APR_FLAGS="`apr-config --includes --cflags --cppflags --link-ld --libs`"

SRC= src

TARGET= oi-test 
DESTDIR=	.

milestone: milestone1

objects:
	$(GCC) -c \
	$(SRC)/*.c \
	$(APR_FLAGS)

milestone1: objects
	$(CC) \ 
	$(SRC)/*.o  \
	`$(APRCFG)` \
	-o $(DESTDIR)/$(TARGET)

debug:
	CFLAGS=" -g -Wall" \
	LDFLAGS=" -L$(HOME)/lib/ -lefence " \
	milestone
