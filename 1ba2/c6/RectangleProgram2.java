/* Program 6.11: a program to illustrate the use of the do statement */

import tcdIO.*;

class RectangleProgram {
  public static void main (String args[]) {
    Terminal terminal;
    Rectangle shape;
    int length, width;
    int area, perimeter;

    /* create an object to represent the terminal */
    terminal = new Terminal("Program 6.11");

    do {
      /* ask user for width and length */
      length = terminal.readInt("Please enter length of rectangle: ");
      width = terminal.readInt("Please enter width of rectangle: ");
      /* now check that length and width are valid */
    } while ((length <= 0) || (width <= 0));
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
