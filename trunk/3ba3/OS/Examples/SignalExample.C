#include <stdlib.h>
#include <std.h>
#include <unistd.h>
#include <iostream>
using std::cout;
using std::endl;
using std::flush;
#include <signal.h>
#include <errno.h>
#include "General.h"
 
#define BUFFER_SIZE 100
 
void handle_signal(int signal_no)
{
   switch (signal_no) {
    case SIGALRM:
      break;
    case SIGINT:
      cout << endl << " Are you sure you want to quit ? ";
      cout << flush;
      char buffer[BUFFER_SIZE];
      alarm(5);
      int no_read;
      // Ensure that the read operation is not affected by another signal.
      while (((no_read = read(STDIN_FILENO, buffer, BUFFER_SIZE)) == -1) &&
             (errno == EINTR)) {
         cout << endl << " Are you sure you want to quit ? ";
         cout << flush;
         alarm(5);
         }
      alarm(0);
      if (no_read == -1) syserr("read");
      if ((buffer[0] == 'y') || (buffer[0] == 'Y'))
         exit(1);
      break;
    default:
      exit(1);
      break;
    }
   if (signal(signal_no, handle_signal) == SIG_ERR)
     syserr("signal");
}


// This program allows the user to calculate factorials....
main()
{
   // Set up signal handling (in case the user wants to exit).
   if ((signal(SIGINT, handle_signal) == SIG_ERR) ||
       (signal(SIGALRM, handle_signal) == SIG_ERR))
      syserr("signal");

   // Wait for 2 seconds before continuing with this program in order
   // to convince the user this is a complicated program that is being
   // loaded.
   alarm(2);
   pause();

   // Test the quit facility (in case of interrupt).
   kill(getpid(), SIGINT);

   // Calculate factorials forever.
   while (true) {
      int no_read;
      char buffer[BUFFER_SIZE];
      int first_time_around = true;
      while ((first_time_around) || ((no_read == -1) && (errno == EINTR))) {
         first_time_around = false;
         cout << endl << " Enter the no. whose factorial you want >  ";
         cout << flush;
         no_read = read(STDIN_FILENO, buffer, BUFFER_SIZE);
         }
      int number = atoi(buffer);
      int factorial = 1;
      for (int count = 2; (count <= number); count++)
         factorial *= count;
      cout << "The factorial of " << number << " is " << factorial << endl;
      if (no_read == -1) syserr("read");
      }
}
