import tcdIO.*; 

class DoubleRectangleProgram {
  public static void main (String args[]) {
    Terminal terminal;
    DoubleRectangle shape;
    double area, perimeter;
    double len, wide;                       

    terminal = new Terminal("Double Rectangle Program");

    len = terminal.readDouble("Enter length of rectangle: ");

    wide = terminal.readDouble("Enter width of rectangle: ");

    shape = new DoubleRectangle(len, wide);
  
    area = shape.calculateArea();
    terminal.println("The area of the rectangle is: " + area + ".");

    perimeter = shape.calculatePerimeter();
    terminal.println("The perimeter of the rectangle is: " + perimeter + ".");
 }
}   
