import tcdIO.*; 

class c10ex2 {
	static Terminal terminal;

	public static void main (String args[]) {
		int[] hmt;					
		String inp;

		//terminal for IO
		terminal = new Terminal("Chapter 10: Exercise 2");

		while(true){
			inp = terminal.readString("What sentence do you want to do a letter count on (or q to quit): ");
			if(inp.equalsIgnoreCase("q"))
				return;
			hmt = countLetters(inp);
			for(int i = 0; i < 25; i++)
				terminal.println((char)('a' + i) + " : " + hmt[i]);
		}

	}   

	//returns an array of integers with slots 0-25 representing the occurences of letters a-z
	static int [] countLetters(String toParse){
		int[] ltrs = new int[26];
		char cc;			//current char
		int i;			
		
		toParse = toParse.toLowerCase();
		
		for(i = 0; i < 26; i++){ltrs[i] = 0;}

		for(i = 0; i < toParse.length(); i++){
			cc = toParse.charAt(i);
			if((cc >= 'a') && (cc <= 'z'))
				ltrs[cc-'a']++;
		}

		return ltrs;
	}

}
