class DoubleRectangle {
  private double length;  
  private double width;  

  public DoubleRectangle(double l, double w) {
    length = l;
    width = w;
  }

  public double calculateArea() {
    return length * width;
  } 
 
  public double calculatePerimeter() {
    return (2 * length) + (2 * width);
  }
}
