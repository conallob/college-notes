/* Program 6.5: a program to find the largest number in */
/* a list of positive integers entered by the user */

import tcdIO.*;

class Largest {
  public static void main (String args[]) {
    Terminal terminal;
    int number;
    int maxSoFar = 0; // initially smaller than any number

    /* create an object to represent the terminal */
    terminal = new Terminal("Program 6.5");

    /* read the first number */
    number = terminal.readInt("Enter number: ");
    /* now process list of numbers */
    while (number >= 0) {
      /* check if number is largest so far */
      if (number > maxSoFar) {
        /* if so, remember it */
        maxSoFar = number;
      }
      /* read the next number */
      number = terminal.readInt("Enter number: ");
    }
    /* print out the largest number */
    terminal.println("The largest number was: " + maxSoFar + ".");
  }
}
