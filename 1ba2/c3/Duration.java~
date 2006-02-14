class Duration {
	private int hours;  
	private int minutes;  

	public Duration(int hoursToSet, int minutesToSet) {
	  hours = hoursToSet;
	  minutes = minutesToSet;
	}

	//return the hours component of the Duration
	public int getHours() {
	 return hours;
	} 

	//return the minutes component of the Duration
	public int getMinutes() {
	 return minutes;
	} 

	//properly compute duration addition
	public void addDuration(Duration durationToAdd){
		hours += durationToAdd.getHours();
		minutes += durationToAdd.getMinutes();
		hours += minutes/60;
		minutes = minutes%60;
	}
}
