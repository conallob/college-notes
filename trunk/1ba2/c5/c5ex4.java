import tcdIO.*; 

class c5ex4 {
  public static void main (String args[]) {
    Terminal terminal;
    Circle c1,c2;
    double r1,x1,y1,r2,x2,y2; //the radii, x and y coordinates of the circles


	 //create IO terminal
    terminal = new Terminal("Chapter 5: Exercise 4");

	 //take input
    r1 = terminal.readDouble("Enter the first circle's radius: ");
    x1 = terminal.readDouble("Enter the x coordinate of the first circle's centre: ");
    y1 = terminal.readDouble("Enter the y coordinate of the first circle's centre: ");
    r2 = terminal.readDouble("Enter the second circle's radius: ");
    x2 = terminal.readDouble("Enter the x coordinate of the second circle's centre: ");
    y2 = terminal.readDouble("Enter the y coordinate of the second circle's centre: ");

	 //create objects
	 c1 = new Circle(r1,x1,y1);
	 c2 = new Circle(r2,x2,y2);
  
	 //compare
    if(c1.overlaps(c2)){
      terminal.println("The two circles overlap");
    }
    else{
      terminal.println("The two circles do not overlap");
    }

 }
}   
