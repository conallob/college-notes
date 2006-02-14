/* Program 1.2: a program to calculate the area */
/* and perimeter of a rectangle */

import tcdIO.*;

class RectangleProgram {
  public static void main (String args[]) {
    Terminal terminal; // used to store object representing the terminal
    Rectangle shape;   // used to store object representing the rectangle
    int area;          // used to store area of rectangle
    int perimeter;     // used to store perimeter of rectangle

    /* create an object representing a 15 by 30 rectangle */
    shape = new Rectangle(15, 30);
  
    /* ask the rectangle object for its area */ 
    area = shape.calculateArea();

    /* ask the rectangle object for its perimeter */
    perimeter = shape.calculatePerimeter();

    /* create an object representing the terminal */
    terminal = new Terminal("Progam 1.2");
   
    /* print the area of the rectangle on the screen */
    terminal.print("The area of the rectangle is: ");
    terminal.println(Integer.toString(area));

    /* print the perimeter of the rectangle on the screen */
    terminal.print("The perimeter of the rectangle is: ");
    terminal.println(Integer.toString(perimeter));
 }
}
