
class Light {
	public static final int OFF = 0;
	public static final int DIMMED = 1;
	public static final int ON = 2;

	private int state;

	public Light() {
		state = 0;
	}


	public Light(int ws) {
		if(ws < 0 || ws > 2)
			state = 0;
		state = ws;
	}

	public void setState(int ws){
		if(ws < 0 || ws > 2)
			return;
		state = ws;
	}

	public int getState(){ return state; }
}
