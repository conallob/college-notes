# $Id: /college/trunk/fyp/2.0/Makefile 2071 2006-02-05T18:01:21.570734Z conall  $

CC= gcc

APR_CFLAGS=  $(shell apr-config --includes --cflags --cppflags)
APR_LDFLAGS= $(shell apr-config --includes --cflags --cppflags --link-ld --libs)

TARGET= oi-test

.PHONY: clean linklist.c linklist.o milestone1.c milestone1

all: current

current: milestone

milestone: milestone1

clean: clean.o clean.out clean.target


milestone1: milestone1.c linklist.c
	$(CC) linklist.o milestone1.o $(LDFLAGS) $(APR_LDFLAGS) -o $(TARGET) 


linklist.c:
	$(CC) $(CFLAGS) -c linklist.c $(APR_CFLAGS)

linklist.o: linklist.c
	$(CC) linklist.o $(LDFLAGS) $(APR_LDFLAGS)


milestone1.c:
	$(CC) $(CFLAGS) -c milestone1.c $(APR_CFLAGS)


clean.o:
	rm *.o

clean.out:
	rm *.out

clean.target:
	rm $(TARGET)
