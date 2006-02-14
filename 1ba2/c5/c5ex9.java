/*No change from the original code, all changes in Parcel class*/
import tcdIO.*; 

class c5ex9 {
	public static void main (String args[]) {
		Terminal terminal;
		Address address;
		Parcel parcel;
		double weight;
		String street, town;
		int country;

		/*create an object to represent the terminal */
		terminal = new Terminal("Chapter 5 : Exercise 9");

		/*get details of parcel from user*/
		terminal.println("Please enter the details of your parcel.");
		weight = terminal.readDouble("Enter weight of parcel: ");
		terminal.println("Enter destination address: ");
		street = terminal.readString("Street: ");
		town = terminal.readString("Town: ");
		country = terminal.readInt("Country code: ");

		/*check that the country code is valid before proceeding */
		if ((country >= Address.IRELAND)){
		/* create objects to represent address and parcel */
		address = new Address(street, town, country);
		parcel = new Parcel(address, weight);
		/* report the cost of sending the parcel */
		terminal.println("The cost of sending the parcel is $" + parcel.calculatePostage() + ".");
		} else
		terminal.println("Sorry, can't be done!");
		}
}   
