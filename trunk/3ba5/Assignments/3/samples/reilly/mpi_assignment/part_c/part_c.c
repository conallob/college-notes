#include <unistd.h>
#include <stdlib.h>
#include <math.h>
#include <mpi.h>
#include <stdio.h>

/*include f () and g () */
#include "../part_a/funcs.c"

int main ( int argc, char **argv ) {
	/* needed for computing where to send to,
	   and how long to shift and multiply for */
	int size, length, rank;
	/* where am i in the matrix? */
	int row, column;
	/* where to send  to */
	int left, right, below, above;
	/* my values from each matrix */
	int A, B;
	/* temp values for recieving */
	int newA, newB;
	/* and my result */
	int C;

	int tag;
	int i;
	MPI_Request my_request;

	/* initialise whatever needs to be initialised */
	MPI_Init ( &argc, &argv );

	/* find out our rank in the world */
	MPI_Comm_rank ( MPI_COMM_WORLD, &rank );
	/* and the size of the group */
	MPI_Comm_size ( MPI_COMM_WORLD, &size );

	/* now do the math to figure out where i am */
	/* length is the length of the sides */
	length = ( int ) sqrt ( ( double ) size );

	column = rank % length;
	row = rank / length;

	/* and where my neighbours are */
	left = ( rank + length - 1 ) % length;
	left = left + ( length * row );

	right = ( rank + 1 ) % length;
	right = right + ( length * row );

	above = ( size + rank - length ) % size;
	below = ( rank + length ) % size;


	/* my initial values */
	A = f ( row, column, length );
	B = g ( row, column, length );

	tag = 0;
	/* send the initial A values to their correct places */
	for ( i = 0; i < row; i++ ) {
		/* send to the left */
		MPI_Issend ( &A, 1, MPI_INT, left, tag, MPI_COMM_WORLD, &my_request );
		/* recieve from the right */
		MPI_Recv ( &newA, 1, MPI_INT, right, tag, MPI_COMM_WORLD, NULL );
		/* make sure that the send completed properly */
		MPI_Wait ( &my_request, NULL );
		A = newA;
	}

	tag = 0;
	/* send the initial B values to their correct places */
	for ( i = 0; i < column; i++ ) {
		MPI_Issend ( &B, 1, MPI_INT, above, tag, MPI_COMM_WORLD, &my_request );
		MPI_Recv ( &newB, 1, MPI_INT, below, tag, MPI_COMM_WORLD, NULL );
		MPI_Wait ( &my_request, NULL );
		B = newB;
	}


	tag = 0;
	/* we have the correct elements for the first multiplication */
	C = A * B;
	/* we do length - 1 more multiplications */
	for ( i = 0; i < length - 1; i++ ) {
		/* shift left */
		MPI_Issend ( &A, 1, MPI_INT, left, tag, MPI_COMM_WORLD, &my_request );
		MPI_Recv ( &newA, 1, MPI_INT, right, tag, MPI_COMM_WORLD, NULL );
		MPI_Wait ( &my_request, NULL );
		A = newA;

		/* shift upwards */
		MPI_Issend ( &B, 1, MPI_INT, above, tag, MPI_COMM_WORLD, &my_request );
		MPI_Recv ( &newB, 1, MPI_INT, below, tag, MPI_COMM_WORLD, NULL );
		MPI_Wait ( &my_request, NULL );
		B = newB;

		/* do the next multimplication and sum */
		C = C + ( A * B );
	}

/* uncomment the next line if we want output */
/* #define PRINT */
#ifdef PRINT
	/* we sleep so our output is ordered */
	sleep ( rank );
	printf ( "Rank: %.2d, C: %.4d\n", rank, C );
#endif

	/* and we're finished */
	MPI_Finalize ();
	return ( 0 );
}
