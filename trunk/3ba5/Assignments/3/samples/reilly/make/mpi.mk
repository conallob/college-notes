####sk  We use gcc locally so ...
####sk  CC = mpicc -mpiarch $(ARCH) $(FLAGS)
CC = mpicc -mpicc gcc -mpiarch $(ARCH) $(FLAGS)
FC = mpif77 -mpiarch $(ARCH) $(FLAGS)
COMMS = mpi
