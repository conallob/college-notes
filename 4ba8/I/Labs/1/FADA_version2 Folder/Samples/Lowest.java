import network.*;
import java.util.Vector;
import java.util.HashMap;
import java.util.Iterator;
import java.awt.Graphics;
import java.awt.*;
import javax.swing.*;

/* 
	Implementation of the load sharing algorithm: Lowest
   A fixed number of nodes are polled and the most lightly loaded node is selected.
   A node sends out a msg asking all other members of the network to tell it the current value of their load.
   In response to this msg, each node within the network responds with a new msg stating the value of it's load.
   On receiving each msg, the value of the sending node's load is extracted and placed in a HashMap.
   A HashMap is used to match a node's load value to it's id.
   When all members have responded to the initial request, the HashMap is examined 
   to determine the node with the lowest load.
   If this node does not match the requesting node, a message is sent out to the node with the lowest load to do the work
   otherwise the work is done locally by the requesting node
*/
public class MyNode extends Node implements GroupNode{
    //image used to show that a node is working
    //Image busyImage = loadImage("addNodeBusyGraphic");
	public static Image busyImage=new ImageIcon(Node.class.getResource("images/addNodeBusyGraphic.gif")).getImage();
	
	//use of a hashMap to match a node's load value with it's id
    HashMap loadMap= new HashMap();
    int load;
	int size=0;
	int lowLoad =0;
	
	/*	
		Associated with each node is a variable "load"
		load is initially set to the node's id
		load is editable by the user
	*/
    public MyNode() {
		define("load",new Integer(getID()),true);
    }

	/*defines how a node responds to certain messages*/
    public void receiveMessage(Node sender, Message message) {
		Message newMessage;
		if (message.isType("what is your load?")){
			newMessage = new Message(sender,"My load is");
			newMessage.put("load",get("load"));
			send(newMessage);

		}else if (message.isType("My load is")){
			load = message.getInt("load");
			loadMap.put(sender,new Integer(load));
			if(loadMap.size()== size-1){
				Node worker=this;
				lowLoad=getInt("load");
				Iterator iterator=loadMap.keySet().iterator();
				while(iterator.hasNext()){
					Node key=(Node)iterator.next();
					int current=((Integer)loadMap.get(key)).intValue();
					if(current<lowLoad){	
						lowLoad=current;
						worker=key;
					}
				}
				if (worker==this){
					 newMessage = new Message(worker,"Do work");
					 receiveMessage(this,newMessage);
				}
				else{
					//do something
					newMessage = new Message(worker,"Do work");
					send(newMessage);
				}
			}

		}else if (message.isType("Do work")){
					setImage(busyImage);
					setInt("load",getInt("load") + 10);
					schedule(new DoWork(),0);
		}
    }
    public void run() {
		Message newMessage = new Message("what is your load?");
		sendToGroup(newMessage);
		loadMap.clear();
    }


	public void memberAdded(Node member){
		size++;
	}

    public void memberLeft(Node member){
		size--;
	}


    public void joinGroup(Node[] nodes){
		this.size=nodes.length;
	}

	
    public class DoWork extends TimerTask{
	public void run(){
	    try{
			Thread.sleep(15000);
	    }catch(Exception e){}
	    setImage(Node.nodeImg);
		setInt("load",getInt("load")-10);
		}
    }
}
