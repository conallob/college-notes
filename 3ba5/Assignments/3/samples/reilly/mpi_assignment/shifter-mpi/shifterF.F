C \begin{verbatim}

C     -----------------------------------------------------------------
C     shifterF.F --- example MPI program
C     -----------------------------------------------------------------

C     -----------------------------------------------------------------
C     
C     The Shifter Program
C     - - - - - - - - - -
C     
C     This simple little program shifts a set of numbers around a group
C     of processes. Each process enters a cycle of sending their number 
C     to the member above them then receiving a new number from the 
C     member below them. Numbers are wrapped around at the ends of the 
C     group.
C
C     -----------------------------------------------------------------

      Program shifterF

#include <mpif.h>		/* Include the MPI header file   */

      integer rank, size
      integer din, dout
      integer next, prev, tag
      integer req
      integer i, errcode
      integer status(MPI_STATUS_SIZE)

      print *, 'ALIVE'
      call mpi_init(errcode)

      call mpi_comm_rank(MPI_COMM_WORLD, rank, errcode)
      call mpi_comm_size(MPI_COMM_WORLD, size, errcode)
      
      next = mod((rank + 1), size)
      prev = mod((rank + size - 1), size)
      tag  = 0

      dout = rank

      do 10 i=1, size
         call mpi_issend(dout, 1, MPI_INTEGER, next, tag,
     +                   MPI_COMM_WORLD, req, errcode)
         call mpi_recv(din, 1, MPI_INTEGER, prev, tag,
     +                 MPI_COMM_WORLD, status, errcode)

         call mpi_wait(req, status, errcode)
         print *, '[',rank,'] : ',i,' -> ',din
         dout = din
 10   continue
         
      call mpi_finalize()
      end

C     ------------------------------------------------------------
C \end{verbatim}
