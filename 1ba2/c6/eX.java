/* Program 6.9: a program to calculate eX */

import tcdIO.*;

class eX {
  public static void main (String args[]) {
    Terminal terminal;
    double eX, x, Tn;
    int n, termsToDo;

    /* create an object to represent the terminal */
    terminal = new Terminal("Program 6.9");

    /* read x and number of terms to generate */
    x = terminal.readDouble("Enter x: ");
    termsToDo = terminal.readInt("Enter number of terms to generate: ");
    while (termsToDo < 1) {
      terminal.println("At least one term must be generated.");
      termsToDo = terminal.readInt("Enter number of terms to generate: ");
    }

    /* calculate eX */
    n = 0; Tn = 1; eX = Tn;  // T0
    while (n < termsToDo-1) {
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
