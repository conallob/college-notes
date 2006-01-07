# $Id$

# This file should be named "Makefile" and should be
# stored in the same directory as the source files.

# To compile this, enter "make GameController" or just "make"

Bankers: MessageQueue.o BankersController.o BankersMain.o General.o
	g++ -lpthread -g -o Bankers MessageQueue.o BankersController.o BankersMain.o General.o
Bankers: MessageQueue.o BankersController.o BankersMain.o General.o
	g++ -lpthread -g -o Bankers MessageQueue.o BankersController.o BankersMain.o General.o
all: MessageQueue.o BankersController.o BankersMain.o General.o
	g++ -lpthread -g -o Bankers MessageQueue.o BankersController.o BankersMain.o General.o

MessageQueue.o:	MessageQueue.C MessageQueue.h General.h
	g++ -g -c MessageQueue.C
messagequeue:	MessageQueue.C MessageQueue.h General.h
	g++ -g -c MessageQueue.C
msgq:	MessageQueue.C MessageQueue.h General.h
	g++ -g -c MessageQueue.C
	
BankersController.o:	BankersController.C BankersController.h General.h
	g++ -g -c BankersController.C
bankerscontroller:	BankersController.C BankersController.h General.h
	g++ -g -c BankersController.C
ctrl:	BankersController.C BankersController.h General.h
	g++ -g -c BankersController.C
	
BankersMain.o:	BankersMain.C BankersController.h MessageQueue.h General.h
	g++ -g -c BankersMain.C
main:	BankersMain.C BankersController.h MessageQueue.h General.h
	g++ -g -c BankersMain.C

General.o:	General.C General.h
	g++ -g -c General.C
general:	General.C General.h
	g++ -g -c General.C

gen:	General.C General.h
	g++ -g -c General.C
