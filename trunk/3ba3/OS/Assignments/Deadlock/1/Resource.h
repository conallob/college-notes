// $Id$

class Resource {

		  public:
		  
					 // {a,b,c}[0] is the max value
					 //
					 // {a,b,c}[1-4] are the realtime values
		 	
					 int a[5], b[5], c[5];
					 
					 // realtime paramaters for sleep()
		  
					 int sleeps[4];

				
					 Resource(int which_one);

};

Resource::Resource(int which_one) {

		  switch (which_one) {

					 case 0:
							
								// Master Resource Definitions
        					
								a = {3, 3, 3, 3, 3};
								b = {3, 3, 3, 3, 3};
								c = {3, 3, 3, 3, 3};
							
								sleeps = {0, 0, 0, 0};
			 				
								break;

					 case 1:
								
								// Resources for Thread1:
							
								a = {2, 1, 1, 0, -2}; 
								b = {3, 1, 1, 1, -3}; 
								c = {1, 0, 1, 0, -1}; 
							
								// sleeps for Thread1:
							
								sleeps = {3, 3, 9, 5};

								break;

					 case 2:
			
							
								// Resources for Thread2:
							
								a = {1, 0, 1, 0, -1}; 
								b = {2, 0, 1, 1, -2}; 
								c = {3, 3, 0, 0, -3}; 
							
								// sleeps for Thread2:

								sleeps = {5, 6, 8, 1};

								break;

					 case 3:
							
								// Resources for Thread3:

								// assuming type in assignment should read 
								// -AAABBB not -ABBCCC, since max C = 0...
							
								a = {3, 3, 0, -3, 0}; 
								b = {3, 0, 3, -3, 0}; 
								c = {0, 0, 0,  0, 0};  
							
								// sleeps for Thread3:

								sleeps = {7, 5, 8, 0};

								break;

					 default:

								a = {0, 0, 0, 0, 0};
								b = {0, 0, 0, 0, 0};
								c = {0, 0, 0, 0, 0};

								sleeps = {0, 0, 0, 0};

		  }

}
