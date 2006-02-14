import tcdIO.*;

class c1ex9 {
  public static void main (String args[]) {
    Terminal terminal; 
    Square shape;   
    Rectangle shape2;
    int area;       
    int perimeter; 

    shape = new Square(15);
  
    area = shape.calculateArea();

    perimeter = shape.calculatePerimeter();

    terminal = new Terminal("Chapter 1: Exercise 9");
   
    terminal.print("The area of the square is: ");
    terminal.println(Integer.toString(area));

    terminal.print("The perimeter of the square is: ");
    terminal.println(Integer.toString(perimeter));

    shape2 = new Rectangle(15, 30);
  
    area = shape2.calculateArea();

    perimeter = shape2.calculatePerimeter();

    terminal.print("The area of the rectangle is: ");
    terminal.println(Integer.toString(area));

    terminal.print("The perimeter of the rectangle is: ");
    terminal.println(Integer.toString(perimeter));
 }
}
