#----------------------------------------------------------------------
# Shifter Makefile
#----------------------------------------------------------------------
#
# RcsId: $Id: Makefile,v 1.2 1995/01/09 15:22:03 chimp Exp $
# Log:   $Log: Makefile,v $
# Log:   Revision 1.2  1995/01/09 15:22:03  chimp
# Log:   Unexplained textual differences.
# Log:
# Revision 1.1  1994/05/13 09:12:40  chimp
# Initial revision.
#
# Revision 1.3  1993/07/29  11:58:19  chimp
# Concise make configuration.
#
#
#----------------------------------------------------------------------

.KEEP_STATE:

MPI=mpi
include ../make/example.mk

####sk  We don't want the Fortran:
####sk  TARGETS=shifter$(EXE) shifterF$(EXE)
TARGETS=shifter$(EXE)

all: $(TARGETS)

shifter$(EXE):	shifter.c
	$(LINK.c) shifter.c -o shifter$(EXE)

shifterF$(EXE):	shifterF.F
	$(LINK.F) shifterF.F -o shifterF$(EXE)

