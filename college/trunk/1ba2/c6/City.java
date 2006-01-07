/* Program 3.19: a class whose instances represent cities */
/* with x and y coordinates  */
class City {
  private double xPos, yPos;  // only attributes of interest
                              // are x and y coordinates

  /* initialise a new City */
  public City(double x, double y) {
    xPos = x;
    yPos = y;
  }

  /* return x coordinate */
  public double getX() {
    return xPos;
  }

  /* return y coordinate */
  public double getY() {
    return yPos;
  }

  /* get distance to some other city */
  public double getDistance(City next) {
    double tmpX, tmpY;      // local variables for this method

    tmpX = next.getX() - xPos; // (x2 - x1)
    tmpY = next.getY() - yPos; // (y2 - y1)
    return Math.sqrt((tmpX*tmpX) + (tmpY*tmpY));
  } 
}
