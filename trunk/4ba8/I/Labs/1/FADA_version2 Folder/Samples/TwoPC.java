import network.*;
import java.awt.*;
import javax.swing.*;
import java.util.HashMap;
import java.awt.Graphics;
import java.util.Iterator;
/*
	Implementation of the two phase commit algorithm
	In the two phase commit algorithm one node acts as a central coordinator
	In phase 1 
	The coordinator sends out a "Prepare to commit" message to all remaining nodes within the group
	On receipt of a "Prepare to commit" message, all nodes reply "yes" or "no"
	IF one node replies "no" then coordinator sends out an "abort" message
	All nodes reply to "abort" message with a "done" message
	if a node fails to respond with a "done" message the "abort" is sent again by the coordinator until the node replies
	If all nodes send back a "yes" message then the coordinator responds with a "commit" message
	This leads to phase 2 of the transaction
	In phase 2 
	On receipt of a "commit" message, all nodes respond with a "done" message
	If one node fails to reply with a "done" message, the coordinator sends out the "commit" again until the 
	node replies with a done.
	timeouts are used by the coordinator to determine if all nodes have replied to its messages
	
*/
public class TwoPC extends Node implements GroupNode{
	
	//public static Image agreeImage=new ImageIcon(Node.class.getResource("images/agree.gif")).getImage();
	//public static Image disagreeImage=new ImageIcon(Node.class.getResource("images/disagree.gif")).getImage();
	//public static Image undecidedImage=new ImageIcon(Node.class.getResource("images/undecided.gif")).getImage();
   Image agreeImage = loadImage("agree");
   Image disagreeImage = loadImage("disagree");
   Image undecidedImage = loadImage("undecided");

   //state variable responses
   static final int NO=1;
   static final int YES =0;
   //algorithm split into phases
   int phase =0;
   //associate each node with the response it returns
   HashMap hashMap = new HashMap();
   
   //separate timer thread to see if receive all replies to prepare msg
   PrepareChecker prepChecker = null;
   //separate timer thread to see if receive all done replies
   DoneChecker doneChecker =null;
   
   //transaction result abort or done
   String result= "";
   Image resultImage = null;
	
 
    
   public TwoPC(){
	 //setting editable variable
	 String responseStates[]={"YES", "NO"};
	 define("response", new Integer(YES), true, responseStates);
	 //set node image to default node image provided by framework
	 setImage(Node.nodeImg);
   }

    public void receiveMessage(Node sender, Message message) {
        if (message.isType("Prepare to commit?")){
			switch (getInt("response")){
			case YES:
				newMessage = new Message(sender,"yes");
				setImage(agreeImage);
				send(newMessage);
				setImage(undecidedImage);
			break;
			case NO:
				newMessage = new Message(sender,"no");
				setImage(disagreeImage);
				send(newMessage);
				setImage(undecidedImage);
			break;
			}
		}else if (message.isType("yes")){
			hashMap.put(sender,"yes");
			checkResponse();
		}else if (message.isType("no")){
			//send abort msg in response to first no msg received.
			if (phase==1){
				goToPhaseTwo("abort");
			}
		}else if (message.isType("abort")){
			Message newMessage= new Message(sender,"done");
			send(newMessage);
			setImage(disagreeImage);
		}else if (message.isType("commit")){
			Message newMessage= new Message(sender,"done");
			send(newMessage);
			setImage(agreeImage);
		}else if (message.isType("done")){
			hashMap.put(sender,"done");
			checkDone();
		}
    }

	public void memberAdded(Node member){
		hashMap.put(member,new String(""));
	}
	public void memberLeft(Node member){
		hashMap.remove(member);
	}
	public void joinGroup(Node[] nodes){
		//group set up
		for (int i=0;i<nodes.length;i++ ){
			if (nodes[i]!=this){
				hashMap.put(nodes[i],new String(""));
			}
		}
	}

    public void run() {
        if (phase ==0){
			goToPhaseOne();
        }
    }

	public void goToPhaseOne(){
		Message newMessage = new Message("Prepare to commit?");
		sendToGroup(newMessage);	
		setImage(undecidedImage);
		phase=1;
		hashMap.put(this,"yes");
		prepChecker = new PrepareChecker();
		schedule(prepChecker,20000);
	}
	
	public void goToPhaseTwo(String reply){
		if (reply.equals("abort"))
		{
			resultImage = disagreeImage;
		}else{
			resultImage = agreeImage;
		}
		Message newMessage = new Message(reply);
		sendToGroup(newMessage);
		phase=2;
		result=reply;
		doneChecker = new DoneChecker();
		schedule(doneChecker,20000);
		Iterator iterator = hashMap.keySet().iterator();
		while (iterator.hasNext()){
			Node key=(Node)iterator.next();
			hashMap.put(key,"");
		}
		hashMap.put(this,"done");
		//Prepare to commit msg finished so cancel timer associated with it
		cancel(prepChecker);
	}

	public void goBackToPhaseZero(){
		phase=0;
		iterator = hashMap.keySet().iterator();
		while (iterator.hasNext()){
			Node key=(Node)iterator.next();
			hashMap.put(key,"");
		}
		result ="";
		setImage(resultImage);
		cancel(doneChecker);
	}

	public class PrepareChecker extends TimerTask{
		public void run(){
			if (phase == 1){
				Iterator iterator= hashMap.keySet().iterator();
				int yescount=0;
				int nocount=0;
				while (iterator.hasNext()){
					Node key=(Node)iterator.next();
					String reply=((String)hashMap.get(key));
					if (reply.equals("yes")){
						yescount++;
					}else if (reply.equals("no")){
						nocount++;
					}

				}
				//no agreement then send off abort msg, 
				//clear hashMap to make way "done" rsponse
				if (yescount+nocount<hashMap.size()){
					goToPhaseTwo("abort");
				}
			}
		}
	}

	public class DoneChecker extends TimerTask{
		public void run(){
			if (phase==2){
				Iterator iterator = hashMap.keySet().iterator();
				int donecount=0;
				while (iterator.hasNext()){
					Node key =(Node)iterator.next();
					String reply=((String)hashMap.get(key));
					if (reply.equals("done")){
						donecount++;
					}else{
						//send out previous message til receive a done response
						Message msg = new Message(key,result);
						setImage(undecidedImage);
						send(msg);
					}
				}
				if (donecount==hashMap.size()){
					setImage(agreeImage);
					goBackToPhaseZero();
				}else {
					//keep running til receive all done responses
					doneChecker = new DoneChecker();
					schedule(doneChecker,20000);
				}
			}
		}
	
	}
	//check responses so can clear hashMap to receive done replies
	public void checkResponse(){
		Iterator iterator = hashMap.keySet().iterator();
		int yescount=0;
		int nocount=0;
		while (iterator.hasNext()){
			Node key =(Node)iterator.next();
			String reply=((String)hashMap.get(key));
			if (reply.equals("yes")){
				yescount++;
			}else if (reply.equals("no")){
				nocount++;
			}
		}
		if (yescount==hashMap.size()){
			goToPhaseTwo("commit");
		}
	}

	// check done msg so can reset hashmap to initial state, blank entry beside each node 
	public void checkDone(){
		Iterator iterator = hashMap.keySet().iterator();
		int donecount=0;
		while (iterator.hasNext()){
			Node key =(Node)iterator.next();
			String reply=((String)hashMap.get(key));
			if (reply.equals("done")){
				donecount++;
			}
		}
		if (donecount==hashMap.size()){
			goBackToPhaseZero();
		}
	}

}
