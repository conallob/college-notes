#include <stdio.h>
#include <unistd.h>
#include <iostream>
using std::cout;
using std::endl;
#include <sys/wait.h>
#include <pthread.h>
#include <thread.h>
#include <errno.h>

#define NUM_THREADS 3
int wait_for_time=2;

void *sleep_test(void *parameters)
{
   int sleep_time = wait_for_time;
   wait_for_time *= 2;  // Just to show threads accessing the same variables.
   cout << "Thread " << thr_self() << ": Going to sleep for " << sleep_time << " seconds." << endl;
   sleep(sleep_time);
   cout << "Thread " << thr_self() << ": Waking up (after sleep of " << sleep_time << " seconds)." << endl;
   pthread_exit(0);
}

main(int argc, char *argv[])
{
   pthread_t tid[NUM_THREADS];
   for (int thread_no=0; (thread_no<NUM_THREADS); thread_no++)
   {
      int success = pthread_create(&tid[thread_no],NULL,sleep_test,NULL);
      cout << "Thread " << tid[thread_no] << " created." << endl;
   }
   for (int thread_no=0; (thread_no<NUM_THREADS); thread_no++)
   {
      pthread_join(tid[thread_no],NULL);
      cout << "Thread " << tid[thread_no] << " finished." << endl;
   }
}

