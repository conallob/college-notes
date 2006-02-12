# $Id: /college/trunk/fyp/2.0/Makefile 2071 2006-02-05T18:01:21.570734Z conall  $

CC=gcc
LDFLAGS= 


APRCFG= apr-config --includes --cflags --cppflags --link-ld --libs

aprbootstrap=$(APRCFG) 

SRC= src

TARGET=oi-test 
DESTDIR			=	.

milestone: milestone1

milestone1: 
	$(CC) `$(aprbootstrap)` \
	-o $(DESTDIR)/$(TARGET) \ 
	$(SRC)/milestone1.c

debug:
	CFLAGS=" -g" \
	LDFLAGS=" -L$(HOME)/lib/ -lefence " \
	$(CC) `$(aprbootstrap)` \
	-o $(DESTDIR)/$(TARGET) \
	$(SRC)/milestone1.c 
