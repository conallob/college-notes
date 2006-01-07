#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
#include "mpi.h"

int 
main(int argc, char **argv)
{
   /*
    * Initialisation of variables
    */
	int             my_rank, nprocs, namelen, BYTE, KBYTE, MBYTE;
	int             tag = 50;
	double          starttime, endtime, sumtime;
	double          message_upperlimit, message_lowerlimit, message_increment;
	double         *message_a, *message_b;
	double          packetsize, datarate, sumdatarate;
	int             i, iterations, dcount;
	FILE           *ofp;
	char            filename[100], processor_name[100];

   /*
   * MPI initialisation
   */
	MPI_Status status;
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
	MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
	MPI_Get_processor_name(processor_name, &namelen);

   /*
   * Initialisation of various counters and define what a kilobyte
   * and megabyte is.
   */
   dcount = 0;
	iterations = 20;
	MBYTE = 1024 * 1024;
	KBYTE = 1024;
	BYTE = 1;

	/*
	 * argc = 4, argv[1]=lowerlimit in megs, argv[2] upperlimit in megs
	 * argv[3] = increment size in kb argv[4] = n process pairs?
	*/

   if ((argc < 3) || (argc == NULL)) {
      fprintf(stderr, "Error: not enough command line arguments.\n\n");
      fprintf(stderr, "\tSyntax is %s lowerlimit upperlimit increment\n\n", argv[0]);
      fprintf(stderr, "Where lowerlimit, upperlimit are in megabytes and increment is in kilobytes.\n\n");
      fflush(stderr);
      exit(1);
   }
   
   /*
   * Check if the number of procs is less than 2, if so
   * exit.
   */
   if (nprocs < 2){
      fprintf(stderr, "Error: Number of processes is less than 2.\n");
      exit(1);
   }

   if (nprocs % 2 != 0) {
      fprintf(stderr, "Error: Odd number of total processes, the number of processes must be even to be paired off\n");
      exit(1);
   }
  
   /*
   * Grab the commandline args and convert to floatpoint numbers for later use.
   */
   message_lowerlimit = MBYTE * atof(argv[1]) * sizeof(char);
	message_upperlimit = MBYTE * atof(argv[2]) * sizeof(char);
	message_increment = KBYTE * atof(argv[3]) * sizeof(char);

   /*
   * Check timer accuracy.
   */
	starttime = MPI_Wtime();
	endtime = MPI_Wtime();

	while (endtime == starttime) {
		endtime = MPI_Wtime();
	}

	if (my_rank == 0) {
		printf("timer accuracy: %f\n", endtime - starttime);
		sprintf(filename, "%d", nprocs);
		strcat(filename, "-process.dat");
		ofp = fopen(filename, "w");
	}
	
   printf("Init %d, on %s\n", my_rank, processor_name);

   /*
   * Main outer loop, loops until message_lowerlimit is gets incremented
   * to message_upperlimit, then breaks out of the loop.
   */
   while (message_lowerlimit <= message_upperlimit) {

      /* create the messages using malloc */
		message_a = (double *)malloc(message_lowerlimit);
		message_b = (double *)malloc(message_lowerlimit);

      /* reset the total time for each packet size */
		sumtime = 0;

      /* carry out the ping pongs for a given number of iterations */
		for (i = 0; i < iterations; i++) {
			MPI_Barrier(MPI_COMM_WORLD);
			starttime = MPI_Wtime();
         /* have messages sent in pairs, i.e. 0->1, 2->3 etc... */
			if (my_rank % 2 == 0) {
				MPI_Send(message_a, message_lowerlimit / 8, MPI_DOUBLE, my_rank + 1, tag, MPI_COMM_WORLD);
				MPI_Recv(message_b, message_lowerlimit / 8, MPI_DOUBLE, my_rank + 1, tag, MPI_COMM_WORLD, &status);
			} else {
				MPI_Recv(message_a, message_lowerlimit / 8, MPI_DOUBLE, my_rank - 1, tag, MPI_COMM_WORLD, &status);
				MPI_Send(message_b, message_lowerlimit / 8, MPI_DOUBLE, my_rank - 1, tag, MPI_COMM_WORLD);
			}
			MPI_Barrier(MPI_COMM_WORLD);
			endtime = MPI_Wtime();
			sumtime += (endtime - starttime);
		}
      /* free up the malloc'd memory for next packet size. */
		free(message_a);
		free(message_b);

      /* calculate the packet size and datarate in bits. */
		packetsize = (double)((message_lowerlimit * 8) / MBYTE);
		datarate = (double)((packetsize) / ((sumtime / iterations) / 2));
		/* 
         fprintf(stdout, "Rank: %d, Packet size: %.6f (Mbits), Time: %.6f (s), Datarate: %.6f (Mbit/s)\n", my_rank, packetsize, (sumtime / iterations) / 2, datarate);
      */
      sumdatarate += datarate;
      ++dcount;


      /*
      * Write out the collected data to file in the following format:
      *
      *  PACKETSIZE, TIMETAKEN(average in one direction not round trip), DATARATE
      */
		if (my_rank == 0) {
			fprintf(ofp, "%.6f, %.6f, %.6f\n", message_lowerlimit, ((sumtime / iterations) / 2), datarate);
			fflush(ofp);
		}
     
      /* increment packetsize with desired increment size given on command line.*/ 
		message_lowerlimit += message_increment;
	}

   /*
	* Finally, close the file pointer, and print an estimated datarate and latency for each packet.
   */
   if (my_rank == 0) {
		fclose(ofp);
      fprintf(stdout, "Estimates: Average datarate: %.6f (Mbit/s), Average latency: %.6f (s)\n", (sumdatarate/dcount), (1/(sumdatarate/dcount)));
	}
	MPI_Finalize();
	return 0;
}
