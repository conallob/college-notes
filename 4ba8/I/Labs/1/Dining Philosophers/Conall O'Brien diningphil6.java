// Dining Philosophers Sample
// Stephen.Barrett@cs.tcd.ie
// Copyright (c) 2005 Trinity College Dublin 

import network.*;
import network.TimerTask;
import java.awt.*;
import javax.swing.*;
import java.util.*;
import java.awt.Graphics;

public class MyNode extends Node implements GroupNode{

	Vector participants = new Vector();
	 int size = 0;
	 
   public MyNode(){
     define("left", new Boolean(false),false);
	 define("right", new Boolean(false),false);
	 define("eating", new Boolean(false),false);
	 define("missedlunch", new Boolean(false), false);
  }

    public void receiveMessage(Node sender, Message message) {

		if(message.isType("hungry"))
		{
			if(getBoolean("eating") || getBoolean("left") || getBoolean("right"))
			{
				abandonEating();
				// invoke cancel() on FinishEat, somehow...
		 		response.putString("fork", "NotTaken");
			}
				
		}
	   else if(message.isType("leftfork"))
		{
			Message response = new Message(sender, "response");
			if(getBoolean("left") || getBoolean("eating")) //&& getID() > getRight().getID()) //have it
		 	{
		 		response.putString("fork", "Taken");
		 	}else{ // don't have it
		 
		 		response.putString("fork", "NotTaken");
			}
			send(response);			
		}
		else if(message.isType("rightfork"))
		{
			Message response = new Message(sender, "response");
			if(getBoolean("right") || getBoolean("eating"))// && getID() > getLeft().getID()) //have it
		 	{
		 		response.putString("fork", "Taken");
		 	}else{ // don't have it
		 
		 		response.putString("fork", "NotTaken");
			}
			send(response); // send to all as test to get anything going
		}
		else if(message.isType("response"))
		{
			if(sender.equals(this.getRight())) // sender was to my right
			{
				if(message.getString("fork").compareTo("Taken") ==0)
				{
					abandonEating();
				}
				else
				{
					if(getBoolean("eating")) setBoolean("right", true);
				}
			}
			else
			{
				if(message.getString("fork").compareTo("Taken") ==0)
				{
					abandonEating();
					
				}
				else
				{
					if(getBoolean("eating")) setBoolean("left", true);
				}
			}
			if(getBoolean("left") == 0 && getBoolean("right") == 0)
			{
				Message msg1 = new Message(this.getRight(), "hungry");
				Message msg2 = new Message(this.getLeft(), "hungry");
				send(msg1);
				send(msg2);
			}
			if(getBoolean("left") && getBoolean("right"))
			{
				// pause to eat, then finish
				FinishEat e = new FinishEat();
				schedule(e, 20000);
			}
		}
	}
	
	public void abandonEating()
	{
		setBoolean("right", false);
		setBoolean("left", false);
		setBoolean("eating", false);
		setBoolean("missedlunch", true);
	}
	
		public class FinishEat extends TimerTask{
	 		public void run()
			{	
	
				//release forks
				setBoolean("eating", false);
				setBoolean("right", false);
				setBoolean("left", false);
				setBoolean("missedlunch", false);
			}
		}	
 

    public void run() {
        try
		{
			eat();	
		}
		catch(Exception e){}
    }
	
	private void eat()
	{
		// get the forks...
		setBoolean("eating", true);
		Message msgl = new Message(this.getRight(), "rightfork");
		Message msgr = new Message(this.getLeft(), "leftfork");
		send(msgl);
		send(msgr);
	}
	
	// these methods needed to be able to find node in chain to send message to
	
	//determine the previous node up from each node
	private Node getRight()
	{
		for (int i=0;i<participants.size();i++){
			//next node is one up from current node
			if (participants.get(i)==this){
				//if node is the last member in group
				//the next node is node 0
				if (i == 0){
					return participants.get(participants.size() - 1);
				}
				
				return participants.get(i-1);

			}
		}
		return null;
	}
	
		//determine the next node up from each node
	private Node getLeft()
	{
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
	
		

	//add a new node to the group
	  public void memberAdded(Node member){
		size = size+ 1;
		participants.add(member);
 	 }
 	 //remove member from group
 	 public void memberLeft(Node member)	{
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
