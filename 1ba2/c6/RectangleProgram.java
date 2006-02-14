/* Program 6.4: a program to calculate the area */
/* and perimeter of a rectangle */

import tcdIO.*;

class RectangleProgram {
  public static void main (String args[]) {
    Terminal terminal;
    Rectangle shape;
    int length, width;
    int area, perimeter;

    /* create an object to represent the terminal */
    terminal = new Terminal("Program 6.4");

    /* ask user for width and length */
    length = terminal.readInt("Enter length of rectangle: ");
    width = terminal.readInt("Enter width of rectangle: ");

    /* check that width and length are valid */
    while ((length <= 0) || (width <= 0)) {
      /* width or length is invalid - try again */
      terminal.println("The dimensions entered are invalid.");
      length = terminal.readInt("Please enter positive length: ");
      width = terminal.readInt("Please enter positive width: ");
    }
    /* now we have valid dimensions */

    /* create a new Rectangle with given dimensions */
    shape = new Rectangle(length, width);
  
    /* ask the rectangle object for its area */ 
    area = shape.calculateArea();
    /* write out the area to the screen */
    terminal.println("Area is: " + area + ".");

    /* ask the rectangle obejct for its perimeter */
    perimeter = shape.calculatePerimeter();
    /* write out the perimeter to the screen */
    terminal.println("Perimeter is: " + perimeter + ".");

    /* print a message to say that the program is finished */
    terminal.println("Finished!"); 
 }
}
