# $Id: /college/trunk/fyp/2.0/Makefile 2071 2006-02-05T18:01:21.570734Z conall  $

CC= gcc

CFLAGS		 = -lc -g -O2

APR_CFLAGS  := $(shell apr-config --includes --cflags --cppflags)
APR_LDFLAGS := $(shell apr-config --includes --link-ld --libs)

TARGET= oi-test

.PHONY: clean 

all: current

current: milestone2

milestone2: apr_client daemon oid

clean: clean.o clean.target


apr_client: apr_client.o
	$(CC) $(LDFLAGS) $(APR_LDFLAGS) $^ -o $@

client: client.o linklist.o
	$(CC) $(LDFLAGS) $(APR_LDFLAGS) $^ -o $@

oi_client: oi_client.o linklist.o
	$(CC) $(LDFLAGS) $(APR_LDFLAGS) $^ -o $@

daemon: oid.o
	$(CC) $(LDFLAGS) $(APR_LDFLAGS) $^ -o $@

utmp_test: aux.o oi_logins.o utent.o utmp_test.o
	$(CC) $(LDFLAGS) $(APR_LDFLAGS) $^ -o $@


linklist.o: linklist.c
	$(CC) $(CFLAGS) -c $< $(APR_CFLAGS)

oi_client.o: oi_client.c
	$(CC) $(CFLAGS) -c $< $(APR_CFLAGS)

apr_client.o: apr_client.c
	$(CC) $(CFLAGS) -c $< $(APR_CFLAGS)

client.o: client.c
	$(CC) $(CFLAGS) -c $< $(APR_CFLAGS)

oid.o: oid.c
	$(CC) $(CFLAGS) -c $< $(APR_CFLAGS)

oi_logins.o: oi_logins.c
	$(CC) $(CFLAGS) -c $< $(APR_CFLAGS)

utent.o: utent.c
	$(CC) $(CFLAGS) -c $< $(APR_CFLAGS)

aux.o: aux.c
	$(CC) $(CFLAGS) -c $< $(APR_CFLAGS)

utmp_test.o: utmp_test.c
	$(CC) $(CFLAGS) -c $< $(APR_CFLAGS)


clean.o:
	rm *.o

clean.out:
	rm *.out

clean.target:
	rm $(TARGET) daemon client apr_client oid oi_client
