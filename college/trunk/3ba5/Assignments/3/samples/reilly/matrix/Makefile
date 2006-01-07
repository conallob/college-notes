#----------------------------------------------------------------------
# Makefile. Taken from the shifter makefile
#----------------------------------------------------------------------

.KEEP_STATE:

MPI=mpi
include ../make/example.mk

TARGETS=matrix$(EXE)

all: $(TARGETS)

matrix$(EXE):	matrix.C
	$(LINK.C) matrix.C -o matrix$(EXE)
