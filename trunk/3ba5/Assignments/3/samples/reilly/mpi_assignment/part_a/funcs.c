
int f ( int i, int j, int n ) {
	int result;

	/* result will be equal to the index of the element,
	   if the matrix were one row */
	result = i * n;
	result = result + j;
	return ( result );
}

int g ( int i, int j, int n ) {
	int result;

	/* result will be equal to the index of the element, 
	   if the matrix were one row */
	result = j * n;
	result = result + i;
	return ( result );
}
