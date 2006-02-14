/* 
 * File: linklist.c 
 * Description: doubley linked list - inspired by  
 *    g_list.c from c-hey -- http://c-hey.redbrick.dcu.ie
 * Author: Conall O'Brien <conallob@maths.tcd.ie>
 * Date: $Date$
 * 
 * Id: $Id$
 */

#include "linklist.h"

/* Make a Linked List */
linklist *ListNodeMkList() {
	
	linklist * list;
	list = (linklist*) malloc(sizeof(linklist));
	list->size = 0;

	list->head = NULL;
	list->tail = MkNode(NULL, NULL);


	return list;
}

/* Append a node to the end of a LinkedList */
int LinkListAddNode(linklist * list, char* value) {
   item * curr; /* We'll need a new node */ 

	/* dynamically allocate memory */
   curr = (item *)malloc(sizeof(item)); 

	strcpy(curr->val, value);

	list->tail->next = curr;
	curr->prev = list->tail;
	list->tail = curr;

	list->size++;
	return 1;
}


/* Delete a node from a Linked List */
int LinkListRmNode(item * node) {

	if(node->next != node) {
		if(node->prev != node) {
			node->prev->next = node->next; 
			node->next->prev = node->prev; 
		} else {
			node->prev->next = node->prev;
		}
	} else {
		if(node->prev != node) {
			node->prev->next = node->prev;
		}
	}

	node->data = NULL;
	free(node);
	
	/* Link the head node to be the next node */
   curr->next = head;
}


/* Remove every node from a Linked List */
int LinkListRmList(linklist * list) {
	item * node = list->head;

	while ((node != NULL) && (node != node->next)) {
		node = node->next;
		if(LinkListRmNode(node)) {
			node = node->next;
		}
	}
	free(list);
	return 1;
}


/*
 * FIFO actions, Push and Pop
 */

/* Pop the head node off a Linked List */
void *LinkListPop(linklist *list) {
	item * node;
	void * val;

	/* Uh oh! head of the list is NULL, we got nothing! */
	if (list->head == NULL)
		return NULL;

	node = list->head;
	data = node->data;

	if (node->next != list->tail) {
		node->next->prev = node->next;
		list->head = node->next;
	} else {
		list->head = NULL;
		list->tail->prev = list->tail;
	}

	/* Set all values to NULL, then nuke it */
	node->next = NULL;
	node->prev = NULL;
	node->data = NULL;

	return node;
}


/* Push a node onto the end of a Linked List */
int LinkListPush(linklist *list, void *val) {
	char payload[STDIN_BUFFER_LEN];

	strcpy(payload, (char*) val);

	return LinkListAddNode(list, payload);
}
