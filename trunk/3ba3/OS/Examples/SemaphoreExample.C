#include <std.h>
#include <iostream>
using std::cout;
using std::endl;
#include <sys/shm.h>
#include <sys/sem.h>
#include <sys/wait.h>
#include "General.h"

main ()
{
  int semaphore_id;
  if ((semaphore_id = semget((key_t) IPC_PRIVATE, 1, 0666 | IPC_CREAT)) == -1)
    syserr("semaphore creation");
   // Set the initial value (1) of the new semaphore.
  cout << "Semaphore " << semaphore_id << " has value " << semctl(semaphore_id,0,GETVAL) << endl;
  union semun {
    int val;
    struct semid_ds *buf;
    u_short *array;
    } arg;
  arg.val = 1;  // Initial value
  if (semctl(semaphore_id,0,SETVAL,arg) == -1)
    syserr("semaphore set initial value");
  cout << "Semaphore " << semaphore_id << " has value " << semctl(semaphore_id,0,GETVAL) << endl;
  struct sembuf sb;
  sb.sem_num = 0;   // Semaphore number.
  sb.sem_op = 1;   // Operation.
  sb.sem_flg = 0;   // Options.
  if (semop(semaphore_id, &sb, 1) == -1)
    syserr("signal");
  cout << "Semaphore " << semaphore_id << " has value " << semctl(semaphore_id,0,GETVAL) << endl;
  sb.sem_op = -1;   // Operation.
  if (semop(semaphore_id, &sb, 1) == -1)
    syserr("wait");
  cout << "Semaphore " << semaphore_id << " has value " << semctl(semaphore_id,0,GETVAL) << endl;
  semctl(semaphore_id,0,IPC_RMID);
}
