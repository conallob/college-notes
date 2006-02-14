class Cuboid {
  /* declare the instance variables */
  private int length;  // used to store the length of a side
  private int breadth;  // used to store the breadth of a side
  private int height;  // used to store the height of a side

  /* declare a constructor to initialise */
  /* new instances of class Cuboid */
  public Cuboid(int l, int b, int h) {
    length = l;      // store the value of l into length
    breadth = b;      // store the value of b into breadth
    height = h;      // store the value of h into height
  }

  /* declare the other methods */
  public int calculateArea1() {
    return length * height;
  } 
 
  public int calculateArea2() {
    return length * breadth;
  } 
 
  public int calculateArea3() {
    return height * breadth;
  } 
 
  public int calculatePerimeter() {
    return (length*4 + height*4 + breadth*4);
  }

  public int calculateVolume() {
    return (length * height * breadth);
  }
}

