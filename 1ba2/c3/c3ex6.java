import tcdIO.*; 

class c3ex6 {
	public static void main (String args[]) {
		Terminal terminal;
		int tmpHours, tmpMinutes;
		Time startTime;
		Duration eventDuration;
		Event event;

		terminal = new Terminal("Chapter 3: Exercise 6");

		//Input the details of the start time
		tmpHours = terminal.readInt("Please input the start hours of the event: ");
		tmpMinutes = terminal.readInt("Please input the start minutes of the event: ");

		//Create a Time object represting the starting time
		startTime = new Time(tmpHours, tmpMinutes);

		//Input the details of the event's duration
		tmpHours = terminal.readInt("Please input the hours the event lasts: ");
		tmpMinutes = terminal.readInt("Please input the minutes the event lasts: ");

		//Create a duration object representing the event's duration
		eventDuration = new Duration(tmpHours, tmpMinutes);

		//Create an event object with the two previously created objects
		event = new Event(startTime, eventDuration);

		//Output the answer
		terminal.println("The time the event will finish at is: " + event.getFinishTime().getHours() + ":" + event.getFinishTime().getMinutes());


 }
}   
