#----------------------------------------------------------------------
# my Makefile. it's the shifter makefile, butchered
#----------------------------------------------------------------------

.KEEP_STATE:

MPI=mpi
include ../make/example.mk

TARGETS=part_d$(EXE)

all: $(TARGETS)

part_d$(EXE):	part_d.c
	$(LINK.c) part_d.c -o part_d$(EXE)
