# $Id: /college/trunk/fyp/2.0/Makefile 2071 2006-02-05T18:01:21.570734Z conall  $

CC= gcc

APR_CFLAGS=  $(shell apr-config --includes --cflags --cppflags)
APR_LDFLAGS= $(shell apr-config --includes --cflags --cppflags --link-ld --libs)

TARGET= oi-test

.PHONY: clean linklist.c client.c daemon.c apr_client.c oid.c

all: current

current: milestone2

milestone2: apr_client daemon oid

clean: clean.o clean.target


apr_client: apr_client.c
	$(CC) apr_client.o $(LDFLAGS) $(APR_LDFLAGS) -o apr_client 

client: client.c linklist.c
	$(CC) linklist.o client.o $(LDFLAGS) $(APR_LDFLAGS) -o client 

daemon: oid.c
	$(CC) oid.o $(LDFLAGS) $(APR_LDFLAGS) -o oid

linklist.c:
	$(CC) $(CFLAGS) -c linklist.c $(APR_CFLAGS)

linklist.o: linklist.c
	$(CC) linklist.o $(LDFLAGS) $(APR_LDFLAGS)


apr_client.c:
	$(CC) $(CFLAGS) -c apr_client.c $(APR_CFLAGS)

client.c:
	$(CC) $(CFLAGS) -c client.c $(APR_CFLAGS)

oid.c:
	$(CC) $(CFLAGS) -c oid.c $(APR_CFLAGS)


clean.o:
	rm *.o

clean.out:
	rm *.out

clean.target:
	rm $(TARGET) daemon client apr_client oid
