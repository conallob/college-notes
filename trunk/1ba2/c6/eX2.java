/* Program 6.10: a program to calculate eX (revised) */

import tcdIO.*;

class eX {
  public static void main (String args[]) {
    Terminal terminal;
    double eX, x, Tn;
    int n;

    /* create an object to represent the terminal */
    terminal = new Terminal("Program 6.10");

    /* read x */
    x = terminal.readDouble("Enter x: ");

    /* calculate eX */
    n = 0; Tn = 1; eX = Tn;  // T0
    while (Math.abs(Tn) >= 0.0001) {
      /* generate another term */
      n = n + 1;
      Tn = (x/n) * Tn;
      /* add to eX */
      eX = eX + Tn;
    }
    /* print out result */
    terminal.println("Result is: " + eX + ".");
  }
}
