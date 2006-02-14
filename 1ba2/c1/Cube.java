class Cube {
  /* declare the instance variables */
  private int length;  // used to store the length of a side

  /* declare a constructor to initialise */
  /* new instances of class Cube */
  public Cube(int l) {
    length = l;      // store the value of l into length
  }

  /* declare the other methods */
  /* a method to calculate the area of a cube */
  public int calculateArea() {
    return length * length;
  } 
 
  /* a method to calculate the volume of a cube */
  public int calculateVolume() {
    return (length * length * length);
  }
}
