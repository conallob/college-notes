/* Program 6.7: a program to generate the Fibonacci Sequence (revised) */
/* Stops when a specified number of terms have been generated */

import tcdIO.*;

class Fibonacci {
  public static void main (String args[]) {
    Terminal terminal;
    int Tn, Tn1, Tn2;     // Tn, Tn-1, Tn-2
    int termsToDo, count; // count number of terms done

    /* create an object to represent the terminal */
    terminal = new Terminal("Program 6.7");

    termsToDo = terminal.readInt("Enter number of terms required: ");
    /* make sure that the user wants more than 2 terms */
    while (termsToDo < 2) {
       terminal.println("At least two terms must be generated.");
       termsToDo = terminal.readInt("Enter number of terms required: ");
    }

    /* generate the first two terms */
    Tn2 = 1; terminal.writeInt(Tn2); // T0
    Tn1 = 1; terminal.writeInt(Tn1); // T1
    count = 2;  // two terms done

    /* generate as many more terms as needed */
    while (count < termsToDo) {
      Tn = Tn2 + Tn1;        // generate new term
      terminal.writeInt(Tn); // print out new term
      Tn2 = Tn1;             // update Tn-2
      Tn1 = Tn;              // and Tn-1
      count = count + 1;
    }

    /* print a message to say that the program is finished */
    terminal.println("Finished!"); 
  }
}
