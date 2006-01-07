import tcdIO.*; 

class c10ex1 {
	static Light[] lightArray = new Light[20];
	static Terminal terminal;

	public static void main (String args[]) {
		int wl, ws;					//what option
		String inp;

		//terminal for IO
		terminal = new Terminal("Chapter 10: Exercise 1");

		//explain interface
		terminal.println("When the lights are displayed on the screen");
		terminal.println("0 represents off");
		terminal.println("1 represents dimmed");
		terminal.println("2 represents on");
		terminal.print("\n");

		for(int i = 0; i < 20; i++)
			lightArray[i] = new Light();

		//main loop
		while(true){
			printLights();
			wl = -1;
			//take input
			while((wl < 0) || (wl > 20)) 
				wl = terminal.readInt("What Light from 1-20 do you want to change the state of (or 0 to exit): "); 
			if(wl == 0)
				return;

			ws = -1;
			while((ws < 0) || (ws > 2)){
				ws = terminal.readInt("What state do you want to set light " +wl+ " to (0,1,2): "); 
			}

			lightArray[wl-1].setState(ws);
		}
	}   

	static void printLights(){
		int i;
		
		for(i = 0; i < 20; i++)
			terminal.print(lightArray[i].getState() + " "); 

		terminal.print("\n");
	}
}
