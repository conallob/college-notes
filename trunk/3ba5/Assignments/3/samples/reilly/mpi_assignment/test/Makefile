#----------------------------------------------------------------------
# my Makefile. it's the shifter makefile, butchered
#----------------------------------------------------------------------

.KEEP_STATE:

MPI=mpi
include ../make/example.mk

TARGETS=test$(EXE)

all: $(TARGETS)

test$(EXE):	test.c
	$(LINK.c) test.c -o test$(EXE)
