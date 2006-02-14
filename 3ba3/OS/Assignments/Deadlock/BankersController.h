// $Id$

#ifndef BANKERSCONTROLLER_H
#define BANKERSCONTROLLER_H
#include "General.h"

class CBankersController
{
public:
    CBankersController( CMessageQueue* message_queue, int total_resources[RESOURCE_TYPES], tProcessData process_data[NUMBER_PROCESSES] );
    ~CBankersController();
    bool AllocationIsPossible( int process_id, int request[RESOURCE_TYPES] );  // Implement the Bankers algorithm.
    void AllocateResources( int process_id, int request[RESOURCE_TYPES] );
    void FreeResources( int process_id, int request[RESOURCE_TYPES] );
    void Run();
};

#endif
