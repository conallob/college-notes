import tcdIO.*; 

class c10ex9 {
	static Terminal terminal;

	public static void main (String args[]) {
		int size, i, j;
		int[][] square;
		MagicSquare mSquare;

		//terminal for IO
		terminal = new Terminal("Chapter 10: Exercise 9");

		size = terminal.readInt("What size magic square: ");
		square = new int[size][size];

		terminal.println("Input the magic square:");
		for(i = 0; i < size; i++)
			for(j = 0; j < size; j++)
				square[i][j] = terminal.readInt();

		mSquare = new MagicSquare(square);
		if(mSquare.isMagic())
			terminal.println("It is a magic square");
		else
			terminal.println("It isnt a magic square");

	}
		
}
