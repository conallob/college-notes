import tcdIO.*; 

class c3ex3 {
  public static void main (String args[]) {
    Terminal terminal;
    DoubleRectangle shape, shape2, shape3;
    double area, perimeter;
    double len, wide;                       

    terminal = new Terminal("Chapter 3: Exercise 3");

    len = terminal.readDouble("Enter length of rectangle #1: ");
    wide = terminal.readDouble("Enter width of rectangle #1: ");
    shape = new DoubleRectangle(len, wide);

    len = terminal.readDouble("Enter length of rectangle #2: ");
    wide = terminal.readDouble("Enter width of rectangle #2: ");
    shape2 = new DoubleRectangle(len, wide);

    len = terminal.readDouble("Enter length of rectangle #3: ");
    wide = terminal.readDouble("Enter width of rectangle #3: ");
    shape3 = new DoubleRectangle(len, wide);

    area = shape.calculateArea();
    terminal.println("The area of the rectangle #1 is: " + area + ".");
    perimeter = shape.calculatePerimeter();
    terminal.println("The perimeter of the rectangle #1 is: " + perimeter + ".");

    area = shape2.calculateArea();
    terminal.println("The area of the rectangle #2 is: " + area + ".");
    perimeter = shape2.calculatePerimeter();
    terminal.println("The perimeter of the rectangle #2 is: " + perimeter + ".");

    area = shape3.calculateArea();
    terminal.println("The area of the rectangle #3 is: " + area + ".");
    perimeter = shape3.calculatePerimeter();
    terminal.println("The perimeter of the rectangle #3 is: " + perimeter + ".");

 }
}   
