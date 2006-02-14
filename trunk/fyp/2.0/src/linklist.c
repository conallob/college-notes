/* 
 * File: linklist.c 
 * Description: doubley linked list - inspired by  
 *    g_list.c from c-hey -- http://c-hey.redbrick.dcu.ie
 * Author: Conall O'Brien <conallob@maths.tcd.ie>
 * Date: $Date$
 * 
 * Id: $Id$
 */

struct linklist {
   char * val;
   struct linklist * prev;
   struct linklist * next;
};


typedef struct linklist item;


void init() {
	item * head; /* We'll need a primary node */
	head = NULL; /* Let's make it null */

/* Append a node to the end of a LinkedList */
int LinkListAddNode(linklist *list, void *value) {
   item * curr; /* We'll need a new node */ 

	/* dynamically allocate memory */
   if ( !(curr = (item *) malloc(sizeof(item))) ) { 
			  return 0;
	}

	strcpy(curr->val, value);
		
	if(list->head == NULL) {
		list->head = curr;
		curr->next = list->tail;
		list->tail->prev = curr;
		curr->prev = curr;
	} else {
		list->tail->prev->next = curr;
		curr->next = list->tail;
		curr->prev = list->tail->prev;
		list->tail->prev = curr;
	}
	
	list->size++;
	return 1;
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
