class Address {
	/* define some country codes */
	public static final int IRELAND = 0;
	public static final int UK = 1;
	public static final int FRANCE = 2;
	public static final int GERMANY = 3;
	public static final int AUSTRIA = 4;
	public static final int SPAIN = 5;
	public static final int PORTUGAL = 6;
	public static final int ITALY = 7;
	public static final int GREECE = 8;
	public static final int DENMARK = 9;
	public static final int SWEDEN = 10;
	public static final int FINLAND = 11;
	public static final int BELGIUM = 12;
	public static final int HOLLAND = 13;
	public static final int LUXEMBURG = 14;

	private String street;
	private String town;
	private int country;

	/* initialise a new instance of Address */
	public Address(String s, String t, int c){
		street = s;
		town = t;
		country = c;
	}

	/* return the street name */
	public String getStreet() {
		return street;
	}

	/* return the town name */
	public String getTown() {
		return town;
	}

	/* return the country code */
	public int getCountry() {
		return country;
	}
}

