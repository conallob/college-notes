
/*    $Id$  */

#include "functions.h"


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
