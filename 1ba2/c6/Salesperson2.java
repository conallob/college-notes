/* Program 6.13: program to calculate distance */
/* travelled by salesperson (revised) */

import tcdIO.*;

class Salesperson {
  public static void main (String args[]) {
    Terminal terminal;
    City currentCity;     // reference to city we're in
    City nextCity;        // reference to city we're going to
    City firstCity;       // reference to 1st city
    double x, y;          // used to get input
    double distance = 0;  // running total
    int citiesVisited, citiesToVisit;  // used to count cities
 
    /* create an object to represent the terminal */
    terminal = new Terminal("Program 6.13");

    /* ask user for number of cities to visit */
    citiesToVisit = terminal.readInt("How many cities are on the route? ");

    citiesVisited = 1;
    /* ask user for coordinates of first city */
    terminal.println("Enter coordinates of city: " + citiesVisited + ".");
    x = terminal.readDouble("X: "); y = terminal.readDouble("Y: ");
    /* create object to represent first city */
    currentCity = new City(x, y);
    firstCity = currentCity;     // remember first city for later

    while (citiesVisited < citiesToVisit) {
      /* process next city */
      citiesVisited = citiesVisited + 1;
    
      /* ask user for coordinates of next city */
      terminal.println("Enter coordinates of city: " + citiesVisited + ".");
      x = terminal.readDouble("X: "); y = terminal.readDouble("Y: ");
      /* create object to represent next city */
      nextCity = new City(x, y);

      /* get distance between current and next cities */
      distance = distance + currentCity.getDistance(nextCity);
      /* move to next city */
      currentCity = nextCity;
    }

    /* write out result */
    terminal.println("Distance travelled is: " + distance + ".");

    /* now calculate straight-line distance between first and last cities */
    distance = firstCity.getDistance(currentCity);
    terminal.println("Direct distance is: " + distance + ".");
  }
}
