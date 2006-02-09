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
   char * val;
   struct listnode * prev;
   struct listnode * next;
};


struct linklist {
	listnode * head;
	listnode * tail
	int size;
};

typedef listnode item; 

void ListNodeMkList(linklist * list);

void MkNode(linklist * list, char* value);
