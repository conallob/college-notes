import tcdIO.*;

class c1ex7 {
  public static void main (String args[]) {
    Terminal terminal;
    Rectangle shape; 
    int area;       
    int perimeter; 

    terminal = new Terminal("Chapter 1: Exercise 7");


    shape = new Rectangle(10, 20);
    area = shape.calculateArea();
    perimeter = shape.calculatePerimeter();
    terminal.print("The area of the rectangle #1 is: ");
    terminal.println(Integer.toString(area));
    terminal.print("The perimeter of the rectangle #1 is: ");
    terminal.println(Integer.toString(perimeter));

    shape = new Rectangle(20, 30);
    area = shape.calculateArea();
    perimeter = shape.calculatePerimeter();
    terminal.print("The area of the rectangle #2 is: ");
    terminal.println(Integer.toString(area));
    terminal.print("The perimeter of the rectangle #2 is: ");
    terminal.println(Integer.toString(perimeter));

    shape = new Rectangle(30, 40);
    area = shape.calculateArea();
    perimeter = shape.calculatePerimeter();
    terminal.print("The area of the rectangle #3 is: ");
    terminal.println(Integer.toString(area));
    terminal.print("The perimeter of the rectangle #3 is: ");
    terminal.println(Integer.toString(perimeter));

    shape = new Rectangle(40, 50);
    area = shape.calculateArea();
    perimeter = shape.calculatePerimeter();
    terminal.print("The area of the rectangle #4 is: ");
    terminal.println(Integer.toString(area));
    terminal.print("The perimeter of the rectangle #4 is: ");
    terminal.println(Integer.toString(perimeter));

    shape = new Rectangle(50, 60);
    area = shape.calculateArea();
    perimeter = shape.calculatePerimeter();
    terminal.print("The area of the rectangle #5 is: ");
    terminal.println(Integer.toString(area));
    terminal.print("The perimeter of the rectangle #5 is: ");
    terminal.println(Integer.toString(perimeter));

    shape = new Rectangle(60, 70);
    area = shape.calculateArea();
    perimeter = shape.calculatePerimeter();
    terminal.print("The area of the rectangle #6 is: ");
    terminal.println(Integer.toString(area));
    terminal.print("The perimeter of the rectangle #6 is: ");
    terminal.println(Integer.toString(perimeter));

    shape = new Rectangle(70, 80);
    area = shape.calculateArea();
    perimeter = shape.calculatePerimeter();
    terminal.print("The area of the rectangle #7 is: ");
    terminal.println(Integer.toString(area));
    terminal.print("The perimeter of the rectangle #7 is: ");
    terminal.println(Integer.toString(perimeter));

    shape = new Rectangle(80, 90);
    area = shape.calculateArea();
    perimeter = shape.calculatePerimeter();
    terminal.print("The area of the rectangle #8 is: ");
    terminal.println(Integer.toString(area));
    terminal.print("The perimeter of the rectangle #8 is: ");
    terminal.println(Integer.toString(perimeter));

    shape = new Rectangle(90, 100);
    area = shape.calculateArea();
    perimeter = shape.calculatePerimeter();
    terminal.print("The area of the rectangle #9 is: ");
    terminal.println(Integer.toString(area));
    terminal.print("The perimeter of the rectangle #9 is: ");
    terminal.println(Integer.toString(perimeter));

    shape = new Rectangle(100, 110);
    area = shape.calculateArea();
    perimeter = shape.calculatePerimeter();
    terminal.print("The area of the rectangle #10 is: ");
    terminal.println(Integer.toString(area));
    terminal.print("The perimeter of the rectangle #10 is: ");
    terminal.println(Integer.toString(perimeter));

 }
}
