/* 
 * File: linklist.c 
 * Description: char array doubley linked list 
 * Author: Conall O'Brien <conallob@maths.tcd.ie>
 * Date: $Date$
 * 
 * Id: $Id$
 */

#include <stdlib.h>
#include <stdio.h>

struct linklist {
   char * val;
   struct linklist * prev;
   struct linklist * next;
};


typedef struct linklist item;


void init() {
	item * head; /* We'll need a primary node */
	head = NULL; /* Let's make it null */

   head = curr; /* Set head to the current list-pointer */
   curr = head; /* Set current list-pointer to head node */
}


void addNode(char* value) {
   item * curr; 

	/* dynamically allocate memory */
   curr = (item *)malloc(sizeof(item)); 

	/* Set value of new node to value */
   curr->val = *value;

	/* Link the new node to the last node in the list */
   curr->prev->next = curr;
	
	/* Link the head node to be the next node */
   curr->next = head;
}
