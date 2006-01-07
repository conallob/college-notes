import tcdIO.*; 

class c5ex3 {
  public static void main (String args[]) {
    Terminal terminal;
    SimultaneousEquation se;
    double a,b,c,d,e,f; //coefficents as in question
    double x,y;


    terminal = new Terminal("Chapter 5: Exercise 3");

	 //take input
    a = terminal.readDouble("Enter the first x coefficent: ");
    b = terminal.readDouble("Enter the first y coefficent: ");
    c = terminal.readDouble("Enter the first constant: ");
    d = terminal.readDouble("Enter the second x coefficent: ");
    e = terminal.readDouble("Enter the second y coefficent: ");
    f = terminal.readDouble("Enter the second constant: ");

    se = new SimultaneousEquation(a,b,c,d,e,f); //create object to do calculation
  
    if(se.isPossible()){//ensure the calculation is possible
      x = se.retX();
      y = se.retY();
      terminal.println("The intersection coords are: " + x + " " + y); //output answer
    }
    else{
      terminal.println("Sorry, no intersection");
    }

 }
}   
