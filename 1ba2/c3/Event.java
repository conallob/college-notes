class Event {
	Time startTime;
	Duration eventDuration;

	public Event(Time startTimeToSet, Duration eventDurationToSet) {
		startTime = startTimeToSet;
		eventDuration = eventDurationToSet;
	}

	//return the a Time object representing the starting time of the object
	public Time getStartTime() {
	 return startTime;
	} 

	//return a Time object representing the ending time of the object
	public Time getFinishTime() {
		Time endTime = new Time(startTime.getHours(), startTime.getMinutes());
		endTime.addDuration(eventDuration);
		return endTime;
	} 

	//return a Duration object representing the duration of the event
	public Duration getDuration(){
		return eventDuration;
	}
}
