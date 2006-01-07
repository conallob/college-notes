#----------------------------------------------------------------------#
# Example Directory Makefile                                           #
#----------------------------------------------------------------------#

ARCH       = void
ARCHES	   = sun4 t800 i860 cshost sgi4 sgi5 rs6000 sun5 vmsp symm axposf casim cs2 hpux7

FLAGS      = 
CC	   = chpcc  -chimp $(ARCH) $(FLAGS)
FC	   = chpf77 -chimp $(ARCH) $(FLAGS)

TARGET     = all
TIDY       = *$(OBJ) core *~ 
CLEAN      = $(TIDY) *$(EXE)

RECMAKE    = $(MAKE) -e

COMMS      = chimp

include $(MDIR)../make/$(ARCH).mk
include $(MDIR)../make/$(MPI).mk

default:
	@echo "Specify one of [ $(ARCHES) ]"

clean::
	/bin/rm -f $(CLEAN)
        @echo "Cleaned up : $ARCH"

tidy::
	/bin/rm -f $(TIDY)
	@echo "Tidied up : $ARCH"

sun4:
	@$(RECMAKE) ARCH=sun4 MPI="$(MPI)" CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_sun4)" C_F="$(CFLAGS_sun4)" $(TARGET) 

sun5:
	@$(RECMAKE) ARCH=sun5 MPI="$(MPI)" CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_sun5)" C_F="$(CFLAGS_sun5)" $(TARGET)

sgi4:
	@$(RECMAKE) ARCH=sgi4 MPI="$(MPI)" CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_sgi4)" C_F="$(CFLAGS_sgi4)" $(TARGET) 

sgi5:
	@$(RECMAKE) ARCH=sgi5 MPI="$(MPI)" CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_sgi5)" C_F="$(CFLAGS_sgi5)" $(TARGET) 

symm:
	@$(RECMAKE) ARCH=symm MPI="$(MPI)" CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_symm)" C_F="$(CFLAGS_symm)" $(TARGET) 

rs6000:
	@$(RECMAKE) ARCH=rs6000 MPI="$(MPI)" CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_rs6000)" C_F="$(CFLAGS_rs6000)" $(TARGET) 

axposf:
	@$(RECMAKE) ARCH=axposf MPI="$(MPI)" CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_axposf)" C_F="$(CFLAGS_axposf)" $(TARGET)

hpux7:
	@$(RECMAKE) ARCH=hpux7 MPI="$(MPI)" CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_hpux7)" C_F="$(CFLAGS_hpux7)" $(TARGET)

t800:
	@$(RECMAKE) ARCH=t800 MPI="$(MPI)" CPP_F="$(CPPFLAGS_cs1) $(CPPFLAGS_t800)" C_F="$(CFLAGS_t800)" $(TARGET)

i860:
	@$(RECMAKE) ARCH=i860 MPI="$(MPI)" CPP_F="$(CPPFLAGS_cs1) $(CPPFLAGS_i860)" C_F="$(CFLAGS_i860)" $(TARGET)

cshost:
	@$(RECMAKE) ARCH=cshost MPI="$(MPI)" CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_cshost)" C_F="$(CFLAGS_cshost)" $(TARGET)
	
casim:
	@$(RECMAKE) ARCH=casim MPI="$(MPI)" CPP_F="$(CPPFLAGS_cap) $(CPPFLAGS_casim)" C_F="$(CFLAGS_casim)" $(TARGET)

apcell:
	@$(RECMAKE) ARCH=apcell MPI="$(MPI)" CPP_F="$(CPPFLAGS_cap) $(CPPFLAGS_apcell)" C_F="$(CFLAGS_apcell)" $(TARGET)

cs2:
	@$(RECMAKE) ARCH=cs2 MPI="$(MPI)" CPP_F="$(CPPFLAGS_cs2)" C_F="$(CFLAGS_cs2)" $(TARGET)

sun4-mpi:
	@$(RECMAKE) ARCH=sun4 CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_sun4)" C_F="$(CFLAGS_sun4)" MPI=mpi COMMS=mpi $(TARGET) 

sun5-mpi:
	@$(RECMAKE) ARCH=sun5 CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_sun5)" C_F="$(CFLAGS_sun5)" MPI=mpi COMMS=mpi $(TARGET)

sgi4-mpi:
	@$(RECMAKE) ARCH=sgi4 CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_sgi4)" C_F="$(CFLAGS_sgi4)" MPI=mpi COMMS=mpi $(TARGET) 

sgi5-mpi:
	@$(RECMAKE) ARCH=sgi5 CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_sgi5)" C_F="$(CFLAGS_sgi5)" MPI=mpi COMMS=mpi $(TARGET) 

symm-mpi:
	@$(RECMAKE) ARCH=symm CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_symm)" C_F="$(CFLAGS_symm)" MPI=mpi COMMS=mpi $(TARGET) 

rs6000-mpi:
	@$(RECMAKE) ARCH=rs6000 CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_rs6000)" C_F="$(CFLAGS_rs6000)" MPI=mpi COMMS=mpi $(TARGET) 

axposf-mpi:
	@$(RECMAKE) ARCH=axposf CPP_F="$(CPPFLAGS_unix) $(CPPFLAGS_axposf)" C_F="$(CFLAGS_axposf)" MPI=mpi COMMS=mpi $(TARGET)

t800-mpi:
	@$(RECMAKE) ARCH=t800 CPP_F="$(CPPFLAGS_t800)" C_F="$(CFLAGS_t800)" MPI=mpi COMMS=mpi $(TARGET)

i860-mpi:
	@$(RECMAKE) ARCH=i860 CPP_F="$(CPPFLAGS_i860)" C_F="$(CFLAGS_i860)" MPI=mpi COMMS=mpi $(TARGET)

cshost-mpi:
	@$(RECMAKE) ARCH=cshost CPP_F="$(CPPFLAGS_cs1) $(CPPFLAGS_cshost)" C_F="$(CFLAGS_cshost)" MPI=mpi COMMS=mpi $(TARGET)


cs2-mpi:
	@$(RECMAKE) ARCH=cs2 CPP_F="$(CPPFLAGS_cs2)" C_F="$(CFLAGS_cs2)" MPI=mpi COMMS=mpi $(TARGET)

apcell-mpi:
	@$(RECMAKE) ARCH=apcell CPP_F="$(CPPFLAGS_cap) $(CPPFLAGS_apcell)" C_F="$(CFLAGS_apcell)" MPI=mpi COMMS=mpi $(TARGET)

EXE        = .$(ARCH)
OBJ        = -$(ARCH).o

.SUFFIXES: $(EXE) $(OBJ)

COMPILE.c  = $(CC) $(CPP_F) $(CPPFLAGS) $(C_F) $(CFLAGS) -c
LINK.c     = $(CC) $(CPP_F) $(CPPFLAGS) $(C_F) $(CFLAGS) $(LD_F) $(LDFLAGS)

COMPILE.F  = $(FC) $(FCPP_F) $(FCPPFLAGS) $(F_F) $(FFLAGS) -c
LINK.F     = $(FC) $(FCPP_F) $(FCPPFLAGS) $(F_F) $(FFLAGS) $(LDF_F) $(FLDFLAGS)

.c$(OBJ):
	$(COMPILE.c) $< -o $@

.F$(OBJ):
	$(COMPILE.F) $< -o $@
