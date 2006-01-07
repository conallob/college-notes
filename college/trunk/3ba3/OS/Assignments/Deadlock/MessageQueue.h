// $Id$

#ifndef MESSAGEQ_H
#define MESSAGEQ_H

#define MAX_MESSAGE_LENGTH 100
typedef struct MessageFormat {
    long message_type;
    char mess[MAX_MESSAGE_LENGTH];
} tMessageFormat;

class CMessageQueue {
public:
   CMessageQueue();
   ~CMessageQueue();
   void Send(tMessageFormat* message, int message_size);
   bool Receive(long message_type, tMessageFormat* message, int& message_size);
private:
   int mID;
};

#endif
