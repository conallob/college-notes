/*A class whose instances represent people*/
class Person {
  	private String hairColour;  
  	private String eyeColour;  
  	private String gender;  
  	private String address;  
  	private String occupation;  
  	private String name;  
  	private int age;
  	private float height;
  	private int shoeSize;
  	private Person spouse;

  	public Person(String hairColourToSet, String eyeColourToSet, String genderToSet, String addressToSet, String occupationToSet, String nameToSet, int ageToSet, float heightToSet, int shoeSizeToSet, Person spouseToSet) {
	hairColour = hairColourToSet;  
  	eyeColour = eyeColourToSet;  
  	gender = genderToSet;  
  	address = addressToSet;  
  	occupation = occupationToSet;  
  	name = nameToSet;  
  	age = ageToSet;
  	height = heightToSet;
  	shoeSize = shoeSizeToSet;
  	spouse = spouseToSet;

  	}

	//return the hair colour
	public String getHairColour(){
	  return hairColour;
	}

	//change the hair colour
	public void DyeHairColour(String newHairColour){
		hairColour = newHairColour;
	}

	//return the eye colour
	public String getEyeColour(){
	  return eyeColour;
	}

	//return the gender
	public String getGender(){
	  return gender;
	}

	//return the address
	public String getAddress(){
	  return address;
	}

	//change address
	public void moveHouse(String newAddress){
	  address = newAddress;
	}
	
	//return the occupation
	public String getOccupation(){
	  return occupation;
	}

	//change occupation
	public void changeOccupation(String newOccupation){
	  occupation = newOccupation;
	}

	//return the name
	public String getName(){
	  return name;
	}

	//return the age
	public int getAge(){
	  return age;
	}

	//age
	public void age(){
	  age++;
	}

	//return the height
	public float getHeight(){
	  return height;
	}

	//return the shoe size
	public int getShoeSize(){
	  return shoeSize;
	}

	//return the spouse
	public Person getSpouse(){
	  return spouse;
	}

	//change spouse
	public void changeSpouse(Person newSpouse){
		spouse = newSpouse;
	}

}
