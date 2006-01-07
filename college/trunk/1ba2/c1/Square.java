class Square {
  /* declare the instance variables */
  private int length;  // used to store the length of a side

  /* declare a constructor to initialise */
  /* new instances of class square */
  public Square(int l) {
    length = l;      // store the value of l into length
  }

  /* declare the other methods */
  /* a method to calculate the area of a square */
  public int calculateArea() {
    return length * length;
  } 
 
  /* a method to calculate the perimeter of a square */
  public int calculatePerimeter() {
    return (4 * length);
  }
}
