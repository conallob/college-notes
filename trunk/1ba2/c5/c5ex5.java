import tcdIO.*; 

class c5ex5 {
  public static void main (String args[]) {
    Terminal terminal;
    Date d;
	 int id,im,iy;

	 //create IO terminal
    terminal = new Terminal("Chapter 5: Exercise 5");

	 //take input
    iy = terminal.readInt("Enter the year ");

	 //create object for calculation
	 d = new Date(0,0,iy);
  
	 //do calculation
    if(d.isLeapYear()){
      terminal.println("The year is a leap year");
    }
    else{
      terminal.println("The year is not a leap year");
    }

 }
}   
