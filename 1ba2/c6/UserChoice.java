/* Program 6.2: a program to illustrate */
/* the use of the while statement (revised) */

import tcdIO.*;

class UserChoice {
  public static void main (String args[]) {
    Terminal terminal;
    int currentNumber = 1; // start at 1
    int usersChoice;

    /* create an object to represent the terminal */
    terminal = new Terminal("Program 6.2");

    /* get the user's number */
    usersChoice = terminal.readInt("Enter the highest number to print: ");

    /* now print out the list */
    terminal.println("The list is:");
    while (currentNumber <= usersChoice) {
      /* print out the value of currentNumber */
      terminal.writeInt(currentNumber);
      /* increment currentNumber */
      currentNumber = currentNumber + 1;
    }

    /* print a message to say that the program is finished */
    terminal.println("Finished!"); 
  }
}
