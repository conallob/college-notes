#----------------------------------------------------------------------
# my Makefile. it's the shifter makefile, butchered
#----------------------------------------------------------------------

.KEEP_STATE:

MPI=mpi
include ../make/example.mk

TARGETS=part_c$(EXE)

all: $(TARGETS)

part_c$(EXE):	part_c.c
	$(LINK.c) part_c.c -o part_c$(EXE)
