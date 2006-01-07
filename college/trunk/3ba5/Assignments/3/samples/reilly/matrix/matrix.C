#include "matrix.h"
#include <iostream.h>
#include <unistd.h>
#include <stdlib.h>
#include <math.h>
#include <mpi.h>

// Part A

Matrix::Matrix(int type, int size){
	int i, j;

	n = size; // size of matrices
	
	// implements functions so that the values in the matrix
	// are filled according to its parameters.
	switch(type){
		// f(i,j,n)
		case 0:
			mat = new int*[n];
			for(i = 0; i < n; i++){
				mat[i] = new int[n];
				for(j = 0; j < n; j++){
					mat[i][j] = i * j + n;
				}
			}
			break;
		// g(i,j,n)
		case 1:
			mat = new int*[n];
			for(i = 0; i < n; i++){
				mat[i] = new int[n];
				for(j = 0; j < n; j++){
					mat[i][j] = (i + j) * n;
				}
			}
			break;
		// fills matrix with 0
		case 2:
			 mat = new int*[n];
			 for(i = 0; i < n; i++){
				 mat[i] = new int[n];
				 for(j = 0; j < n; j++){
					 mat[i][j] = 0;
				 }
			 }
			 break;
	}
}

// Displays the matrix
void Matrix::Display(){
	int i, j;

	for(i = 0; i < n; i++){
		for(j = 0; j < n; j++){
			cout << mat[i][j] << '\t';
		}
		cout << "\n\n";
	}
}

// Part B

Matrix Matrix::Mult(Matrix A,Matrix B){
	int i,j,k,count;

	Matrix C(2, n); // create a blank matrix
	
	for(i = 0; i < n; i++){
		for(j = 0; j<n;j++){
			for(k = 0,count = 0; k < n; k++){
				count += A.mat[i][k] * B.mat[k][j];
			}
		C.mat[i][j] = count;
		}
	}
	
	cout << "C1:\n";
	C.Display();

	return C;
}

// Part C

Matrix Matrix::Mult2(Matrix A, Matrix B, int argc, char **argv){
        // needed for computing where to send to, and how long to shift and multiply for
        int size, length, rank;

        // positions in the matrix
        int row, column;

        // where to send to
        int left, right, below, above;

        int tag, temp, t2;
        int i, j, k;

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

	// temporary matrices, filled with zeroes 
        Matrix newA(2, n), newB(2, n);

	// the matrix which holds the end result
        Matrix C(2, n);

        tag = 0;

	SetA(newA, left, tag);
	tag = 0;
	SetB(newB, right, tag);
	tag = 0;

	// we have the correct elements for the first multiplication
        for(i = 0; i < n; i++){
                for(j = 0; j < n; j++){
                        C.mat[i][j] = A.mat[i][j] * B.mat[i][j];
                }
        }

	 for(k = 0; k < n - 1; k++){
                SetA(newA, left, tag);
                SetB(newB, right, tag);
                for(i = 0; i < n; i++){
                        for(j = 0; j < n; j++){
                                C.mat[i][j] = C.mat[i][j] + A.mat[i][j] * B.mat[i][j];
                        }
                }
                cout << "In the middle:\n";
                C.Display();
        }
}

void Matrix::SetA(Matrix newA, int left, int tag){
	int i, j, temp;

	for(i = 0; i < n; i++ ) {
		temp = A.mat[i][n - 1];
                MPI_Issend( &A.mat[i][0], 1, MPI_INT, left, tag, MPI_COMM_WORLD, &my_request);
                MPI_Recv ( &newA.mat[i][n - 1], 1, MPI_INT, right, tag, MPI_COMM_WORLD, NULL );
                MPI_Wait ( &my_request, NULL ); 
                A.mat[i][n - 1] = newA.mat[i][n - 1];
                for(j = 0 ; j < n - 1; j++){ 
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
}

void Matrix::SetB(Matrix newB, int right, int tag){
        int i, j, temp;
        
	for(i = 0; i < n; i++ ) {
                temp = B.mat[n - 1][i];
                MPI_Issend( &B.mat[0][i], 1, MPI_INT, above, tag, MPI_COMM_WORLD, &my_request);
                MPI_Recv ( &newB.mat[n - 1][i], 1, MPI_INT, below, tag, MPI_COMM_WORLD, NULL );
                MPI_Wait ( &my_request, NULL );
                B.mat[n - 1][i] = newB.mat[n - 1][i];
                for(j = 0 ; j < n - 1; j++){
                        MPI_Issend ( &B.mat[j][i], 1, MPI_INT, above, tag, MPI_COMM_WORLD, &my_request );
                        MPI_Recv ( &newB[j][i], 1, MPI_INT, below, tag, MPI_COMM_WORLD, NULL );
                        MPI_Wait ( &my_request, NULL );
                        B.mat[j][i] = newB.mat[j][i];
                }
                B.map[n - 2][i] = temp;
        }
}
		
/*
Matrix Matrix::Mult2(Matrix A, Matrix B){
	int k, i, j;

	Matrix C(2, n);

	for(k = 1; k < n; k++){
		SetA(A, k);
		SetB(B, k);
	}

	for(i = 0; i < n; i++){
		for(j = 0; j < n; j++){
			C.mat[i][j] = A.mat[i][j] * B.mat[i][j];
		}
	}
	
	cout << "C in between:\n";
	C.Display();

	for(k = 1; k < n; k++){
		SetA(A, -1);
		SetB(B, -1);
		for(i = 0; i < n; i++){
			for(j = 0; j < n; j++){
				C.mat[i][j] = C.mat[i][j] + A.mat[i][j] * B.mat[i][j];
			}
		}
		cout << "In the middle:\n";
		C.Display();
	}
	
	cout << "C2:\n";
	C.Display();

	return C;
}

void Matrix::SetA(Matrix A, int k){
	int i, j, temp;

	for(i = k + 1; i < n; i++){
		temp = A.mat[i][n - 1];
		A.mat[i][n - 1] = A.mat[i][0];
		for(j = 0; j < n - 1; j++){
			A.mat[i][j] = A.mat[i][j + 1];
		}
		A.mat[i][n - 2] = temp;
	}
	cout << "K: " << k << endl;
	cout << "A Rotated:\n";
	A.Display();
}

void Matrix::SetB(Matrix B, int k){
	int i, j, temp;

	for(j = k + 1; j < n; j++){
		temp = B.mat[n - 1][j];
		B.mat[n - 1][j] = B.mat[0][j];
		for(i = 0; i < n - 1; i++){
			B.mat[i][j] = B.mat[i + 1][j];
		}
		B.mat[n - 2][j] = temp;
	}
	cout << "K: " << k << endl;
	cout << "B Rotated:\n";
	B.Display();
}
*/
