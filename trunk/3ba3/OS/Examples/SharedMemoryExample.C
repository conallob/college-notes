#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <sys/shm.h>
#include <sys/wait.h>
#include "General.h"

main ()
{
    int SharedMemoryID;
    char* SharedMemoryAddress;
    if ((SharedMemoryID = shmget((key_t) IPC_PRIVATE, sizeof(char), 0666 | IPC_CREAT)) == -1)
        syserr("shmget");
    if ((SharedMemoryAddress = (char *) shmat(SharedMemoryID, 0, 0)) == (void *)(-1))
        syserr("shmat");
    *SharedMemoryAddress = 'a';
    if (shmctl(SharedMemoryID,IPC_RMID,NULL) == -1)
        syserr("shmctl");
}
