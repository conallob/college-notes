import tcdIO.*; 

class c5ex7 {
	public static void main (String args[]) {
		Terminal terminal;
		int age;
		String answer;
		String rating;

		//terminal for IO
		terminal = new Terminal("Chapter 5: Exercise 6");

		//take input
		age = terminal.readInt("Enter customer's age: ");
		rating = terminal.readString("Enter the movie rating: ");


		//simple if/else clauses to go through the logical system given 
		//in the question
		if (rating.equals("G") || rating.equals("P")){
			terminal.println("Enjoy the movie");
		}else if(rating.equals("R")){
			if(age >= 21)
				terminal.println("Enjoy the movie");
			else {
				answer = terminal.readString("Is the customer accompanied by someone over 21?");
				if(answer.equals("yes"))
					terminal.println("Enjoy the movie");
				else
					terminal.println("Not allowed in!");
			} 
		} else if(rating.equals("X")){
			if(age >= 21)
				terminal.println("Enjoy the movie");
			else 
				terminal.println("Not allowed in!");
		}
	}

}   
