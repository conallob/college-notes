/*
 * movieLBS.java
 *
 * Created on 02 February 2006, 16:27
 */

package hello;

import javax.microedition.midlet.*;
import javax.microedition.lcdui.*;

import javax.microedition.midlet.MIDlet;
import javax.microedition.midlet.MIDletStateChangeException;
import javax.microedition.lcdui.*;
import javax.microedition.io.HttpConnection;
import javax.microedition.io.Connector;
import javax.microedition.io.Connection;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.parsers.SAXParser;
import java.io.InputStream;
import java.io.IOException;
import java.util.Vector;
/**
 *
 * @author COLLINDA
 */

public class movieLBS extends MIDlet implements javax.microedition.lcdui.CommandListener, Runnable {
    
    /**
     * Creates a new instance of movieLBS
     */
    public movieLBS() {
        connectionSuccess=false;
    }
    
    private boolean connectionSuccess;
    private Form helloForm;//GEN-BEGIN:MVDFields
    private StringItem helloStringItem;
    private Command exitCommand;
    private List list1;
    private Command getListings;
    private Command backCommand1;
    private org.netbeans.microedition.lcdui.WaitScreen waitScreen1;
    private org.netbeans.microedition.util.SimpleCancellableTask simpleCancellableTask1;
    private org.netbeans.microedition.lcdui.SplashScreen splashScreen1;//GEN-END:MVDFields

    /** This method initializes UI of the application.//GEN-BEGIN:MVDInitBegin
     */
    private void initialize() {//GEN-END:MVDInitBegin
        getDisplay().setCurrent(get_helloForm());//GEN-LINE:MVDInitInit
    }//GEN-LINE:MVDInitEnd

    /**
     * This method should return an instance of the display.
     */
    public Display getDisplay () {//GEN-FIRST:MVDGetDisplay
        return Display.getDisplay (this);
    }//GEN-LAST:MVDGetDisplay

    /**
     * This method should exit the midlet.
     */
    public void exitMIDlet () {//GEN-FIRST:MVDExitMidlet
        getDisplay().setCurrent (null);
        destroyApp(true);
        notifyDestroyed();
    }//GEN-LAST:MVDExitMidlet

    /** Called by the system to indicate that a command has been invoked on a particular displayable.//GEN-BEGIN:MVDCABegin
     * @param command the Command that ws invoked
     * @param displayable the Displayable on which the command was invoked
     */
    public void commandAction(Command command, Displayable displayable) {//GEN-END:MVDCABegin
        if (displayable == helloForm) {//GEN-BEGIN:MVDCABody
            if (command == getListings) {//GEN-END:MVDCABody
                getDisplay().setCurrent(get_waitScreen1());//GEN-LINE:MVDCAAction9
            } else if (command == exitCommand) {//GEN-LINE:MVDCACase9
                exitMIDlet();//GEN-LINE:MVDCAAction3
            }//GEN-BEGIN:MVDCACase3
        } else if (displayable == list1) {
            if (command == backCommand1) {//GEN-END:MVDCACase3
                getDisplay().setCurrent(get_helloForm());//GEN-LINE:MVDCAAction16
            } else if (command == list1.SELECT_COMMAND) {//GEN-BEGIN:MVDCACase16
                switch (get_list1().getSelectedIndex()) {
                    case 0://GEN-END:MVDCACase16
                        break;//GEN-BEGIN:MVDCACase11
                    case 1://GEN-END:MVDCACase11
                        break;//GEN-BEGIN:MVDCACase13
                }
            }
        }//GEN-END:MVDCACase13
}//GEN-LINE:MVDCAEnd

    /** This method returns instance for helloForm component and should be called instead of accessing helloForm field directly.//GEN-BEGIN:MVDGetBegin2
     * @return Instance for helloForm component
     */
    public Form get_helloForm() {
        if (helloForm == null) {//GEN-END:MVDGetBegin2
            helloForm = new Form(null, new Item[] {get_helloStringItem()});//GEN-BEGIN:MVDGetInit2
            helloForm.addCommand(get_exitCommand());
            helloForm.addCommand(get_getListings());
            helloForm.setCommandListener(this);//GEN-END:MVDGetInit2
        }//GEN-BEGIN:MVDGetEnd2
        return helloForm;
    }//GEN-END:MVDGetEnd2

    /** This method returns instance for helloStringItem component and should be called instead of accessing helloStringItem field directly.//GEN-BEGIN:MVDGetBegin4
     * @return Instance for helloStringItem component
     */
    public StringItem get_helloStringItem() {
        if (helloStringItem == null) {//GEN-END:MVDGetBegin4
            helloStringItem = new StringItem("Movie Listings Program", "Hello, hit \"Get Listings\" below to get a list of all movies that are on in the area");//GEN-LINE:MVDGetInit4
        }//GEN-BEGIN:MVDGetEnd4
        return helloStringItem;
    }//GEN-END:MVDGetEnd4

    /** This method returns instance for exitCommand component and should be called instead of accessing exitCommand field directly.//GEN-BEGIN:MVDGetBegin5
     * @return Instance for exitCommand component
     */
    public Command get_exitCommand() {
        if (exitCommand == null) {//GEN-END:MVDGetBegin5
            exitCommand = new Command("Exit", Command.EXIT, 1);//GEN-LINE:MVDGetInit5
        }//GEN-BEGIN:MVDGetEnd5
        return exitCommand;
    }//GEN-END:MVDGetEnd5

    /** This method returns instance for list1 component and should be called instead of accessing list1 field directly.//GEN-BEGIN:MVDGetBegin6
     * @return Instance for list1 component
     */
    public List get_list1() {
        if (list1 == null) {//GEN-END:MVDGetBegin6
            // Insert pre-init code here
            list1 = new List(null, Choice.IMPLICIT, new String[] {//GEN-BEGIN:MVDGetInit6
                "Don\'t be a Menace to South Central While Drinking Juice in the Hood - 9:00PM - Savoy Cinema",
                "5th Element- 9:10PM - Ormonde"
            }, new Image[] {
                null,
                null
            });
            list1.addCommand(get_backCommand1());
            list1.setCommandListener(this);
            list1.setSelectedFlags(new boolean[] {
                false,
                false
            });//GEN-END:MVDGetInit6
           
        }//GEN-BEGIN:MVDGetEnd6
        return list1;
    }//GEN-END:MVDGetEnd6

    public void run()
    {
            int i;
        
            try
            {

                String str = "1000\nanotherthing";//"newspost=Heyeveryonehowareyou?"; //"par1=val";"message=helloworld";////
                System.out.println("Getting listings...");
                StringBuffer input=new StringBuffer();
                input.append("second test");
                
                String url = "http://localhost:8080/movie.html";//"http://www.netsoc.tcd.ie/~sofox/storage/movie.html";//"http://localhost:8080/demo1_res"//http://localhost:8080/movie.html
                HttpConnection hpCon = (HttpConnection) Connector.open(url,Connector.READ_WRITE);//"http://www.netsoc.tcd.ie/~sofox/storage/testMobile.php");//"http://localhost:8080/demo1_res");//
                System.out.println("Connected");
                hpCon.setRequestMethod( HttpConnection.POST ); 
                hpCon.setRequestProperty("User-Agent", "Profile/MIDP-1.0 Configuration/CLDC-1.0");
                hpCon.setRequestProperty("CONTENT-TYPE", "application/x-www-form-encoded");
                hpCon.setRequestProperty("Content-Length", String.valueOf(str.length()));
                java.io.DataOutputStream os = hpCon.openDataOutputStream();
                byte postmsg[] = str.getBytes();
                for(i=0;i < postmsg.length;i++){
                    os.writeByte(postmsg[i]);
                }
                os.flush();
                
                int rc = hpCon.getResponseCode();
                if (rc != HttpConnection.HTTP_OK) {
                    throw new IOException("HTTP response code: " + rc);
                    
                }
                os.close();
                
                java.io.DataInputStream hpIs = hpCon.openDataInputStream();// .openInputStream();// .openInputStream();
                
                list1.deleteAll();
                char c;
                Vector movieStringList;
                movieStringList = new Vector();
                StringBuffer tempStr=new StringBuffer();
                boolean timeState=false;
                boolean uncertain=false;
                while ( hpIs.available()>0 ) 
                {
                    c=(char)hpIs.readByte();
  
                    if(c=='\r'&& ((char)hpIs.readByte())=='\n')
                    {
                        movieStringList.addElement(tempStr.toString());
                        tempStr=new StringBuffer();
                    }
                    else
                    {
                        tempStr.append(c);
                    }
                }
                if(tempStr.length()>0)
                {
                    movieStringList.addElement(tempStr.toString());
                    tempStr=new StringBuffer();
                }
 
                hpCon.close();
                hpIs.close();
                System.out.println("Closed Connection...");

                list1.append("The movie listings are: ",null);
                
                for(i=0; i<movieStringList.size();i++)
                {
                    list1.append(((String)movieStringList.elementAt(i)),null);
                }
                System.out.println("Appended to list...");
                connectionSuccess = true;
                this.notify();
                
            }
            catch(Exception ex){
                ex.getMessage();
            }
    }


    /** This method returns instance for getListings component and should be called instead of accessing getListings field directly.//GEN-BEGIN:MVDGetBegin8
     * @return Instance for getListings component
     */
    public Command get_getListings() {
        if (getListings == null) {//GEN-END:MVDGetBegin8
            // Insert pre-init code here
            getListings = new Command("Get Listings", Command.SCREEN, 1);//GEN-LINE:MVDGetInit8
            // Insert post-init code here
        }//GEN-BEGIN:MVDGetEnd8
        return getListings;
    }//GEN-END:MVDGetEnd8
 
    /** This method returns instance for backCommand1 component and should be called instead of accessing backCommand1 field directly.//GEN-BEGIN:MVDGetBegin15
     * @return Instance for backCommand1 component
     */
    public Command get_backCommand1() {
        if (backCommand1 == null) {//GEN-END:MVDGetBegin15
            // Insert pre-init code here
            backCommand1 = new Command("Back", Command.BACK, 1);//GEN-LINE:MVDGetInit15
            // Insert post-init code here
        }//GEN-BEGIN:MVDGetEnd15
        return backCommand1;
    }//GEN-END:MVDGetEnd15

    /** This method returns instance for waitScreen1 component and should be called instead of accessing waitScreen1 field directly.//GEN-BEGIN:MVDGetBegin20
     * @return Instance for waitScreen1 component
     */
    public org.netbeans.microedition.lcdui.WaitScreen get_waitScreen1() {
        if (waitScreen1 == null) {//GEN-END:MVDGetBegin20
            // Insert pre-init code here
            waitScreen1 = new org.netbeans.microedition.lcdui.WaitScreen(getDisplay());//GEN-BEGIN:MVDGetInit20
            waitScreen1.setText("Retrieving Listings...");
            waitScreen1.setNextDisplayable(get_list1());
            waitScreen1.setTask(get_simpleCancellableTask1());
            waitScreen1.setFailureDisplayable(get_splashScreen1());//GEN-END:MVDGetInit20
        }//GEN-BEGIN:MVDGetEnd20
        return waitScreen1;
    }//GEN-END:MVDGetEnd20

    /** This method returns instance for simpleCancellableTask1 component and should be called instead of accessing simpleCancellableTask1 field directly.//GEN-BEGIN:MVDGetBegin23
     * @return Instance for simpleCancellableTask1 component
     */
    public org.netbeans.microedition.util.SimpleCancellableTask get_simpleCancellableTask1() {
        if (simpleCancellableTask1 == null) {//GEN-END:MVDGetBegin23
            // Insert pre-init code here
            simpleCancellableTask1 = new org.netbeans.microedition.util.SimpleCancellableTask();//GEN-BEGIN:MVDGetInit23
            simpleCancellableTask1.setExecutable(new org.netbeans.microedition.util.Executable() {
                public void execute() throws Exception {
                    run();
                }
            });//GEN-END:MVDGetInit23
        }//GEN-BEGIN:MVDGetEnd23
        return simpleCancellableTask1;
    }//GEN-END:MVDGetEnd23

    /** This method returns instance for splashScreen1 component and should be called instead of accessing splashScreen1 field directly.//GEN-BEGIN:MVDGetBegin25
     * @return Instance for splashScreen1 component
     */
    public org.netbeans.microedition.lcdui.SplashScreen get_splashScreen1() {
        if (splashScreen1 == null) {//GEN-END:MVDGetBegin25
            // Insert pre-init code here
            splashScreen1 = new org.netbeans.microedition.lcdui.SplashScreen(getDisplay());//GEN-BEGIN:MVDGetInit25
            splashScreen1.setText("Unable to Retrieve Listings");
            splashScreen1.setNextDisplayable(get_helloForm());
            splashScreen1.setTimeout(4000);//GEN-END:MVDGetInit25

            
        }//GEN-BEGIN:MVDGetEnd25
        return splashScreen1;
    }//GEN-END:MVDGetEnd25
     
    public void startApp() {
        initialize();
    }
    
    public void pauseApp() {
    }
    
    public void destroyApp(boolean unconditional) {
    }
    
}
