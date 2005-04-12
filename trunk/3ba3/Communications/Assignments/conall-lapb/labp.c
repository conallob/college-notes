/* Protocol 7 (labp) allows .
 *
 * To compile: cc -o protocol7 labp.c simulator.o
 * To run: protocol7 events timeout  pct_loss  pct_cksum  debug_flags
 *
 * Written by Conall O'Brien



#define MAX_SEQ 1	/* must be 1 for protocol 3 */
#define MAX_PROTOCOL 7          /* highest protocol being simulated */
                                /* THIS SHOULD BE REMOVED */
typedef enum  {frame_arrival, cksum_err, timeout} event_type;
#include "protocol.h"

void sender_lapb(void);
void receiver_lapb(void);

int main(int argc, char *argv[])
{
  int timeout_interval, pkt_loss, garbled, debug_flags;
  long event;

  if (!parse_first_five_parameters(argc, argv, &event, &timeout_interval,
                                   &pkt_loss, &garbled, &debug_flags))  {
    printf ("Usage: lapb events timeout loss cksum debug\n");
    exit(1);
  }

  printf("\n\n Simulating LAPB\n");
  start_simulator(sender_lapb, receiver_lapb, event, timeout_interval, pkt_loss, garbled, debug_flags);
}

void sender_lapb(void)
{
  seq_nr next_frame_to_send;	/* seq number of next outgoing frame */
  lapb_frame s;		/* scratch variable */
  packet buffer;	/* buffer for an outbound packet */
  event_type event;
  boolean handshake; /* true if handshake sucessful, false otherwise */

  next_frame_to_send = 0;	/* initialize outbound sequence numbers */
  handshake = false; /* initialise handshake flag */
  from_network_layer(&buffer);	/* fetch first packet */
  while (true) {
        init_frame_lapb(&s);
        s.info = buffer;	/* construct a frame for transmission */
 /*       s.seq = next_frame_to_send;	/* insert sequence number in frame */ 
        to_physical_layer_lapb(&s);	/* send it on its way */
		  increment_lapb_ns();
        start_timer(get_lapb_ns(&s));	/* if answer takes too long, time out */
        wait_for_event_lapb(&event);	/* frame_arrival, cksum_err, timeout */
        if (event == frame_arrival) {
                from_physical_layer_lapb(&s);	/* get the acknowledgement */
                if (get_lapb_nr(&s) == next_frame_to_send) {
                        from_network_layer_lapb(&buffer);	/* get the next one to send */
                        inc(next_frame_to_send);	/* invert next_frame_to_send */
								increment_lapb_ns(&s);
                }
        }
  }
}

void receiver_lapb(void)
{
  seq_nr frame_expected;
  lapb_frame r, s;
  event_type event;
  boolean handshake; /* true if handshake sucessful, false otherwise */

  frame_expected = 0;
  handshake = false; /* initialise handshake flag */
  while (true) {
        wait_for_event_lapb(&event);	/* possibilities: frame_arrival, cksum_err */
        if (event == frame_arrival) {
                /* A valid frame has arrived. */
                from_physical_layer_lapb(&r);	/* go get the newly arrived frame */
                if (get_lapb_ns(&r) == frame_expected) {
                        /* This is what we have been waiting for. */
                        to_network_layer_lapb(&r.info);	/* pass the data to the network layer */
                        inc(frame_expected);	/* next time expect the other sequence nr */
                }
                init_frame_lapb(&s);
                increment_lapb_nr(&s);	/* tell which frame is being acked */
                to_physical_layer_lapb(&s);	/* only the ack field is use */
        }
  }
}

