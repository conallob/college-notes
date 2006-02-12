/* 
 * File: linklist.h 
 * Description: char array doubley linked list 
 * Author: Conall O'Brien <conallob@maths.tcd.ie>
 * Date: $Date$
 * 
 * Id: $Id$
 */

#include <stdlib.h>
#include <stdio.h>

struct listnode {
   void * val;
   struct listnode *prev;
   struct listnode *next;
};


struct linklist {
	listnode * head;
	listnode * tail;
	int size;
};

typedef listnode item; 

linklist *ListNodeMkList(linklist * list);

int LinkListRmNode(linklist * list, void* value);

int LinkListRmList(linklist * list);

void *LinkListPop(linklist * list);

void *LinkListPop(linklist * list, void* val);
