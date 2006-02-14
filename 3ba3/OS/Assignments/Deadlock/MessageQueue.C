// $Id$

#include <sys/msg.h>
#include <errno.h>
#include "MessageQueue.h"
#include "General.h"

CMessageQueue::CMessageQueue()
{
    // Create private message Q.
    if ((mID = msgget(IPC_PRIVATE, IPC_CREAT | 0666))== -1)
        syserr("Message Queue Creation failed");
}

CMessageQueue::~CMessageQueue()
{
    struct msqid_ds buffer;
    if (msgctl(mID,IPC_RMID,&buffer) == -1)
        syserr("Message Queue Deletion failed");
}

void CMessageQueue::Send(tMessageFormat* message, int message_size)
{
    if ((msgsnd(mID,message,message_size,0)) == -1)
       syserr("Message send failed");
}

// Return true if message received and false if interrupted.
bool CMessageQueue::Receive(long message_type, tMessageFormat* message, int& message_size)
{
    message_size = msgrcv(mID,message,sizeof(tMessageFormat),message_type,0);
    if (message_size == -1)
    {
        if (errno == EINTR)
            return false;
        else syserr("Message receipt failed");
    }
    else
    {
        return true;
    }
}
