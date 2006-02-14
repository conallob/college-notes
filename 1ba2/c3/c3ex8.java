import tcdIO.*; 

class c3ex8 {
	public static void main (String args[]) {
		Terminal terminal;
		Complex c1, c2, c3;
		double tmp1, tmp2;

		terminal = new Terminal("Chapter 3: Exercise 8");

		//Input the values of the first complex number
		tmp1 = terminal.readInt("Input the real part of the first variable(c1): ");
		tmp2 = terminal.readInt("Input the imaginary part of the first variable(c1): ");

		//Create an object representing the first complex number
		c1 = new Complex(tmp1, tmp2);

		tmp1 = terminal.readInt("Input the real part of the second variable(c2): ");
		tmp2 = terminal.readInt("Input the imaginary part of the second variable(c2): ");
		c2 = new Complex(tmp1, tmp2);

		//Create an object to hold c1+c2
		c3 = new Complex(c1.getReal(), c1.getImag());
		c3.addComplex(c2);
		//Output c1+c2
		terminal.println("c1 + c2 = "+c3.getReal()+" + "+c3.getImag()+"i");

		//Create an object to hold c1-c2
		c3 = new Complex(c1.getReal(), c1.getImag());
		c3.subComplex(c2);
		//Output c1-c2
		terminal.println("c1 - c2 = "+c3.getReal()+" + "+c3.getImag()+"i");

		//Create an object to hold c1*c2
		c3 = new Complex(c1.getReal(), c1.getImag());
		c3.multComplex(c2);
		//Output c1*c2
		terminal.println("c1 * c2 = "+c3.getReal()+" + "+c3.getImag()+"i");

		//Create an object to hold c1/c2
		c3 = new Complex(c1.getReal(), c1.getImag());
		c3.divComplex(c2);
		//Output c1/c2
		terminal.println("c1 / c2 = "+c3.getReal()+" + "+c3.getImag()+"i");

 }
}   
