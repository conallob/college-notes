import tcdIO.*; 

class c5ex10 {
	public static void main (String args[]) {
		Terminal terminal;
		double tmp1,tmp2,tmp3;
		String answer;
		Square sq;
		Circle c;
		Rectangle r;
		Triangle t;

		//terminal for IO
		terminal = new Terminal("Chapter 5: Exercise 10");


		//take input
		answer = terminal.readString("Please enter the shape (square,circle,rectangle,triangle): ");

		//create different objects depending on input,do calculation and output
		//answer
		if(answer.equals("square")){
			tmp1 = terminal.readDouble("Enter the length of a side: ");
			sq = new Square(tmp1);
			terminal.println("The area of the square is " +sq.area());
			terminal.println("The perimeter of the square is " +sq.perimeter());
		}
		else if(answer.equals("circle")){
			tmp1 = terminal.readDouble("Enter the length of the radius: ");
			c = new Circle(tmp1,0,0);
			terminal.println("The area of the circle is " +c.area());
			terminal.println("The circumference of the circle is " +c.circumference());
		}
		else if(answer.equals("rectangle")){
			tmp1 = terminal.readDouble("Enter the width: ");
			tmp2 = terminal.readDouble("Enter the height: ");
			r = new Rectangle(tmp1,tmp2);
			terminal.println("The area of the rectangle is " +r.area());
			terminal.println("The perimeter of the rectangle is " +r.perimeter());
		}
		else if(answer.equals("triangle")){
			tmp1 = terminal.readDouble("Enter the length of side #1: ");
			tmp2 = terminal.readDouble("Enter the length of side #2: ");
			tmp3 = terminal.readDouble("Enter the length of side #3: ");
			t = new Triangle(tmp1,tmp2,tmp3);
			terminal.println("The area of the triangle is " +t.area());
			terminal.println("The perimeter of the triangle is " +t.perimeter());
		}

	}
}   
