import java.lang.Math.*;

class Circle {
  private double radius, xPos, yPos;

  public Circle(double wr, double wx , double wy) {
	  radius = wr;
	  xPos = wx;
	  yPos = wy;
  }

  public double retX() {
	  return xPos;
  } 

  public double retY() {
	  return yPos;
  } 

  public double retRadius() {
	  return radius;
  } 

  //area = (pi)(r^2)
  public double area() {
	  return Math.PI*radius*radius;
  } 

  //circumference = 2(pi)r
  public double circumference() {
	  return Math.PI*radius*2;
  } 


  //if the distance between the two centers is less than the sum of the 
  //radii then the circles overlap
  public boolean overlaps(Circle otherCircle){
	  double dist, xdiff, ydiff;
	  xdiff = otherCircle.retX() - xPos;
	  ydiff = otherCircle.retY() - yPos;
	  xdiff *= xdiff;
	  ydiff *= ydiff;
	  dist = Math.sqrt(xdiff + ydiff); 
	  if(dist < (radius+otherCircle.retRadius()))
		  return true;
	  return false;
  }
}
