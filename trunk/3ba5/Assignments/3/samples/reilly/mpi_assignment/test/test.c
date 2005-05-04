#include <mpi.h>
#include <stdio.h>

int main ( int argc, char ** argv ) {
	int i;

	MPI_Init ( &argc, &argv );
	printf ( "argc == %d\n", argc );
	for ( i = 0; i < argc; i++ ) {
		printf ( "%s\n", argv [i] );
	}
	MPI_Finalize ();
	return ( 0 );
}
