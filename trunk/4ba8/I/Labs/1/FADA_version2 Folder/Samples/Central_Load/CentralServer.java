import network.*;
import java.util.Vector;
import java.util.HashMap;
import java.util.Iterator;
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
	Below is the implementation of the server side
*/
public class MyNode extends Node implements ServerNode{
	//HashMap is used to associate with each node the value of it's load
	HashMap loadMap= new HashMap();
	int load, newLoad;
	Node server;
	Node worker;
	
	/*	Associated with a server is a timer
		The timer is triggered every 20 sec and runs for 20 secs
		The timer enables a server to periodically send out requests for the clients' loads
	*/
	public MyNode(){
		schedule(new DoWork(),20000, 20000);
		server=this;
		
	}

    public void receiveMessage(Node sender, Message message) {
		if (message.isType("Request Node") && this!=sender){
			set("Node "+ sender.getID(),message.get("My load"));
			load = message.getInt("My load");
			synchronized(loadMap){
				loadMap.put(sender,new Integer(load));
				//if 2 or more clients present, loops through loadMap to decipher node with lowest load
				if(loadMap.size()>=2){
					worker=sender;
					Iterator iterator=loadMap.keySet().iterator();
					while(iterator.hasNext()){
						Node key=(Node)iterator.next();
						int current=((Integer)loadMap.get(key)).intValue();
						if(current<load){
							load=current;
							worker=key;	
						 }

					}
				}
				//server must return a msg back to client telling it the name of the node with lowest load
				//server updates destination node's load by 1
				if (this!=sender){
					Message sendtoMessage = new Message(sender,"Send work to:");
					sendtoMessage.put("WorkerID",worker);
					sendToClient(sendtoMessage);
					 newLoad=load;
					 //increment load by 1
					 newLoad++;
					 //record new load and store in loadMap
					loadMap.put(worker,new Integer(newLoad));
					set("Node "+ worker.getID(),new Integer(newLoad));
				}

			}
		}
		//if a server receives a message "My load is".
		//it updates the clients load in the loadMap with the new value sent
		else if (message.isType("My load is") && this!=sender){
			set("Node "+ sender.getID(),message.get("My load"));
			load = message.getInt("My load");
			synchronized(loadMap){
				loadMap.put(sender,new Integer(load));
			}
		}
	}

    /*	A server must register each client and their load 
		A client's load is initially set to 0
		signifying unknown
	*/
	public void registerClient(Node client){
	   define("Node "+ client.getID(),new Integer(0));
	   synchronized(loadMap){
			loadMap.put(client,new Integer(0));
	   }
	   
	} 
	
    public void run(){}
	
	/*The timer enables a server to ask its clients for their loads at certain intervals*/
	public class DoWork extends TimerTask{
		public void run(){
		   Message newMessage = new Message("What is your load?");
		   sendToAllClients(newMessage);
		}
	}

}
