/* Program 6.12: program to calculate distance */
/* travelled by salesperson */

import tcdIO.*;

class Salesperson {
  public static void main (String args[]) {
    Terminal terminal;
    City currentCity; // reference to city we're in
    City nextCity;    // reference to city we're going to
    City firstCity;   // reference to 1st city
    double x, y;      // used to get input
    double distance;  // running total
 
    /* create an object to represent the terminal */
    terminal = new Terminal("Program 6.12");

    /* ask user for coordinates of 1st city */
    terminal.println("Enter coordinates of first city:");
    x = terminal.readDouble("X:"); y = terminal.readDouble("Y:");
    /* create object to represent 1st city */
    currentCity = new City(x, y);
    firstCity = currentCity;     // remember 1st city for later
  
    /* ask user for coordinates of next city */
    terminal.println("Enter coordinates of second city:");
    x = terminal.readDouble("X:"); y = terminal.readDouble("Y:");
    /* create object to represent 2nd city */
    nextCity = new City(x, y);

    /* get distance between 1st and 2nd cities */
    distance = currentCity.getDistance(nextCity);
    currentCity = nextCity;      // move to 2nd city
  
    /* ask user for coordinates of next city */
    terminal.println("Enter coordinates of third city:");
    x = terminal.readDouble("X:"); y = terminal.readDouble("Y:");
    /* create object to represent 3rd city */
    nextCity = new City(x, y);

    /* update distance with distance between 2nd and 3rd cities */
    distance = distance + currentCity.getDistance(nextCity);
    currentCity = nextCity;      // move to 3rd city

    /* ask user for coordinates of next city */
    terminal.println("Enter coordinates of fourth city:");
    x = terminal.readDouble("X:"); y = terminal.readDouble("Y:");
    /* create object to represent 4th city */
    nextCity = new City(x, y);

    /* update distance with distance between 3rd and 4th cities */
    distance = distance + currentCity.getDistance(nextCity);
    currentCity = nextCity;      // move to 4th city

    /* ask user for coordinates of next city */
    terminal.println("Enter coordinates of fifth city:");
    x = terminal.readDouble("X:"); y = terminal.readDouble("Y:");
    /* create object to represent 5th city */
    nextCity = new City(x, y);

    /* update distance with distance between 4th and 5th cities */
    distance = distance + currentCity.getDistance(nextCity);
    currentCity = nextCity;      // move to 5th city

    /* write out result */
    terminal.println("Distance travelled is: " + distance + ".");
    
    /* calculate direct distance between 1st and 5th cities */
    distance = firstCity.getDistance(currentCity);
    terminal.println("Direct distance is: " + distance + ".");
 }
}
