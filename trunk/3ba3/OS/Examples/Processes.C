#include <stdio.h>
#include <unistd.h>
#include <iostream>
using std::cout;
using std::endl;
#include <sys/wait.h>

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
      execlp("/bin/ls","ls","-l",NULL);
      cout << "Process " << getpid() << ": Child Process finished ls." << endl;
   }
   else // We are still in the parent process.
   {
      cout << "Process " << getpid() << ": Parent waiting for child (" << new_pid << ")." << endl;
      int statusp, process;
      do
      {
         process = wait(&statusp);
         if (process != -1)
         {
            cout << "Process " << getpid() << ": Child process " << process << " has terminated." << endl;
         }
      } while ((process != -1) && (process != new_pid));
      cout << "Process " << getpid() << ": Parent finished waiting." << endl;
   }
}
