import tcdIO.*;

class c1ex11 {
  public static void main (String args[]) {
    Terminal terminal; 
    Cube shape;   
    Cube shape2; 
    int area;   
    int volume;

    shape = new Cube(15);
  
    area = shape.calculateArea();

    volume = shape.calculateVolume();

    terminal = new Terminal("Chapter 1: Exercise 11");
   
    terminal.print("The area of one side of Cube1 is: ");
    terminal.println(Integer.toString(area));

    terminal.print("The volume of Cube1 is: ");
    terminal.println(Integer.toString(volume));

    shape2 = new Cube(40);
  
    area = shape2.calculateArea();

    volume = shape2.calculateVolume();

    terminal.print("The area of one side of Cube2 is: ");
    terminal.println(Integer.toString(area));

    terminal.print("The volume of Cube2 is: ");
    terminal.println(Integer.toString(volume));


 }
}
