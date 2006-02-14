import network.*;
import java.util.HashMap;
import java.util.Iterator;
import java.awt.*;
import javax.swing.*;
import java.awt.Graphics;
import java.util.Vector;

/* 
	Implememtation of the load sharing algorithm: Threshold
   In Threshold a number of nodes are polled for their load values.
   A job is trabsferred to the first node whose load is below threshold t. 
   If no such node is found, the job is processed locally
   Implementation specifics:
   A node sends out a msg asking all other members of the network to tell it the current value of their loads.
   In response to this msg, each node within the network responds with a new msg stating the current value of it's load.
   On receiving each msg, the requesting node checks to determine whether the value of the sending node's load is less
   than the value of threshold.
   If it is, it sends back a new message to the sending node telling it to do work 
   If no node is found with a load less than the value of threshold, the requesting node does the work locally
 */
public class Threshold extends Node implements GroupNode{
   static final int BUSY=0;
   static final int IDLE=1;
   public static Image busyImage=new ImageIcon(Node.class.getResource("images/addNodeBusyGraphic.gif")).getImage();
    
  
  int size =0;
  int load =0;
  int newLoad;
  HashMap loadMap = new HashMap();
  
  boolean found = false;
  
  /* Associated with each node are 3 variables:
	 "load", "Threshold" and "idleState"
	 load indicates the value of a node's current load
	 load is initially set to the node's id
	 load is editable by the user
	 Threshold has an intially value of 10 but is editable by the user
	 idleState is used to indicate whether a node is working or not.
	 It has too values IDLE or BUSY
	 it is initially set to IDLE, indicating not working
  */
  public Threshold(){
    define("Load", new Integer(getID()),true);
	define("Threshold", new Integer(10), true);
	String idleStates[]={"BUSY","IDLE"};
	define("idleState",new Integer(IDLE),false,idleStates);
  }

  public void receiveMessage(Node sender, Message message){
	  Message newMessage;
    if (message.isType("what_is_your_load")){
		setInt("Threshold", message.getInt("threshold"));
		newMessage = new Message(sender,"My load is");
		newMessage.putInt("My Load", getInt("Load"));
		send(newMessage);
    }else if (message.isType("My load is")){
		load = message.getInt("My Load");
		int threshold=getInt("Threshold");
		if (!found){
			if (load< threshold){
				found = true;
				newMessage = new Message(sender,"Do work");
				send(newMessage);
			}else{
				synchronized(loadMap){
					//matching sender with their respective loads
					loadMap.put(sender,new Integer(load));
					if(loadMap.size()== size-1){
						//no node found with load value less than threshold 
						//therefore does work itself 
						newMessage = new Message(this,"Do work");
						receiveMessage(this,newMessage);
					}
				}
			}
		
		}
		
	
	}else if (message.isType("Do work")){
			setInt("idleState",BUSY);
			setImage(busyImage);
			newLoad = this.getID() + 10;
			setInt("Load", newLoad);
			schedule(new DoWork(),0);
		
	}
	
	
 }
  

  public void memberAdded(Node member){
	size++;
  }

  public void memberLeft(Node member){
	size--;
  }

  public void joinGroup(Node[] nodes){
	this.size = nodes.length;
  }

  public void run(){
	  Message newMessage = new Message("what_is_your_load");
	  //in newMessage assign the value of Threshold variable to threshold
	  newMessage.putInt("threshold", getInt("Threshold"));
	  sendToGroup(newMessage);
	  loadMap.clear();
	  found=false;
  }


 public class DoWork extends TimerTask{
   public void run(){
		try{
			Thread.sleep(20000);
		}catch(Exception e){}
		setInt("idleState",IDLE);
		//return image to default node image in framework 
		setImage(Node.nodeImg);
		setInt("Load", newLoad-10);
	}
 }
}
