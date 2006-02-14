import network.*;
import java.awt.*;
import javax.swing.*;
import java.util.*;
import java.awt.Graphics;

/**
	Partial implementation of the token ring algorithm
*/

public class TokenRing extends Node implements GroupNode{
	int size = 0;
	static final int NO=0;
	static final int YES =1;
	String responseStates[]={"NO", "YES"};

	static final int ON=0;
	static final int OFF=1;
	String nodeResponse[]={"ON", "OFF"};

	HashMap hashMap = new HashMap();
	Vector participants = new Vector();
	boolean messagesent = false;

	int monitorBit = 0;
	
	public static Image monitorImage=new ImageIcon(Node.class.getResource("images/monitor.gif")).getImage();
	public static Image OffImage = new ImageIcon(Node.class.getResource("images/addNodeGraphic_fail.gif")).getImage();
	public static Image OnImage = new ImageIcon(Node.class.getResource("images/addNodeGraphic.gif")).getImage();

	
  public TokenRing(){
	  define("Message to send", new Integer(NO),true, responseStates);
	  define("Receiver", new Integer(0),true);
	  define("Monitor", new Boolean(false),false);
	  define("Node", new Integer(ON),true,nodeResponse);  
  }

  public void receiveMessage(Node sender, Message message){
		Message newMessage;
		switch(getInt("Node")){
				//node is up
				case ON:
					setImage(OnImage);
					if (message.getInt("monitor")==this.getID()){
						setImage(monitorImage);
						if(monitorReceiveMessage(sender,message)){
							return;
						}
					}
					//the message you receive is a token
					if (message.isType("Token")){
						switch(getInt("Message to send")){
								case YES:
										//To send a packet, create it and place inside it
										//the number of node you wish to receive it
										//monitor ID and the message
										newMessage = new Message(getNext(),"Packet");
										int index = getInt("Receiver")-1;
										if (index>=0 && index<participants.size()){
											newMessage.put("receiver",participants.get(getInt("Receiver")-1));
										}else{
											//type in wrong no
											newMessage.put("receiver",getNext());
											setInt("Receiver", getNext().getID());
										}
										setBoolean("Monitor",false);
										//sending node is monitor so set monitor bit to 1
										newMessage.putInt("monitor", message.getInt("monitor"));
										if (message.getInt("monitor")==this.getID()){
											newMessage.putInt("MBit",1);
										}else{
											newMessage.putInt("MBit",message.getInt("MBit"));
										}
										newMessage.putString("message","blah");
										send(newMessage);
										messagesent=true;
								break;
								case NO:
									//if you do not want to send a message
									//forward token message to next node
									forwardMessage(message);
								break;
							}
						//the message you receive is a packet
					}else if (message.isType("Packet")){
							//if you are the receiver of the packet
							//empty the packet of its contents
							//send packet to next node
							//if you also the monitor set MBit to 1
							if (message.get("receiver")== this){
								newMessage = new Message(getNext(),"Packet");
								if (message.getInt("monitor")==this.getID() && monitorBit!=1){
									monitorBit=1;
									setBoolean("Monitor",true);
									newMessage.putInt("monitor", message.getInt("monitor"));
									newMessage.putInt("MBit",monitorBit);
									newMessage.put("receiver",message.get("receiver"));
									newMessage.putString("message","");
									send(newMessage);
								}else{
									setBoolean("Monitor",false);
									newMessage.putInt("monitor", message.getInt("monitor"));
									newMessage.putInt("MBit",message.getInt("MBit"));
									newMessage.put("receiver",message.get("receiver"));
									newMessage.putString("message","");
									send(newMessage);
								}
							}else{
								//if you are the sender of the packet
								//and packet has been read
								//release token (by creating a new token message)
								//and send it to next node up
								//set messagesent to false to denote that you are no longer the sender
								if (messagesent && (message.getString("message").equals(""))){
									newMessage = new Message(getNext(), "Token");
									monitorBit=0;
									setBoolean("Monitor",false);
									newMessage.putInt("monitor", message.getInt("monitor"));
									newMessage.putInt("MBit",monitorBit);
									send(newMessage);
									messagesent = false;
								//if you are the sender of the packet and the message has not been read, resend the message
								}else if (messagesent && (!message.getString("message").equals(""))){
									newMessage = new Message(getNext(), "Packet");								
									if (message.getInt("monitor")==this.getID()){
										monitorBit=1;
										setBoolean("Monitor",true);
									}else{
										setBoolean("Monitor",false);
									}
									newMessage.put("receiver",message.get("receiver"));
									//puts the word "blah" in message contents
									newMessage.putString("message",message.getString("message"));
									newMessage.putInt("monitor", message.getInt("monitor"));
									newMessage.putInt("MBit",monitorBit);
									send(newMessage);
								}else{
									//if you are the monitor set MBit to 1 and send message on else if 
									//ignore packet and
									//forward it to the next node up
									if (message.getInt("monitor")==this.getID()){
										newMessage = new Message(getNext(), message.getMessageType());
										setBoolean("Monitor",true);
										//token passes monitor so set monitor bit to 1
										newMessage.putInt("monitor", message.getInt("monitor"));
										newMessage.putInt("MBit",1);
										newMessage.put("receiver",message.get("receiver"));
										newMessage.putString("message",message.getString("message"));
										send(newMessage);
									}else{
										forwardMessage(message);
									}
									
								}
						}
					
				}
				break;
				case OFF:
					setImage(OffImage);
					forwardMessage(message);
				break;
		}
		

	}

	//determine the next node up from each node
	private Node getNext(){
		for (int i=0;i<participants.size();i++){
			//next node is one up from current node
			if (participants.get(i)==this){
				//if node is the last member in group
				//the next node is node 0
				if (participants.size()-1==i){
					return participants.get(0);
				}
				
				return participants.get(i+1);

			}
		}
		return null;
	}

	private void forwardMessage(Message original){
		Message newMessage = new Message(getNext(), original.getMessageType());
		if (original.getInt("monitor")==this.getID()){
			setBoolean("Monitor",true);
		}else{
			setBoolean("Monitor",false);
		}
		newMessage.putInt("monitor", original.getInt("monitor"));
		newMessage.putInt("MBit",original.getInt("MBit"));
		if(original.isType("Packet")){
			newMessage.put("receiver",original.get("receiver"));
			newMessage.putString("message",original.getString("message"));
		}
		send(newMessage);
	}

     public boolean monitorReceiveMessage(Node sender, Message message){
		 //packet passes monitor with MBit still set to 1, endlessly circulating packet,
		 //release the token
		if(message.isType("Packet") && message.getInt("MBit")==1 && !messagesent){
			//releases new Token
			Message newMsg;
			newMsg = new Message(getNext(),"Token");
			setBoolean("Monitor",true);
			newMsg.putInt("monitor", message.getInt("monitor"));
			newMsg.putInt("MBit",monitorBit);
			send(newMsg);
			return true;
		}else{
			return false;
		}
	 }




  //create a token message and send it to the next member up in the group
  //monitor bit is 0
  public void run(){
  	Message newMsg;
    newMsg = new Message(getNext(),"Token");
	setBoolean("Monitor",false);
	newMsg.putInt("monitor", participants.size());
	newMsg.putInt("MBit",monitorBit);
	send(newMsg);
  }


  //add a new node to the group
  public void memberAdded(Node member){
	size = size+ 1;
	participants.add(member);
  }
  //remove member from group
  public void memberLeft(Node member){
	size = size- 1;
	participants.remove(member);
  }
  //keep account of what members are in the group and group size
  public void joinGroup(Node[] nodes){
	this.size = nodes.length;
	for (int i=0;i<nodes.length;i++ ){
		participants.add(nodes[i]);
	}
	
  }
	

	

}
