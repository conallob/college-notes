import tcdIO.*;

class c1ex12 {
  public static void main (String args[]) {
    Terminal terminal; 
    Cuboid shape;   
    Cuboid shape2; 
    Cuboid shape3;

    shape = new Cuboid(15, 20, 25);
    shape2 = new Cuboid(20, 25, 30);
    shape3 = new Cuboid(25, 30, 35);
  
    terminal = new Terminal("Chapter 1: Exercise 12");
   
    terminal.print("The area of 2 sides of Cube1 is: ");
    terminal.println(Integer.toString(shape.calculateArea1()));

    terminal.print("The area of another 2 sides of Cube1 is: ");
    terminal.println(Integer.toString(shape.calculateArea2()));

    terminal.print("The area of the last 2 sides of Cube1 is: ");
    terminal.println(Integer.toString(shape.calculateArea3()));

    terminal.print("The volume of Cube1 is: ");
    terminal.println(Integer.toString(shape.calculateVolume()));

    terminal.print("The perimeter of Cube1 is: ");
    terminal.println(Integer.toString(shape.calculatePerimeter()));

    terminal.print("The area of 2 sides of Cube2 is: ");
    terminal.println(Integer.toString(shape2.calculateArea1()));

    terminal.print("The area of another 2 sides of Cube2 is: ");
    terminal.println(Integer.toString(shape2.calculateArea2()));

    terminal.print("The area of the last 2 sides of Cube2 is: ");
    terminal.println(Integer.toString(shape2.calculateArea3()));

    terminal.print("The volume of Cube2 is: ");
    terminal.println(Integer.toString(shape2.calculateVolume()));

    terminal.print("The perimeter of Cube2 is: ");
    terminal.println(Integer.toString(shape2.calculatePerimeter()));

    terminal.print("The area of 2 sides of Cube3 is: ");
    terminal.println(Integer.toString(shape3.calculateArea1()));

    terminal.print("The area of another 2 sides of Cube3 is: ");
    terminal.println(Integer.toString(shape3.calculateArea2()));

    terminal.print("The area of the last 2 sides of Cube3 is: ");
    terminal.println(Integer.toString(shape3.calculateArea3()));

    terminal.print("The volume of Cube3 is: ");
    terminal.println(Integer.toString(shape3.calculateVolume()));

    terminal.print("The perimeter of Cube3 is: ");
    terminal.println(Integer.toString(shape3.calculatePerimeter()));
 }
}
