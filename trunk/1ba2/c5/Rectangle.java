import java.lang.Math.*;

class Rectangle {
  private double width, height;

  public Rectangle(double w, double h) {
	  width = w;
	  height = h;
  }

  public double retWidth() {
	  return width;
  } 

  public double retHeight() {
	  return height;
  } 

  public double area() {
	  return width*height;
  } 

  public double perimeter() {
	  return ((width*2) + (height*2));
  } 

}
