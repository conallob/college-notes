/* 
 * $Id$ 
 */

#include <stdio.h>
#include <float.h>
#include <stdlib.h>
#include <stdbool.h>

struct perceptron_network {
    unsigned int num_inputs;
    unsigned int num_outputs;
    int absolute_change;
    int *input;
    int *output;
    double *biases;
    double *weights;
};

struct perceptron_network *create_perceptron_network(unsigned int inputs, unsigned int outputs)
{
    struct perceptron_network *network;

    if ((network = malloc(sizeof(struct perceptron_network))) == NULL)
        goto error;

    network->num_inputs = inputs;
    network->num_outputs = outputs;
    network->absolute_change = 0;

    if ((network->output = calloc(outputs, sizeof(int))) == NULL)
        goto error;

    if ((network->biases = calloc(outputs, sizeof(double))) == NULL)
        goto error;

    if ((network->weights = calloc(inputs * outputs, sizeof(double))) == NULL)
        goto error;

    return(network);

error:
    if (network != NULL)
    {
        if (network->output != NULL)
            free(network->output);

        if (network->biases != NULL)
            free(network->biases);

        if (network->weights != NULL)
            free(network->weights);

        free(network);
    }

    return(NULL);
}


void initialize_perceptron_biases(struct perceptron_network *network, unsigned int range)
{
   int i;

   for (i = 1; i < network->num_outputs; i++)
   {
       network->biases[i] = (drand48() - 0.5) * range;
   }
}


void initialize_perceptron_weights(struct perceptron_network *network, unsigned int range)
{
    int i, j;
	 
    for (j = 1; i < network->num_outputs; j++)
    {
    	  for (i = 1; i < network->num_inputs; i++)
		  {
        		network->weights[j][i] = (drand48() - 0.5) * range;
		  }
    }
}


bool update_perceptron_network(struct perceptron_network *network, int *input, unsigned int num_inputs, int *training_data_t)
{
    if (num_inputs > network->num_inputs)
    {
        return(false);
    }
	
	 int i, j;

	 for (j = 1; j < network->num_outputs; j++)
	 {
	 	  for (i = 1; i < network->num_inputs; i++)
		  {
				if(network->output[j] != training_data_t[j])
				{
					 network->biases[j] += training_data_t[j];
					 network->weights[j][i] += /* TODO - Pester someone who knows what t_j x_i means*/ ;
					 network->absolute_change += /* t_j x_i */;
				}
		  }
	 }
}


void free_perceptron_network(struct perceptron_network *network)
{
    free(network->output);
    free(network->biases);
    free(network->weights);
    free(network);
}


void set_activation_inputs(struct perception_network *network, int *training_data_s)
{
	int i;

	for (i = 0; i < network->num_inputs; i++)
	{
		network->input[i] = training_data_s[i];
	}
	
}

void compute_perception_outputs(struct perception_network *network, unsigned double theta)
{
	int i, j;
	int *y_in

	for(j = 1; j < network->num_outputs; j++)
	{
			y_in = network->biases[j];

			for(i = 1; i < network->num_inputs; i++)
			{
					y_in[j] += network->input[i] + network->weights[j][i];
			}
			
			if (y_in[y] > theta)
			{
					  
					  network->output[j] = 1;
					  
			} else if (y_in[j] >= (-1 * theta) && y_in <= theta)
			{
					  
					  network->output[j] = 0;
					  
			} else if (y_in[j] < (-1 * theta))
			{
					  network->output[j] = -1;
			}
 			
	}
	
}


int main(int argc, char **argv)
{

    struct perceptron_network *network;
	 int *s *t;
	 double theta;
	 FILE ifp;

	 /* Step 0 */
    network = create_perceptron_network(64, 8);

    initialize_perceptron_biases(network, 1);
    initialize_perceptron_weights(network, 1);

	 if (argv[2] != NULL)
	 {
				
			theta = argv[2];
			
	 } else {
			
			theta = 1;

	 }

	 /* Parse training data for s and t from data file... */
	
	 ifp = fopen(argv[1], "r");

	 for (i = 0; i < network->num_inputs; i++)
	 {
		 fscanf(ifp, "%d", &s);
		 fscanf(ifp, "%d", &t);
	 }
	
	 fclose(ifp);
	 
	 /* Step 1*/
    do {
			/* Step 2 */
			/* Step 3 */
		   set_activation_inputs(network, s);
			/* Step 4 */
			compute_perception_outputs(network, theta);	
			/* Step 5 */
         update_perceptron_network(network, NULL, 0);
		  
    } while (network->absolute_change > 0.0001);

	 
    free_perceptron_network(network);

    return(0);
}
