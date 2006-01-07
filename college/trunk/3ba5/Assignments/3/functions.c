
/*		$Id$	*/

#include "functions.h"

int f(int i, int j, int n) {

	return ((i * j) + n); 
		  
}


int g(int i, int j, int n) {

	return (i + (j * n)); 
		  
}


void sisd_method(int **a, int **b, int **s, int dim) {

		  int i, j, k, z;
		  
		  for (k = 0; k < dim; k++) {
					 for (j = 0; j < dim; j++) {
								z = 0;
								for (i = 0; i < dim; i++) {
										  z += (a[k][i]) * (b[i][j]);
								}
							s[j][i] = z;
					 }
		  }
}
