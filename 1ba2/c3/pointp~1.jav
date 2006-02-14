/* Exercise 3.9 */
import tcdIO.*;
class PointProgram {
  public static void main (String args[]) {
    Terminal terminal;
    Point pos1, pos2, pos3;  // (A) declare three Point variables

    terminal = new Terminal("Exercise 3.9");
   
    /* create an object representing some point */
    pos1 = new Point(15.2F, 17.5F);
    pos2 = pos1;                     // (B)
    
    /* (1) print the co-ordinates of the point on the screen */
    terminal.println("pos1 refers to an object at: "
                            + pos1.getX() + ", " + pos1.getY());

    /* create another object representing a point */
    pos3 = new Point(30.6F, 5.5F);     // (C)
    
    /* (2) print the co-ordinates of the point referred to by pos3 */
    terminal.println("pos3 refers to an object at: "
                             + pos3.getX() + ", " + pos3.getY());

    pos2.moveTo(17.9F, 34.6F);        // (D)
    
    /* (3) print the co-ordinates of the point referred to by pos1 */
    terminal.println("pos1 refers to an object at: "
                             + pos1.getX() + ", " + pos1.getY());

    pos3 = pos2;   // (E)

    /* (4) print the co-ordinates of the point referred to by pos3 */
    terminal.println("pos3 refers to an object at: "
                             + pos3.getX() + ", " + pos3.getY());
    
    /* create yet another object representing a point */
    pos2 = new Point(17.9F, 34.6F);  // (F)
    
    /* (5) print the co-ordinates of the point referred to by pos2 */
    terminal.println("pos2 refers to an object at: "
                             + pos2.getX() + ", " + pos2.getY());
    
    pos2.moveTo(10.0F, 10.0F);        // (G)

    /* (6) print the co-ordinates of all the points */
    terminal.println("pos1 refers to an object at: "
                             + pos1.getX() + ", " + pos1.getY());
    terminal.println("pos2 refers to an object at: "
                             + pos2.getX() + ", " + pos2.getY());
    terminal.println("pos3 refers to an object at: "
                             + pos3.getX() + ", " + pos3.getY());
 }
}
