
class Parcel {
	private Address address;
	private double weight;
	private boolean delivered = false;

	/*initialise a new instance of Parcel */
	public Parcel(Address addr, double wght) {
		address = addr;
		weight = wght;
	}

	/* report whether or not the parcel has been delivered */
	public boolean isDelivered() {
		return delivered;
	}

	/* determine the cost of sending the package */
	public double calculatePostage() {
		double cost = 0.0;
		switch (address.getCountry()) {
			case Address.IRELAND:
				cost = 5.0;
				break;
			case Address.UK:
				cost = 10.0;
				break;
			case Address.FRANCE:
			case Address.GERMANY:
			case Address.AUSTRIA:
				cost = 15.0;
				break;
			case Address.SPAIN:
			case Address.PORTUGAL:
			case Address.ITALY:
			case Address.GREECE:
				cost = 20.0;
				break;
			case Address.DENMARK:
			case Address.SWEDEN:
			case Address.FINLAND:
				cost = 25.0;
				break;
			case Address.BELGIUM:
			case Address.HOLLAND:
			case Address.LUXEMBURG:
				cost = 12.0;
				break;
			default:
				cost = 50.00;
		}

		//simple if / else if clauses to determine additional cost to package
		//based on weight

		if((weight >= .1) && (weight < 1))
			cost += 10;
		else if((weight >= 1) && (weight < 5))
			cost += 25;
		else if((weight >= 5) && (weight <= 10))
			cost += 60;
		else if(weight > 10)
			cost += 100;

		return cost;
	}
}

