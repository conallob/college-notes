// $Id$

class Resource {

		  public:
		  
					 // {a,b,c}[0] is the max value
					 //
					 // {a,b,c}[1-4] are the realtime values
		  
					 int a[5], b[5], c[5];

					 // realtime paramaters for sleep()
		  
					 int sleeps[4];

					 Resource();

};

Resource::Resource() {

		  int a[5] = {0, 0, 0, 0, 0};
		  int b[5] = {0, 0, 0, 0, 0};
		  int c[5] = {0, 0, 0, 0, 0};
		  
		  int sleeps[4]  = {0, 0, 0, 0};
		  
}
