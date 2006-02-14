class Poly {
  private int[][] poly; //polynomial data, poly[n][0] corresponds to the nth term's coefficent, poly[n][1] corresponds to the nth term's power
  							 

  //takes in a two dimensional array in the same format as poly[][]
  public Poly(int[][] ivs) {
	  int i,j;
	  poly = new int[ivs.length][2];

	  for(i = 0; i < ivs.length; i++){
		  poly[i][0] = ivs[i][0];
		  poly[i][1] = ivs[i][1];
	  }
	  remRed();
  }


  public int[][] getData() {
	  int[][] rArray = new int[poly.length][2];
	  int i,j;

	  for(i = 0; i < poly.length; i++){
		  rArray[i][0] = poly[i][0];
		  rArray[i][1] = poly[i][1];
	  }

	  return rArray;
  }
  
  public void add(Poly other) {
	  int [][] na = new int[poly.length + other.poly.length][2];
	  int i;

	  for(i = 0; i < poly.length; i++){
		  na[i][0] = poly[i][0];
		  na[i][1] = poly[i][1];
	  }

	  for(; i < na.length; i++){
		  na[i][0] = other.poly[i-poly.length][0];
		  na[i][1] = other.poly[i-poly.length][1];
	  }
	  remRed();
  }

  public void mult(Poly other) {
	  int [][] na = new int[poly.length * other.poly.length][2];
	  int i, j;

	  for(i = 0; i < poly.length; i++){
		  for(j = 0; j < other.poly.length; j++){
			  na[(i*other.poly.length) + j][0] = poly[i][0] * other.poly[j][0];
			  na[(i*other.poly.length) + j][1] = poly[i][1] + other.poly[j][1];
		  }
	  }

	  remRed();
  }


  //remove redundant terms, i.e. add all terms of the same power
  //O(n squared) efficency .... bloody horrible 
  private void remRed(){
	  int i, j;
	  for(i = 0; i < (poly.length-1); i++){
		  for(j = i+1; j < poly.length; j++)
			  if(poly[i][1] == poly[j][1]){
				  poly[i][0] += poly[j][0];
				  poly[j][0] = 0;
			  }
	  }

	  j = 0;
	  for(i = 0; i < poly.length; i++)
		  if(poly[i][0] != 0)
			  j++;

	  int[][] nArray = new int[j][2];

	  j = 0;
	  for(i = 0; i < nArray.length; i++,j++){
		  while(poly[j][0] == 0)
			  j++;
		  nArray[i][0] = poly[j][0];
		  nArray[i][1] = poly[j][1];
	  }
	  poly = nArray;
  }

}	  for(; i < na.length; i++){
		  na[i][0] = other.poly[i-poly.length][0];
		  na[i][1] = other.poly[i-poly.length][1];
	  }

