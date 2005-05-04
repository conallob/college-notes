#include <mpi.h>
#include <stdio.h>
#include <unistd.h>
#include <math.h>
#include <stdlib.h>

#include "../part_a/funcs.c"
void SISD ( int ** A, int ** B, int ** C, int l );
void shift_left ( int l, int left, int right );
void shift_up ( int l, int above, int below );
void my_malloc ( int l );
void my_free ( int l );

/* the submatrices, declared here so malloc()ing can be moved to a function */
int ** A, ** B, **C;

int main ( int argc, char ** argv ) {
	/* n x n is the matrix size, m x m is the number of processors */
	int n, m, l;
	/* size == m * m, rank == our position within the PE 1d array */
	int size, rank;
	/* our row + column within the PE 2d array */
	int row, column;
	/* where to send to */
	int left, right, above, below;

	/* temporary variables */
	int matrix_row, matrix_column;
	int i, j;

	if ( argc != 2 ) {
		printf ( "Usage: mpirun run_part_d <m> sun5 <n>\nWhere m is the number of processes to run, \nand n x n is the size of the matrix.\n" );
		exit ( 1 );
	}

	/* ok, we've got a command line arg */
	n = atoi ( argv [1] );

	/* initialise, and see how many processors there are */
	MPI_Init ( &argc, &argv );
	MPI_Comm_rank ( MPI_COMM_WORLD, &rank );
	MPI_Comm_size ( MPI_COMM_WORLD, &size );

	m = ( int ) sqrt ( (double ) size );

	/* sanity checks. */
	/* m * m == size should hold */
	if ( m * m != size ) {
		printf ( "ERROR: The number of processing elements you specified is not a perfect square.\n" );
		chp_exit ( 1 );
	}

	/* m should be less than n */
	if ( m >= n ) {
		printf ( "ERROR: The number of processing elements must be less than the size of the matrix.\n" );
		chp_exit ( 1 );
	}

	/* m should divide n evenly */
	if ( n % m != 0 ) {
		printf ( "ERROR: The number of processing elements does not evenly divide the size of the matrix.\n" );
		chp_exit ( 1 );
	}

	/* sanity checks passed */
	l = n / m;

	/* malloc memory for the subarrays */
	my_malloc ( l );

	/* figure out the row and column in the PE 2d array */
	row = rank / m;
	column = rank % m;

	/* fill in the matrices */
	/* these are where are in th matrix */
	matrix_row = row * l;
	matrix_column = column * l;
	for ( i = 0; i < l; i++ ) {
		for ( j = 0; j < l; j++ ) {
			A [i] [j] = f ( matrix_row + i, matrix_column + j, n );
			B [i] [j] = g ( matrix_row + i, matrix_column + j, n );
			C [i] [j] = 0;
		}
	}

	/* time to figure out where our neighbours are */
	left = ( rank + m - 1 ) % m;
	left = left + ( m * row );

	right = ( rank + 1 ) % m;
	right = right + ( m * row );

	above = ( size + rank - m ) % size;
	below = ( rank + m ) % size;

	/* okey dokey, we've got out initial values. time to skew them */
	/* work through the A values */
	for ( i = 0; i < row; i++ ) {
		shift_left ( l, left, right );
	}

	/* now work through the B values */
	for ( i = 0; i < column; i++ ) {
	}

	/* okey dokey. the values have been skewed, so do the first SISD style multiplicateion */
	SISD ( A, B, C, l );
	for ( i = 0; i < m - 1; i++ ) {
		/* update the A values */
		shift_left ( l, left, right );
		/* update the B values */
		shift_up ( l, above, below );
		/* do our SISD multiplication again */
		SISD ( A, B, C, l );
	}

	/* and we've finished */
	my_free ( l );
	MPI_Finalize ();
	exit ( 0 );
}

void shift_left ( int l, int left, int right ) {
	int j, k;
	MPI_Request my_request;
	int received;

	for ( j = 0; j < l; j++ ) {
		for ( k = 0; k < l; k++ ) {
			MPI_Issend ( &A [j] [k], 1, MPI_INT, left, 0, MPI_COMM_WORLD, &my_request );
			MPI_Recv ( &received, 1, MPI_INT, right, 0, MPI_COMM_WORLD, NULL );
			MPI_Wait ( &my_request, NULL );
			A [j] [k] = received;
		}
	}
}

void shift_up ( int l, int above, int below ) {
	int j, k;
	MPI_Request my_request;
	int received;

	for ( j = 0; j < l; j++ ) {
		for ( k = 0; k < l; k++ ) {
			MPI_Issend ( &B [j] [k], 1, MPI_INT, above, 0, MPI_COMM_WORLD, &my_request );
			MPI_Recv ( &received, 1, MPI_INT, below, 0, MPI_COMM_WORLD, NULL );
			MPI_Wait ( &my_request, NULL );
			B [j] [k] = received;
		}
	}
}

void SISD ( int ** A, int ** B, int ** C , int l ) {
	/* A, B, C are our l x l submatrices. */
	int i, j, k;
	int result;

	for ( i = 0; i < l; i++ ) {
		for ( j = 0; j < l; j++ ) {
			result = 0;
			for ( k = 0; k < l; k++ ) {
				result = result + A [i] [k] * B [k] [j];
			}
			C [i] [j] = C [i] [j] + result;
		}
	}
}

void my_malloc ( int l ) {
	/* malloc () memory for my sub matrices */
	int i;

	A = ( int ** ) malloc ( sizeof ( int * ) * l );
	if ( A == NULL ) {
		printf ( "ERROR. Malloc () failed.\n" );
		chp_exit ( 1 );
	}
	B = ( int ** ) malloc ( sizeof ( int * ) * l );
	if ( B == NULL ) {
		printf ( "ERROR. Malloc () failed.\n" );
		chp_exit ( 1 );
	}
	C = ( int ** ) malloc ( sizeof ( int * ) * l );
	if ( C == NULL ) {
		printf ( "ERROR. Malloc () failed.\n" );
		chp_exit ( 1 );
	}

	for ( i = 0; i < l; i++ ) {
		A [i] = ( int * ) malloc ( sizeof ( int ) * l );
		if ( A [i] == NULL ) {
			printf ( "ERROR. Malloc () failed.\n" );
			chp_exit ( 1 );
		}
		B [i] = ( int * ) malloc ( sizeof ( int ) * l );
		if ( B [i] == NULL ) {
			printf ( "ERROR. Malloc () failed.\n" );
			chp_exit ( 1 );
		}
		C [i] = ( int * ) malloc ( sizeof ( int ) * l );
		if ( C [i] == NULL ) {
			printf ( "ERROR. Malloc () failed.\n" );
			chp_exit ( 1 );
		}
	}

	/* end of malloc()ing */
}

void my_free ( int l ) {
	int i;

	for ( i = 0; i< l; i++ ) {
		free ( A [i] );
		free ( B [i] );
		free ( C [i] );
	}
	free ( A );
	free ( B );
	free ( C );
}
