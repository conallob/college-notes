#include <stdio.h>
#include <float.h>
#include <stdlib.h>
#include <stdbool.h>

struct perceptron_network {
    unsigned int num_inputs;
    unsigned int num_outputs;
    int absolute_change;
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

   for (i = 0; i < network->num_outputs; i++)
   {
       network->biases[i] = (drand48() - 0.5) * range;
   }
}

void initialize_perceptron_weights(struct perceptron_network *network, unsigned int range)
{
    int i;

    for (i = 0; i < network->num_inputs * network->num_outputs; i++)
    {
        network->weights[i] = (drand48() - 0.5) * range;
    }
}

bool update_perceptron_network(struct perceptron_network *network, int *input, unsigned int num_inputs)
{
    if (num_inputs > network->num_inputs)
    {
        return(false);
    }

    return(true);
}

void free_perceptron_network(struct perceptron_network *network)
{
    free(network->output);
    free(network->biases);
    free(network->weights);
    free(network);
}

int main(int argc, char **argv)
{
    struct perceptron_network *network;

    network = create_perceptron_network(64, 8);

    initialize_perceptron_biases(network, 1);
    initialize_perceptron_weights(network, 1);

    do {
        update_perceptron_network(network, NULL, 0);
    } while (network->absolute_change > 0.0001);

    free_perceptron_network(network);

    return(0);
}
