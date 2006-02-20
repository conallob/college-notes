# $Id: /college/trunk/fyp/2.0/Makefile 2071 2006-02-05T18:01:21.570734Z conall  $

CC= gcc

APR_CFLAGS=  $(shell apr-config --includes --cflags --cppflags)
APR_LDFLAGS= $(shell apr-config --includes --cflags --cppflags --link-ld --libs)

TARGET= oi-test

.PHONY: clean linklist.c linklist.o client.c milestone1

all: current

current: milestone

milestone1: client

clean: clean.o clean.target


client: client.c linklist.c
	$(CC) linklist.o client.o $(LDFLAGS) $(APR_LDFLAGS) -o $(TARGET) 


linklist.c:
	$(CC) $(CFLAGS) -c linklist.c $(APR_CFLAGS)

linklist.o: linklist.c
	$(CC) linklist.o $(LDFLAGS) $(APR_LDFLAGS)


client.c:
	$(CC) $(CFLAGS) -c client.c $(APR_CFLAGS)


clean.o:
	rm *.o

clean.out:
	rm *.out

clean.target:
	rm $(TARGET)
