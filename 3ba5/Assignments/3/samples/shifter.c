/*
\begin{verbatim}
*/

/*----------------------------------------------------------------------*/
/* shifter.c --- example MPI program */

#include <stdio.h>
#include <mpi.h>		/* Include the MPI header file   */

int rank;			/* Rank in world group           */
int size;			/* Size of world group           */

int dIn;                        /* Buffer for incoming data      */
int dOut;                       /* Buffer for outgoing data      */

int next;			/* Process to send to            */
int prev;			/* Process to recv from          */
int tag;			/* Tag to use in communication   */

MPI_Request req;		/* Status storage (sending)      */

/*----------------------------------------------------------------------*/
/* 
 * The Shifter Program
 * - - - - - - - - - -
 *
 * This simple little program shifts a set of numbers around a group
 * of processes. Each process enters a cycle of sending their number 
 * to the member above them then receiving a new number from the 
 * member below them. Numbers are wrapped around at the ends of the 
 * group.
 */

int main(int argc, char *argv[])
{
  register int i;               /* Loop variable */

  printf("alive\n");
  /* MPI_Init must be called before any other MPI function. */
  MPI_Init(&argc, &argv);

  /* Find out which member we are. This is the seed for the transfer. */
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  dOut=rank;

  /* Figure out the size of the group. */
  MPI_Comm_size(MPI_COMM_WORLD, &size);
  if (size < 2)
    {
      printf("ERROR: world group must have at least two members!\n");
      chp_exit(-1);
    }

  /* Shift n times where n is the size of the group. */
  for (i=0; i<size; i++)
    {
      next = (rank+1) % size;
      prev = (rank+size-1) % size;
      tag  = 0;
      
      MPI_Issend(&dOut, 1, MPI_INT, next, tag, MPI_COMM_WORLD, &req);
      MPI_Recv(&dIn, 1, MPI_INT, prev, tag, MPI_COMM_WORLD, NULL);

      MPI_Wait(&req, NULL);
  
      /* Output the current data item. */
      printf("[%d] : %d -> %d\n", rank, i, dIn);
      dOut=dIn;
    }

  /* Always use MPI_Finalize ! */
  MPI_Finalize();
}

/*
\end{verbatim}
*/
