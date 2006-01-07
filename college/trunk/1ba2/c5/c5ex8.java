import tcdIO.*; 

class c5ex8 {
	public static void main (String args[]) {
		Terminal terminal;
		int sex, height, shiftPattern, age;
		boolean smokes;
		String answer, postalDistrict;
		Client c1, c2;

		//terminal for IO
		terminal = new Terminal("Chapter 5: Exercise 8");


		terminal.println("Please enter the data for the first client");

		//take input
		answer = terminal.readString("Is the client male or female: ");
		if(answer.equals("male"))
			sex = 1;
		else
			sex = 0;

		height = terminal.readInt("How tall is the client (in cm): ");

		answer = terminal.readString("Is the client employed: ");
		if(answer.equals("yes")){
			answer = terminal.readString("Does the client work nights or days: ");
			if(answer.equals("nights"))
				shiftPattern = 0;
			else
				shiftPattern = 1;
		} else 
			shiftPattern = -1;

		answer = terminal.readString("Does the client smoke :");
		if(answer.equals("yes"))
			smokes = true;
		else
			smokes = false;

		age = terminal.readInt("How old is the client: ");

		postalDistrict = terminal.readString("What postal district does the client live in: ");
		//create object from input
		c1 = new Client(sex, height, shiftPattern, smokes, postalDistrict, age);
		
		//take more input
		terminal.println("Please enter the data for the second client");

		answer = terminal.readString("Is the client male or female: ");
		if(answer.equals("male"))
			sex = 1;
		else
			sex = 0;

		height = terminal.readInt("How tall is the client (in cm): ");

		answer = terminal.readString("Is the client employed: ");
		if(answer.equals("yes")){
			answer = terminal.readString("Does the client work nights or days: ");
			if(answer.equals("nights"))
				shiftPattern = 0;
			else
				shiftPattern = 1;
		} else 
			shiftPattern = -1;

		answer = terminal.readString("Does the client smoke :");
		if(answer.equals("yes"))
			smokes = true;
		else
			smokes = false;

		age = terminal.readInt("How old is the client: ");

		postalDistrict = terminal.readString("What postal district does the client live in: ");
		//create another object from input
		c2 = new Client(sex, height, shiftPattern, smokes, postalDistrict, age);

		//compare them
		if(c1.isCompatible(c2))
			terminal.println("The clients are compatible.");
		else
			terminal.println("The clients are not compatible.");
	}
}   
