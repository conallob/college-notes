#include <stdio.h>
#include <unistd.h>
#include <iostream>
using std::cout;
using std::endl;
#include <sys/wait.h>
#include <sys/types.h>
#include <signal.h>
#include <errno.h>

void handle_signal(int signal_no)
{
   switch (signal_no) {
    case SIGALRM: // Do nothing
      cout << "Process " << getpid() << ": Parent alarm expired - child took too long." << endl;
      break;
   }
}

main()
{
   cout << "Process " << getpid() << ": Before fork." << endl;
   int new_pid = fork();  // Fork another process.
   cout << "Process " << getpid() << ": Past fork." << endl;
   if (new_pid < 0) // Typically -1 in the case of an error.
   {
      cout << "Process " << getpid() << ": Fork failed." << endl;
      exit(-1);
   }
   else if (new_pid == 0) // We are in the newly created child process.
   {
      cout << "Process " << getpid() << ": Child Process executing ls." << endl;
	sleep(10);  // Delay the child process so that the parent can kill it!
      execlp("/bin/ls","ls","-l",NULL);
      cout << "Process " << getpid() << ": Child Process finished ls." << endl;
   }
   else // We are still in the parent process.
   {
      cout << "Process " << getpid() << ": Parent waiting for child (" << new_pid << ")." << endl;
      if (signal(SIGALRM, handle_signal) != SIG_ERR) // Set up signal handler
      {
         alarm(5);  // Cause a timer to go off in 5 seconds (so if the child hasn't terminated
      }
      int statusp, process;
      do
      {
         process = wait(&statusp);
      } while ((process != -1) && (process != new_pid));
      if ((process == -1) && (errno == EINTR)) // Try killing the child
      {
         cout << "Process " << getpid() << ": Parent trying to kill child (" << new_pid << ")." << endl;
         int success = kill( new_pid, SIGKILL );
         cout << "Process " << getpid() << ": Parent ";
         cout << ((success==0) ? "killed child." : "couldn't send signal.") << endl;
      }
      else cout << "Process " << getpid() << ": Parent finished waiting." << endl;
   }
}
