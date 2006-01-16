# $Id$

APRCFG			=	which apr-config
APRCFGFLAGSS	=	--includes --cflags --cppflags --link-ld --libs

DESTDIR			=	.

milestone: milestone1

milestone1:
	gcc `$(APRCFG) $(APRCFGFLAGS)` -o $(DESTDIR)/test src/milestone1.c
