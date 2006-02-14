// $Id$

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <errno.h>
#include <time.h>


//#include "BankersController.h"
#include "MessageQueue.h"
//#include "Resource.h"

struct Resource {
        
		  // {a,b,c}[0] is the max value
		  //      
		  // {a,b,c}[1-4] are the realtime values
		  
		  int a[5], b[5], c[5];
		  
		  // realtime paramaters for sleep() 
		  
		  int sleeps[4];
				
} master, resources1, resources2, resources3;



int do_stuff(Resource *resource);

void sleep(int secs);

int main() {

		  // init phase

		  unsigned long int iret1, iret2, iret3;
		  pthread_t thread1, thread2, thread3;
		  
		  // Master Resources
		  
		  master.a = {3, 3, 3, 3, 3};
		  master.b = {3, 3, 3, 3, 3};
		  master.c = {3, 3, 3, 3, 3};

		  master.sleeps = {0, 0, 0, 0};
		  
		  // Resources for Thread1:
		  
		  resources1.a = {2, 1, 1, 0, -2};
		  resources1.b = {3, 1, 1, 1, -3};
		  resources1.c = {1, 0, 1, 0, -1};

		  // sleeps for Thread1:

		  resources1.sleeps = {3, 3, 9, 5};

		  // Resources for Thread2:
		  
		  resources2.a = {1, 0, 1, 0, -1};
		  resources2.b = {2, 0, 1, 1, -2};
		  resources2.c = {3, 3, 0, 0, -3};

		  // sleeps for Thread2:

		  resources2.sleeps = {5, 6, 8, 1};

		  // Resources for Thread3:
		  
		  // assuming type in assignment should read 
		  // -AAABBB not -ABBCCC, since max C = 0...
		  
		  resources3.a = {3, 3, 0, -3, 0};
		  resources3.b = {3, 0, 3, -3, 0};
		  resources3.c = {0, 0, 0,  0, 0};

		  // sleeps for Thread3:

		  resources3.sleeps = {7, 5, 8, 0};

		  /* Create independant threads each of which will execute function */

		  iret1 = pthread_create( &thread1, NULL, (void*) do_stuff, (void*) resources1);
		  iret2 = pthread_create( &thread2, NULL, (void*) do_stuff, (void*) resources2);
		  iret3 = pthread_create( &thread3, NULL, (void*) do_stuff, (void*) resources3);

		  // Wait till threads are complete before main continues.

		  pthread_join( thread1, NULL);
		  pthread_join( thread2, NULL); 
		  pthread_join( thread3, NULL); 
		
		  exit(0);
}

int do_stuff(Resource *resource) {

		  	for (int i = 1; i <= 4; i++) {
					  
					  // Resource A

					  if (resource->a[i] > 0 && resource->a[i] <= resource->a[0]) {

								 // allocate resource

								 printf("Allocate A\n");
						
					  } else if (resource->a[i] < 0 && (resource->a[i] * -1) <= resource->a[0]) {

								  // deallocate resource

								 printf("Deallocate A\n");

					  } else if (resource->a[i] >= resource->a[0] || (resource->a[i] * -1) >= resource->a[0]) {

								 // error, trying to (de)allocate resources that aren't required or allowed

								 printf("Error A\n");
						
					  } else if (resource->a[i] != 0) {
					
								 // I don't want any resources right now

								 printf("Don't Need A\n");
								 
					  }

					  // Resource B

					  if (resource->b[i] > 0 && resource->b[i] <= resource->b[0]) {

								 // allocate resource

								 printf("Allocate B\n");
						
					  } else if (resource->b[i] < 0 && (resource->b[i] * -1) <= resource->b[0]) {

								  // deallocate resource

								 printf("Deallocate B\n");

					  } else if (resource->b[i] >= resource->b[0] || (resource->b[i] * -1) >= resource->b[0]) {

								 // error, trying to (de)allocate resources that aren't required or allowed

								 printf("Error B\n");
						
					  } else if (resource->b[i] != 0) {
					
								 // I don't want any resources right now

								 printf("Don't Need B\n");
								 
					  }

					  // Resource C

					  if (resource->c[i] > 0 && resource->c[i] <= resource->c[0]) {

								 // allocate resource

								 printf("Allocate C\n");
						
					  } else if (resource->c[i] < 0 && (resource->c[i] * -1) <= resource->c[0]) {

								  // deallocate resource

								 printf("Deallocate C\n");

					  } else if (resource->c[i] >= resource->c[0] || (resource->c[i] * -1) >= resource->c[0]) {

								 // error, trying to (de)allocate resources that aren't required or allowed

								 printf("Error C\n");
						
					  } else if (resource->c[i] != 0) {
					
								 // I don't want any resources right now

								 printf("Don't Need C\n");
								 
					  }

					  sleep((int) resource->sleeps);

			}

			return 0;

}


		 
void sleep(int secs) {

		  // A basic function to simulate the sleep() functionality I need

		  clock_t endwait;
		  endwait = clock () + secs;
		  while (clock() < endwait) {}
		  
}
