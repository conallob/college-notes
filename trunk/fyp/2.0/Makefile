# $Id: /college/trunk/fyp/2.0/Makefile 2071 2006-02-05T18:01:21.570734Z conall  $

APRCFG			=	apr-config --includes --cflags --cppflags --link-ld --libs

aprbootstrap 	=	$(APRCFG) 

DESTDIR			=	.

milestone: milestone1

milestone1: 
	gcc `$(aprbootstrap)` -o $(DESTDIR)/test src/milestone1.c
