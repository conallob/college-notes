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
linklist *LinkListMkList() {
	
	linklist * list;
	if ( !(list = (linklist*) malloc(sizeof(linklist))) ) {
			  return NULL;
	}
	list->size = 0;

	list->head = NULL;
	if ( !(list->tail = (item*) malloc(sizeof(item))) ) {
			  return NULL;
	}

	list->tail->next = list->tail;
	list->tail->prev = list->tail;

	return list;
}

/* Append a node to the end of a LinkedList */
int LinkListAddNode(linklist *list, void *value) {
   item * curr; /* We'll need a new node */ 

	/* dynamically allocate memory */
   if ( !(curr = (item *) malloc(sizeof(item))) ) { 
			  return 0;
	}

	curr->prev = NULL;
	curr->next = NULL;
	curr->val = value;
		
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


/* Delete a node from a Linked List */
int LinkListRmNode(linklist *list, item *node) {

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

	node->val = NULL;
	free(node);
	
	list->size--;

	return 1;
}


/* Remove every node from a Linked List */
int LinkListRmList(linklist *list) {
	item * node = list->head;

	while ((node != NULL) && (node != node->next)) {
		node = node->next;
		if(LinkListRmNode(list, node)) {
			node = node->next;
		} else {
			return 0;
		}
	}

	free(list);
	return 1;
}


/*
 * LIFO actions, Push and Pop
 */

/* Pop the head node off a Linked List */
item *LinkListPop(linklist *list) {
	item * node;
	void * data;

	/* Uh oh! head of the list is NULL, we got nothing! */
	if (list->head == NULL)
		return NULL;

	node = list->head;
	data = node->val;

	if (node->next != list->tail) {
		node->next->prev = node->next;
		list->head = node->next;
	} else {
		list->head = NULL;
		list->tail->prev = list->tail;
	}

	list->size--;

	return node;
}


/* Push a node onto the end of a Linked List */
int LinkListPush(linklist *list, void *val) {
	return LinkListAddNode(list, val);
}

