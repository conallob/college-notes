
import tcdIO.*;

class c1ex4 {
  public static void main (String args[]) {
    Terminal terminal;
    Rectangle shape; 
    int area;       
    int perimeter; 

    shape = new Rectangle(15, 30);
  
    area = shape.calculateArea();

    perimeter = shape.calculatePerimeter();

    terminal = new Terminal("Chapter 1: Exercise 4");
   
    terminal.print("Simple program to print out the area and perimeter of a");
    terminal.println(" rectangle object.");
    terminal.print("The area of the rectangle is: ");
    terminal.println(Integer.toString(area));

    terminal.print("The perimeter of the rectangle is: ");
    terminal.println(Integer.toString(perimeter));
 }
}
