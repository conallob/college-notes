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

/* Make a Linked List */
void ListNodeMkList() {
	
	linklist * list;
	list = (linklist*) malloc(sizeof(linklist));
	list->size = 0;

typedef struct linklist item;

}

void init() {
	item * head; /* We'll need a primary node */
	head = NULL; /* Let's make it null */

	/* dynamically allocate memory */
   curr = (item *)malloc(sizeof(item)); 

	strcpy(curr->val, value);

	list->tail->next = curr;
	curr->prev = list->tail
	list->tail = curr;

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

	return 0;
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
