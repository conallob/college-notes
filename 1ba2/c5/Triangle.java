import java.lang.Math.*;

class Triangle {
  private double side1,side2,side3;

  public Triangle(double s1, double s2, double s3) {
	  side1 = s1;
	  side2 = s2;
	  side3 = s3;
  }


  //formula for area of triangle from logbook .... no idea how to derive it
  public double area() {
	  double s;
	  s = side1+side2+side3;
	  s /= 2;
	  return Math.sqrt(s*(s-side1)*(s-side2)*(s-side3));
  } 

  public double perimeter() {
	  return (side1 + side2 + side3);
  } 

}
