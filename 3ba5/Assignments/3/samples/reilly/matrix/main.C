#include "matrix.h"
#include <iostream.h>

int main(){
	int size = 5;
	Matrix A(0, size), B(1, size);
	
	cout << "A:\n";
	A.Display();
	
	cout << "B:\n";
	B.Display();

	A.Mult(A, B);
	B.Mult2(A, B);
	return 0;
}
/*
#include <unistd.h>
#include <stdlib.h>
#include <math.h>
#include <mpi.h>
//#include <stdio.h>
  */              
/*include f () and g () */
//#include "../part_a/funcs.c"
/*
int main ( int argc, char **argv ) {
	// needed for computing where to send to, and how long to shift and multiply for
	int size, length, rank, n = 5;
	
	// positions in the matrix
	int row, column;
	
	// where to send to
	int left, right, below, above;
	
	int tag, temp, t2;
	int i, j;
	
	MPI_Request my_request;
	
	// initialise whatever needs to be initialised
	MPI_Init ( &argc, &argv );
	
	// find out the rank
	MPI_Comm_rank ( MPI_COMM_WORLD, &rank );
	
	// find out the size of the group
	MPI_Comm_size ( MPI_COMM_WORLD, &size );
	
	// do the math to figure out where i am
	// length is the length of the sides 
	length = ( int ) sqrt ( ( double ) size );
	
	column = rank % length;
	row = rank / length;
	
	// find out where my neighbours are
	left = ( rank + length - 1 ) % length;
	left = left + ( length * row );
	
	right = ( rank + 1 ) % length;
	right = right + ( length * row );
	
	above = ( size + rank - length ) % size;
	below = ( rank + length ) % size;
	
	// intitialising the two nxn matrices
	Matrix A(0, n), B(1, n);
	
	// temporary matrices, filled with zeroes 
	Matrix newA(2, n), newB(2, n);
	
	// the matrix which holds the end result
	Matrix C(2, n);

	tag = 0;
	
	// send the initial A values to their correct places
	for ( i = 0; i < row; i++ ) {
		temp = A.mat[i][n - 1];
		MPI_Issend( &A.mat[i][0], 1, MPI_INT, left, tag, MPI_COMM_WORLD, &my_request);
		MPI_Recv ( &newA.mat[i][n - 1], 1, MPI_INT, right, tag, MPI_COMM_WORLD, NULL );
		MPI_Wait ( &my_request, NULL );
		A.mat[i][n - 1] = newA.mat[i][n - 1];
		for(j = 0 ; j < column - 1; j++){
			// send to the left
			MPI_Issend ( &A.mat[i][j], 1, MPI_INT, left, tag, MPI_COMM_WORLD, &my_request );
			// receive from the right
			MPI_Recv ( &newA.mat[i][j], 1, MPI_INT, right, tag, MPI_COMM_WORLD, NULL );
			// make sure that the send completed properly
			MPI_Wait ( &my_request, NULL );
			A.mat[i][j] = newA.mat[i][j];
		}
		A.mat[i][n - 2] = temp;
	}
	
	tag = 0;
	// send the initial B values to their correct places
	for ( i = 0; i < column; i++ ) {
		temp = B.mat[n - 1][i];
		MPI_Issend( &B.mat[0][i], 1, MPI_INT, above, tag, MPI_COMM_WORLD, &my_request);
		MPI_Recv ( &newB.mat[n - 1][i], 1, MPI_INT, below, tag, MPI_COMM_WORLD, NULL );
		MPI_Wait ( &my_request, NULL );
		B.mat[n - 1][i] = newB.mat[n - 1][i];
		for(j = 0 ; j < row - 1; j++){
			MPI_Issend ( &B.mat[j][i], 1, MPI_INT, above, tag, MPI_COMM_WORLD, &my_request );
			MPI_Recv ( &newB[j][i], 1, MPI_INT, below, tag, MPI_COMM_WORLD, NULL );
			MPI_Wait ( &my_request, NULL );
			B.mat[j][i] = newB.mat[j][i];
		}
		B.map[n - 2][i] = temp;
	}
		
	tag = 0;
	// we have the correct elements for the first multiplication
	for(i = 0; i < n; i++){
		for(j = 0; j < n; j++){
			C.mat[i][j] = A.mat[i][j] * B.mat[i][j];
		}
	}
	
	// we do length - 1 more multiplications
	for ( i = 0; i < length - 1; i++ ) {
		temp = A.mat[i][n - 1];
		MPI_Issend( &A.mat[i][0], 1, MPI_INT, left, tag, MPI_COMM_WORLD, &my_request);
		MPI_Recv ( &newA.mat[i][n - 1], 1, MPI_INT, right, tag, MPI_COMM_WORLD, NULL );
		MPI_Wait ( &my_request, NULL );
		A.mat[i][n - 1] = newA.mat[i][n - 1];		
		t2 = B.mat[n - 1][i];
		MPI_Issend( &B.mat[0][i], 1, MPI_INT, above, tag, MPI_COMM_WORLD, &my_request);
		MPI_Recv ( &newB.mat[n - 1][i], 1, MPI_INT, below, tag, MPI_COMM_WORLD, NULL );
		MPI_Wait ( &my_request, NULL );
		B.mat[n - 1][i] = newB.mat[n - 1][i];
		for(j = 0; j < length - 1; j++){
			// shift left
			MPI_Issend ( &A.mat[i][j], 1, MPI_INT, left, tag, MPI_COMM_WORLD, &my_request );
			MPI_Recv ( &newA.mat[i][j], 1, MPI_INT, right, tag, MPI_COMM_WORLD, NULL );
			MPI_Wait ( &my_request, NULL );
			A.mat[i][j] = newA.mat[i][j];

			// shift upwards 
			MPI_Issend ( &B.mat[i][j], 1, MPI_INT, above, tag, MPI_COMM_WORLD, &my_request );
			MPI_Recv ( &newB.mat[i][j], 1, MPI_INT, below, tag, MPI_COMM_WORLD, NULL );
			MPI_Wait ( &my_request, NULL );
			B.mat[i][j] = newB.mat[i][j];
		
			// do the next multiplication and sum it
			C.mat[i][j] = A.mat[i][j] * B.mat[i][j];
		}
		A.mat[i][n - 2] = temp;
		B.map[n - 2][i] = t2;
	}
	*/
	/* uncomment the next line if we want output */
	/* #define PRINT */
//#ifdef PRINT
	/* we sleep so our output is ordered */
//	sleep ( rank );
//	printf ( "Rank: %.2d, C: %.4d\n", rank, C );
//#endif
	
	/* and we're finished */
//	MPI_Finalize ();
//	return ( 0 );
//}
