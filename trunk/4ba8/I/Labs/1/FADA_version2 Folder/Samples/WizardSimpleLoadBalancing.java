import network.*;
import java.awt.*;
import javax.swing.*;
import java.util.Vector;
import java.awt.Graphics;

/*
	This is example of how the code for the SimpleLoadBalancing algorithm would be organised if you chose the wizard
	to create the initial set up
	a simple slgorithm to determine the Node with the lowest load.
	on identifying this node send work to this node
	set their idleState to 0 which is busy
	on completion set idleState back to 1 which is idle
*/
public class MyNode extends Node{
	//image used to signify busy state
	Image busyImage = loadImage("addNodeBusyGraphic");
	/*
		Associated with each node are 2 variables
		an idleState variable which is initially set to 1 (1 = idle, 0= busy)
		a probed variable, a boolean variable to indicate whether the node has been probed or not
	*/
	public MyNode(){
		define("idleState", new Integer(1),false);
		define("probed", new Boolean(true),false);
	}

	//on receiving a msg a node replies 
	public void receiveMessage(Node sender, Message message){
		//if the node has received a probe msg return either an underloaded or overloaded msg to the sender
		if (message.isType("probe")){
			handleprobe(sender);
		}
		//if the node receives an overloaded msg do nothing
		else if (message.isType("overloaded")){
			handleoverloaded(sender);
		}
		//if the node receives a dowork msg, set the state of node to busy,
		//change it image to busy
		//and leave to run for 20 seconds
		//if queried during the interval send out an overloaded msg
		//on completion return to underloaded state
		else if (message.isType("doWork")){
			handledoWork(sender);
		}
		//if receive an underloaded msg, send back a dowork msg to sender 
		else if (message.isType("underLoaded")){
			handleunderLoaded(sender);
		}

	}

	public void handleprobe(Node sender){
		Message newMessage;
		// determine the value of the nodes state variable, is it busy or idle
		switch(getInt("idleState")){
		//if busy, send back a message to the sender to say node is overloaded
			case 0:
				newMessage=new Message(sender,"overloaded");
				send(newMessage);
				break;
			//if idle, send back a message to the sender to say node is underloaded
			case 1:
				newMessage=new Message(sender,"underLoaded");
				send(newMessage);
				break;
		}           

	}
	//If receive an overloaded msg do nothing
	public void handleoverloaded(Node sender){}

		//if receive a doWork msg determine node's state
		//if busy return overloaded msg
		//if idle, do work for 20 secs, change node image to busy
		public void handledoWork(Node sender){
			switch(getInt("idleState")){
				case 0:
					newMessage=new Message(sender,"overloaded");
					send(newMessage);
					break;
				case 1:
					setInt("idleState",0);
					setImage(busyImage);
					schedule(new DoWork(),0);
					break;
			}

		}


		//if received an underloaded msg
		//return a message to the sender to doWork
		//set probed to false
		public void handleunderLoaded(Node sender){
			if(getBoolean("probed")){
				Message newMessage;
				newMessage=new Message(sender,"doWork");
				send(newMessage);
				setBoolean("probed",false);
			}
		}
	//start msg sequence
	public void run(){
		//send off all members of the network a probe msg
		//set probed to true
		Message newMessage=new Message("probe");
		setBoolean("probed",true);
		sendToAll(newMessage);
	}
	//do work for 20 secs
	//upon completion return node image to default node image provided by framework
	public class DoWork extends TimerTask{
		public void run(){
			try{
				Thread.sleep(20000);
			}catch(Exception e){}
				setInt("idleState",1);
				//return image to default node image provided by framework
				setImage(Node.nodeImg);
		}
	}
}
