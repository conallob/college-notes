import tcdIO.*;

class c1ex8 {
  public static void main (String args[]) {
    Terminal terminal; 
    Square shape;   
    int area;      
    int perimeter;

    shape = new Square(15);
  
    area = shape.calculateArea();

    perimeter = shape.calculatePerimeter();

    terminal = new Terminal("Chapter 1: Exercise 8");
   
    terminal.print("The area of the square is: ");
    terminal.println(Integer.toString(area));

    terminal.print("The perimeter of the square is: ");
    terminal.println(Integer.toString(perimeter));
 }
}
