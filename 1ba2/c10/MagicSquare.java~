
class MagicSquare {
	private int[][] square;


	public MagicSquare(int size){
		square = new int[size][size];
	}

	public MagicSquare(int[][] squaredata){
		int i, j;
		square = new int[squaredata.length][squaredata.length];
		for(i = 0; i < squaredata.length; i++)
			for(j = 0; j < squaredata.length; j++)
				square[i][j] = squaredata[i][j];
	}

	public boolean isMagic(){
		int ntc = 0; //number to check against
		int ntt;
		int i, j;

		//initialise ntc
		for(i = 0; i < square.length; i++)
			ntc += square[0][i];

		//check rows
		for(i = 1; i < square.length; i++)
		{
			ntt = 0;
			for(j = 0; j < square.length; j++)
				ntt += square[i][j];
			if(ntt != ntc)
				return false;
		}

		//check cols
		for(i = 0; i < square.length; i++)
		{
			ntt = 0;
			for(j = 0; j < square.length; j++)
				ntt += square[j][i];
			if(ntt != ntc)
				return false;
		}

		//one diag
		ntt = 0;
		for(i = 0; i < square.length; i++)
			ntt += square[i][i];
		if(ntt != ntc)
			return false;

		//other diag
		ntt = 0;
		for(i = 0; i < square.length; i++)
			ntt += square[i][square.length - (i + 1)];
		if(ntt != ntc)
			return false;

		return true;
	}

}
