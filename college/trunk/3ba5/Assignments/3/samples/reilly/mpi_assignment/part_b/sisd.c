#include <stdio.h>
#define WIDTH	3

/* include f () and g () */
#include "../part_a/funcs.c"

int main () {
	int A [WIDTH] [WIDTH];
	int B [WIDTH] [WIDTH];
	int C [WIDTH] [WIDTH];
	int i, j, k;
	int sum, product;

	for ( i = 0; i < WIDTH; i++ ) {
		for ( j = 0; j < WIDTH; j++ ) {
			A [i] [j] = f ( i, j, WIDTH );
			B [i] [j] = g ( i, j, WIDTH );
		}
	}

	for ( i = 0; i < WIDTH; i++ ) {
		for ( j = 0; j < WIDTH; j++ ) {
			sum = 0;
			for ( k = 0; k < WIDTH; k++ ) {
				product = A [i] [k] * B [k] [j];
				sum = sum + product;
			}
			C [i] [j] = sum;
		}
	}

	printf ( "Matrix A\n" );
	for ( i = 0; i < WIDTH; i++ ) {
		printf ( "{" );
		for ( j = 0; j < WIDTH; j++ ) {
			printf ( " %.5d,", A [i] [j] );
		}
		printf ( " }\n" );
	}

	printf ( "Matrix B\n" );
	for ( i = 0; i < WIDTH; i++ ) {
		printf ( "{" );
		for ( j = 0; j < WIDTH; j++ ) {
			printf ( " %.5d,", B [i] [j] );
		}
		printf ( " }\n" );
	}

	printf ( "Matrix C\n" );
	for ( i = 0; i < WIDTH; i++ ) {
		printf ( "{" );
		for ( j = 0; j < WIDTH; j++ ) {
			printf ( " %.5d,", C [i] [j] );
		}
		printf ( " }\n" );
	}

	return ( 0 );
}
