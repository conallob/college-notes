/* Program 6.3: a program to calculate n! */

import tcdIO.*;
                    
class Factorial {
  public static void main (String args[]) {
    Terminal terminal;
    int n;
    int factorialN = 1; // running total; initialise to 1
   
    /* create an object to represent the terminal */
    terminal = new Terminal("Program 6.3");

    /* get value of n from user */
    n = terminal.readInt("Enter n: ");
    /* check that value is acceptable */
    if (n > 1) {
      /* calculate n! */
      while (n > 1) {
        terminal.println("Current value of n is " + n + ".");
        /* multiply factorial by current n */
        factorialN = factorialN * n;
        /* get next lower n */
        n = n - 1;
      }
      /* print out the result */
      terminal.println("n! is: " + factorialN + ".");
    } else {
      /* illegal value for n */
      terminal.println("Unable to calculate factorial of " + n + ".");
    }
  }
}
