import tcdIO.*; 

class c10ex6 {
	static Terminal terminal;

	public static void main (String args[]) {
		int n, m, left, i, cp;
		int[] ring;

		//terminal for IO
		terminal = new Terminal("Chapter 10: Exercise 6");

		m = terminal.readInt("How many elements in the ring: ");
		n = terminal.readInt("What is the value of n");
		left = m;
		ring = new int[m];

		for(i = 0; i < m; i++)
			ring[i] = 1;
		cp = 0;

		while(true){
			ring[cp] = 0;
			left--;
			i = 0;
			terminal.print(Integer.toString(cp+1) + " ");
			if(left == 0)
				break;
			while(true){
				if(ring[cp] == 1){
					i++;
					if(i == n)
						break;
				}
				cp++;
				cp %= m;
			}
		}
	}   

}
