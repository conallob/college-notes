import tcdIO.*;

class Matrix {
  private int[][] mData; // the matrix

  /* initialise matrix of specified dimensions to zero everywhere */
  /* assumes that both dimensions are positive */
  public Matrix(int rows, int cols) {
    mData = new int[rows][cols];
    for (int r = 0; r <= mData.length-1; r++) {
      for (int c = 0; c <= mData[r].length-1; c ++) {
        mData[r][c] = 0;
      }
    }
  }

  /* create matrix initialised from the specified 2-d array of ints */
  /* assumes that all rows of the specified array are the same size */
  public Matrix(int[][] other) {
    mData = new int[other.length][other[0].length];
    for (int r = 0; r <= mData.length-1; r++) {
      for (int c = 0; c <= mData[r].length-1; c ++) {
        mData[r][c] = other[r][c];
      }
    }
  }

  /* create matrix initialised from the specified matrix */
  public Matrix(Matrix other) {
    mData = new int[other.mData.length][other.mData[0].length];
    for (int r = 0; r <= mData.length-1; r++) {
      for (int c = 0; c <= mData[r].length-1; c ++) {
        mData[r][c] = other.mData[r][c];
      }
    }
  }

  /* return matrix data */
  public int[][] getMatrixData() {
    int[][] data;
     
    /* first make a new array to hold the data */
    data = new int[mData.length][mData[0].length];
    /* copy each element of mData to new array */
    for (int r = 0; r <= mData.length-1; r++) {
      for (int c = 0; c <= mData[r].length-1; c ++) {
        data[r][c] = mData[r][c];
      }
    }
    /* return the data */
    return data;
  }

  /* multiply current matrix by specified matrix */
  /* if the number of columns in current matrix equals */ 
  /* number of rows in specified matrix */
  /* Return new matrix if multiplication possible or */
  /* null if multiplication is not possible */
  public Matrix multiplyMatrix(Matrix other) {

    /* first check that the matrices can be multiplied */
    /* by comparing number of colums in current matrix with */
    /* number of rows in other matrix */
    if (mData[0].length == other.mData.length) {
      /* multiplication is possible */
      /* create a new matrix to hold the result */
      Matrix result = new Matrix(mData.length, other.mData[0].length);

      /* for all rows of current matrix */
      for (int r = 0; r <= mData.length-1; r++) {
        /* for all columns of other matrix */
        for (int c = 0; c <= other.mData[0].length-1; c++) {
          /* combine current row of current matrix */
          /* with current column of other matrix */
          int sum = 0;
          for (int e = 0; e <= mData[r].length-1; e++) {
            sum = sum + mData[r][e] * other.mData[e][c];
          }
          /* store the result in the result matrix */
          result.mData[r][c] = sum;
        }
      }
      return result;
    } else {
      /* multiplication is not possible */
      /* return null */
      return null;
    }
  }

  public int largestElement(int wr){
	  int i, max = 0;
	  for(i = 0; i < mData[wr].length; i++)
		  if(mData[wr][max] < mData[wr][i])
			  max = i;

	  return max;
  }

  public boolean saddlePoint(){
	  int i, j, min;

	  for(i = 0; i < mData[0].length; i++){
		  min = 0;
		  for(j = 0; j < mData.length; j++){
			  if(mData[min][i] > mData[j][i])
				  min = j;
			  if(largestElement(min) == i)
				  return true;
		  }
	  }

	  return false;
  }
}

