// $Id: General.h 382 2004-11-27 18:42:37Z conall $

#ifndef GENERAL_H
#define GENERAL_H

// Give the relevant system error message and terminate.
void syserr(char *msg);

#define RESOURCE_TYPES 3
#define NUMBER_PROCESSES 3

typedef struct ProcessData {
    int max_resources[RESOURCE_TYPES];
    char* requests;
} tProcessData;

#endif
