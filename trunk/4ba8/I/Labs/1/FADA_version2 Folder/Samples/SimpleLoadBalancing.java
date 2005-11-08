import network.*;
import java.util.Vector;
import java.awt.Graphics;
import java.awt.*;
import javax.swing.*;

/*
	A simple slgorithm to determine the node with the lowest load.
	on identifying this node, send work to this node
	set their state to busy
	on completion of work set their state back to idle
*/

public class MyNode extends Node {
    //state variables to indicate whether a node is busy or idle
    static final int BUSY=0;
    static final int IDLE=1;
	//busy node image
	Image busyImage = loadImage("addNodeBusyGraphic");

    /*
		Associated with each node are 2 variables
		an idleState variable which is initially set to 1 (1 = IDLE, 0=BUSY)
		the state of the variable can be seen at run time by the user as either "BUSY" or "IDLE" 
		a probed variable, a boolean variable which indicates whether the node has been probed or not
	*/
    public MyNode(){
		String idleStates[]={"BUSY","IDLE"};
		define("idleState",new Integer(IDLE),false,idleStates);
		define("probed",new Boolean(true));
    }
    //This method defines how a node replies when it receives any of the following msg: 
	//OverLoaded, UnderLoaded, Probe, doWork
    public void receiveMessage(Node sender, Message message){
		Message newMessage;
		//if receives a probe msg, determine value of idleState variable
		if(message.isType("Probe") && this!=sender){
			switch(getInt("idleState")){
			// if busy, send back an overloaded msg
			case BUSY:
				newMessage=new Message(sender,"OverLoaded");
				send(newMessage);
				break;
			//if idle, send back an underloaded msg
			case IDLE:
				newMessage=new Message(sender,"UnderLoaded");
				send(newMessage);
				break;
			}
		//if receives an overloaded msg, ignore
		}else if(message.isType("OverLoaded")){
		//if receives a underloaded msg, send back a doWork msg
		//set probed to false
		}else if(message.isType("UnderLoaded")&&getBoolean("probed")){
			newMessage=new Message(sender,"DoWork");
			send(newMessage);
			setBoolean("probed",false);
		//if receives a doWork msg, determine which idleState node is in busy/idle
		}else if(message.isType("DoWork")){
			switch(getInt("idleState")){
			//if busy send back an overloaded msg
			case BUSY:
				newMessage=new Message(sender,"OverLoaded");
				send(newMessage);
				break;
			//if idle, change node image to busy, doWork for 20secs
			case IDLE:
				setInt("idleState",BUSY);
				setImage(busyImage);
				schedule(new DoWork(),0);
				break;
			}
		}
    }


    public void run(){
		Message newMessage=new Message("Probe");
		setBoolean("probed",true);
		sendToAll(newMessage);
    }

	//simulate work stage
    public class DoWork extends TimerTask{
		public void run(){
			try{
				Thread.sleep(20000);
			}catch(Exception e){}
				setInt("idleState",IDLE);
				//return node image to default framework image
				setImage(Node.nodeImg);
				
		}
    }
}
