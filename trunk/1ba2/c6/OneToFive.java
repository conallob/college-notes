/* Program 6.1: a program to illustrate */
/* the use of the while statement */

import tcdIO.*;

class OneToFive {
  public static void main (String args[]) {
    Terminal terminal;
    int currentNumber = 1; // start at 1

    /* create an object to represent the terminal */
    terminal = new Terminal("Program 6.1");

    terminal.println("The list is:");
    while (currentNumber <= 5) {
       /* print out the value of currentNumber */
       terminal.writeInt(currentNumber);
       /* increment currentNumber */
       currentNumber = currentNumber + 1;
    }
    
    /* print a message to say that the program is finished */
    terminal.println("Finished!"); 
  }
}
