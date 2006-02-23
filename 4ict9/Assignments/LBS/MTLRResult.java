/*
 * MPS SDK Demo application
 */


package  demo1;

import java.lang.Math;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ericsson.snf.mps.LocationData;
import com.ericsson.snf.mps.GatewayException;
import com.ericsson.snf.mps.LocationFailure;
import com.ericsson.snf.mps.req.LocationResult;
import common.ConnectionManager;
import common.Util;

import com.ericsson.snf.mps.LocatedMobileStation;
import com.ericsson.snf.mps.MobileStation;
import com.ericsson.snf.mps.gad.CircularArcArea;
import com.ericsson.snf.mps.gad.CircularArea;
import com.ericsson.snf.mps.gad.Coordinate;
import com.ericsson.snf.mps.gad.EllipticalArea;
import com.ericsson.snf.mps.gad.GadShape;
import com.ericsson.snf.mps.gad.Point;
import com.ericsson.snf.mps.gad.Polygon;
import com.ericsson.snf.mps.rep.LocationReport;
import com.ericsson.snf.mps.req.LocationResult;
import demo2.DemoPushHandler;
import demo3.LocatedCallServlet;

/**
 * It is better to use the java.lang.StringBuffer to concatenate strings, but
 * the += operator is used in the example applications for easier reading.
 */
public class MTLRResult extends HttpServlet {
    private static final String TABLE_HEAD = "<table width='450' border='0'>"
            + "<tr><th>MSISDN</th><th>Time</th></tr>";
    private static final String TABLE_END = "</table>";
    private static final String NEW = "<BR><BR><a href='demo1'>New search</a>";

    /**
     *
     * @param request
     * @param response
     * @exception ServletException, IOException
     */
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        response.setContentType(Util.CONTENT_TYPE);
        response.setHeader(Util.CACHE_CONT, Util.NO_CACHE);
        response.setDateHeader(Util.DATE, System.currentTimeMillis());
		  response.setContentType("text/plain");
        String html = "";//Util.getHeader(MTLRForm.NAME) +"<body>";
        Vector msSet=new Vector(2,2);
        String value = null;
        int i;
	String mobileId="";



// Get the location of the mobile

try {
	mobileId=request.getParameter("msisdn0");
		String[] target={mobileId};
                LocationResult result=ConnectionManager.getInstance().getLocation(target);
                    MobileStation ms=new MobileStation(mobileId);
                    LocationData lms=result.getLocationData(ms);
                    LocatedMobileStation ld=(LocatedMobileStation)lms;
		GadShape locShape = ld.getLocationShape();
		Coordinate coord = locShape.getReferencePoint();
		html+="x: " + coord.getX() + "y: " + coord.getY();
}catch (Exception ex) {
                System.out.println(ex.getMessage());
                html += "Error: Could not obtain location" + ex.getMessage();
            }
        response.setContentLength(html.length());
        PrintWriter out = response.getWriter();
        out.println(html);
    }

// Now let's open and read a file...

try {
	if ( !data.exists() || !data.canRead() ) {
   	System.out.println( "Ack! I'm a silly programming language which can't read " + data );
  		return;
   }

//  Now to do something...

try {
	FileReader fr = new FileReader ( data );
 	BufferedReader in = new BufferedReader( fr );
 	String line, cinema;
	Boolean flag;
	String [] ccoords;
	int proximity = 1000;
 	while ((line = in.readLine()) != null) {
		if (line.endsWith(":")) {
			flag = false;
      	cinema = line.replace(':',',');
      } else if (line.startsWith("#")) {
			ccoords = ((line.replace('#',' ')).trim()).split(":");
			if ( ((coord.getX() - (atoi(ccoords[0])).abs < proximity) && 
				((coord.getY() - (atoi(ccoords[1])).abs < proximity)) { 
				flag = true;
			} else {
				flag = false;
			}	
      } else if ((flag == true) && (line.length() > 2)) {
         System.out.println(line);
      }
   }
} catch ( FileNotFoundException e ) {
 System.out.println( "Ack! I'm a silly programming language who can't find your file!" );
}
