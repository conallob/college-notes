#include <std.h>
#include <unistd.h>
#include <stdio.h>
#include <iostream>
using std::cout;
using std::endl;
#include <sys/msg.h>
#include <sys/wait.h>
#include <string.h>
#include "General.h"

#define MAX_SIZE 100
main ()
{
    int msqid;
    if ((msqid = msgget(IPC_PRIVATE, IPC_CREAT | 0666))== -1)
        syserr("Message Queue Creation failed");

    struct MessageFormat {
        long message_type;
        char message_text[MAX_SIZE];
    } message;

    int new_pid;
    if ((new_pid = fork()) == 0) {
        message.message_type = 1;
        strcpy(message.message_text, "Here's the message");

        if ((msgsnd(msqid,&message,sizeof(message),0)) == -1)
            syserr("Message send failed");
        exit(1);
    }
    else if (new_pid > 0) {
        if ((msgrcv(msqid,&message,sizeof(message),1,0)) == -1)
            syserr("Message receipt failed");
        cout << "Message received was " << message.message_text << endl;
        struct msqid_ds buffer;
        if (msgctl(msqid,IPC_RMID,&buffer) == -1)
            syserr("Message Queue Deletion failed");
    }
}
