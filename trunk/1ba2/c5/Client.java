
class Client {
	private int sex; //0 -> female, 1 -> male
	private int height; //in cm
	private int shiftPattern; //0 -> night, 1 -> day, -1 -> unemployed
	boolean smokes; //true -> smoker, false -> non-smoker
	String postalDistrict;
	int age;

	public Client(int wsex,int wheight, int wshiftPattern, boolean wsmokes, String wpostalDistrict, int wage) {
		sex = wsex;
		height = wheight;
		shiftPattern = wshiftPattern;
		smokes = wsmokes;
		postalDistrict = wpostalDistrict;
		age = wage;
	}

	boolean isCompatible(Client otherPerson){
		if(sex == otherPerson.retSex())
			return false;
		Client male, female;
		//since the logical requirements are rather specific about sex ensure
		//we know which is male and which is female
		if(sex == 0){
			male = otherPerson;
			female = this;
		} else {
			male = this;
			female = otherPerson;
		}


		//requirement that if the male is under 26 the female is to be no more
		//than 1 year older than him
		if((male.retAge() < 26) && (female.retAge() > (male.retAge()+1)))
			return false;

		//height requirements
		if((male.retHeight() < female.retHeight()) || (male.retHeight() > (female.retHeight()+25)))
			return false;

		//work shift requirements
		if((male.retShiftPattern() > -1) && (female.retShiftPattern() > -1))
			if(male.retShiftPattern() != female.retShiftPattern())
				return false;

		//smoking requirements
		if(male.retSmokes() != female.retSmokes())
			return false;

		//Postal district requirements
		if( (male.retPostalDistrict()).equals(female.retPostalDistrict()) )
			return true;
		else
			return false;
	}

	public int retSex() {
		return sex;
	} 

	public int retHeight() {
		return height;
	} 

	public int retShiftPattern() {
		return shiftPattern;
	} 

	public boolean retSmokes() {
		return smokes;
	} 

	public String retPostalDistrict() {
		return postalDistrict;
	} 

	public int retAge() {
		return age;
	} 


}
