import tcdIO.*;

class c1ex6 {
  public static void main (String args[]) {
    Terminal terminal; 
    Rectangle shape1; 
    Rectangle shape2;
    int area1;      
    int area2;     
    int perimeter1;
    int perimeter2;

    shape1 = new Rectangle(15, 30);
    shape2 = new Rectangle(45, 40);
  
    area1 = shape1.calculateArea();
    area2 = shape2.calculateArea();

    perimeter1 = shape1.calculatePerimeter();
    perimeter2 = shape2.calculatePerimeter();

    terminal = new Terminal("Chapter 1: Exercise 6");
   
    terminal.print("The area of rectangle #1 is: ");
    terminal.println(Integer.toString(area1));
    terminal.print("The area of rectangle #2 is: ");
    terminal.println(Integer.toString(area2));

    terminal.print("The perimeter of rectangle #1 is: ");
    terminal.println(Integer.toString(perimeter1));
    terminal.print("The perimeter of rectangle #2 is: ");
    terminal.println(Integer.toString(perimeter2));
 }
}
