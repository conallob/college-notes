class Time {
	private int hours;  
	private int minutes;  

	public Time(int hoursToSet, int minutesToSet) {
	  hours = hoursToSet;
	  minutes = minutesToSet;
	}


	//return the hours component of the Time object
	public int getHours() {
	 return hours;
	} 

	//return the minutes component of the Time object
	public int getMinutes() {
	 return minutes;
	} 

	//Add a duration properly to the time
	public void addDuration(Duration durationToAdd){
		hours += durationToAdd.getHours();
		minutes += durationToAdd.getMinutes();
		hours += minutes/60;
		minutes = minutes%60;
		hours = hours%24;
	}
}
