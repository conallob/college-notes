/* 
 * File: linklist.h 
 * Description: doubley linked list - inspired by  
 *		g_list.c from c-hey -- http://c-hey.redbrick.dcu.ie
 * Author: Conall O'Brien <conallob@maths.tcd.ie>
 * $Date: 2006-02-28T03:02:30.294885Z $
 * 
 * $Id$
 */

#define STDIN_BUFFER_LEN 80

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct listnode {
   void *val;
   struct listnode *prev;
   struct listnode *next;
} item;


typedef struct llist {
	item *head;
	item *tail;
	int size;
} linklist;


linklist* LinkListMkList();

int LinkListAddNode(linklist *list, void *value);

int LinkListRmNode(linklist *list, item *node);

int LinkListRmList(linklist *list);

item* LinkListPop(linklist *list);

int LinkListPush(linklist *list, void *val);

char* LinkListMerge(linklist *list);
