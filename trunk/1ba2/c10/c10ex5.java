import tcdIO.*; 

class c10ex5 {
	static Terminal terminal;

	public static void main (String args[]) {
		int t;
		int sms[];
		String inp;

		//terminal for IO
		terminal = new Terminal("Chapter 10: Exercise 5");

		t = terminal.readInt("How many students: ");
		sms = new int[t];
		for(int i = 0; i < t; i++)
			sms[i] = terminal.readInt("Student #" +(i+1)+ " mark:");
		markHist(sms);
	}   

	static void markHist(int[] marks){
		double inc;
		int[] spg = new int[10]; // students per grade
		int i, j, max;

		for(i = 0; i < 10; i++)
			spg[i] = 0;

		for(i = 0; i < marks.length; i++)
			spg[(marks[i]-1)]++;

		j = 0;
		for(i = 0; i < 10; i++)
			if(spg[i] > j)
				j = spg[i];

		max = j;
		inc = (double)j/10.0;

		for(i = 10; i >= 1; i--){
			terminal.print( Integer.toString((int)(inc*(double)i)) );
			for(j = 0; j < 4 - Integer.toString((int)(inc*(double)i)).length(); j++)
				terminal.print(" ");
			terminal.print("|");
			for(j = 0; j < 10; j++){
				if(spg[j] >= (int)(inc*(double)i))
					terminal.print(" X ");
				else
					terminal.print("   ");
			}
			terminal.print("\n");
		}
		terminal.print("0   |");
		for(i = 1; i < 10; i++)
			terminal.print(" " +i+ " ");
		terminal.print(" 10");
	}


}
