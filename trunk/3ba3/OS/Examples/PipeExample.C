#include <std.h>
#include <unistd.h>
#include <stdio.h>
#include "General.h"

main ()
{
  int pfd[2];
  if (pipe(pfd) == -1)   // Create a pipe.
    syserr("pipe");

  int new_pid = fork();  // Fork another process.
  if (new_pid == 0) {
    if ((close(pfd[0]) == -1) || (close(STDOUT_FILENO) == -1) || (dup(pfd[1]) == -1) || (close(pfd[1]) == -1))
      syserr("closing unused file descriptors and duping output");
    execlp("/usr/local/bin/who","who",NULL);
  }
  else {
    if ((close(pfd[1]) == -1) || (close(STDIN_FILENO) == -1) || (dup(pfd[0]) == -1) || (close(pfd[0]) == -1))
      syserr("closing unused file descriptors and duping input");
    execlp("/bin/sort","sort",NULL);
  }
}
