# $Id$

APRCFG			=	apr-config --includes --cflags --cppflags --link-ld --libs

aprbootstrap 	=	$(APRCFG) 

DESTDIR			=	.

milestone: milestone1

milestone1: 
	gcc `$(aprbootstrap)` -o $(DESTDIR)/test src/milestone1.c
