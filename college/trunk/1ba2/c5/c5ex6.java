import tcdIO.*; 

class c5ex6 {
	final static int AGELIMIT = 25; //no kiddies allowed
	final static String GOODANSWER = "yes";

	public static void main (String args[]) {
		Terminal terminal;
		int age;
		String answer;

	
		//terminal for IO
		terminal = new Terminal("Chapter 5: Exercise 6");

		age = terminal.readInt("Enter customer's age: ");

		//input,boolean expression and string comparison in one ....
		if (age >= AGELIMIT && ((terminal.readString("Is customer neatly dressed? ")).equals(GOODANSWER) || (terminal.readString("Will customer put on a tie? ")).equals(GOODANSWER) ) ){
			terminal.println("Allowed in!");
		} else {
			terminal.println("Not allowed in!");
		}
	}

}   
