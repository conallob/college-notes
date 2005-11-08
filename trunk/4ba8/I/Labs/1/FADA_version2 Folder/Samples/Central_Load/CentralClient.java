import network.*;
import java.awt.Graphics;
import java.awt.*;
import javax.swing.*;

/*	Implementation of the load sharing algorithm: CENTRAL.
	This algorithm decides at run time where to assign a task. 
	It assigns a task to a node with the lowest load.
	In this algorithm, one node is designated as a centralised point of storage.
	This node is called a server.
	It periodically receives load information from other nodes, called clients, within the network.
	When a client decides that a task is eligible for load sharing:  
		It sends a request to the server for the node with the lowest load. 
		It also sends the current value of its load. 
	When the server receives a request from a client for the name of the node 
	with the lowest load, it responds by first extracting from the request the current value of the client's load 
	and storing it within the HashMap.
	The HashMap allows one to match a node's load to it's id.
	It then checks the HashMap for the name of the node with the lowest load and sends this information out to the client
	in a new message.
	The server then increments the lowest loaded node's load by 1.
	On receiving the name of the node with the lowest load, the client sends out a new message to it telling it to do the task
	Below is the implementation of the client side
*/
public class MyNode extends Node{
	
	
	public static Image busyImage=new ImageIcon(Node.class.getResource("images/addNodeBusyGraphic.gif")).getImage();

	public MyNode(){
		define("load",new Integer(getID()),true);
	}

    public void receiveMessage(Node sender, Message message){
		if (message.isType("Send work to:")){
			Node worker =message.get("WorkerID");
			//send doWork message to node designated by server
			if (worker !=this){
				Message doWork = new Message(worker,"Do work");
			    send(doWork);
			}
			else{
				int newLoad = getInt("load");
				setInt("load",newLoad+1);
				setImage(busyImage);
				schedule(new DoWork(),0);
			}
		}
		else if (message.isType("What is your load?")){
			Message m = new Message(sender,"My load is");
			m.put("My load",get("load"));
		    sendToServer(m);  
		}else if (message.isType("Do work")){
			int newLoad = getInt("load");
			setInt("load",newLoad+1);
			setImage(busyImage);
		    schedule(new DoWork(),0);
		}
    }

    public void run() {
		Message m = new Message("Request Node");
		m.put("My load",get("load"));
	    sendToServer(m);
	}


	public class DoWork extends TimerTask{
		public void run(){
			try{
			Thread.sleep(20000);
			}catch(Exception e){}
			setImage(Node.nodeImg);
		}
    }
   
}
