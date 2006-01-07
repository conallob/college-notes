
class Stack {
  private int[] stackData;
  int top = 0;

  public Stack() {
	  stackData = new int[50]; //default to a stack size of 50
	  stackData[0] = 0;
  }

  public Stack(int ss) {
	  stackData = new int[ss]; //create a stack of size ss
	  stackData[0] = 0;
  }

  //return 0 for error
  public int topVal(){
	  if(top == 0)
		  return 0;
	  return stackData[top-1];
  }

  //return 0 for error
  public boolean push(int w) {
	  if(top == stackData.length)
		  return false;
	  stackData[top++] = w;
	  return true;
  } 

  //return 0 for error
  public int pop() {
	  if(top == 0)
		  return 0;
	  return stackData[--top];
  } 

}
