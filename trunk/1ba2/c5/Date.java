
class Date {
  private int day, month, year;

  public Date(int wd,int wm, int wy) {
	  day = wd;
	  month = wm;
	  year = wy;
  }

  //if the year is divisible by four and not divisible by 100
  //or the year is divisible by four hundred it is a leap year
  public boolean isLeapYear(){
	  if( (((year%4) == 0) && ((year % 100) > 0)) || ((year%400) == 0) )
		  return true;
	  return false;
  }

  public int retDay() {
    return day;
  } 

  public int retMonth() {
    return month;
  } 

  public int retYear() {
    return year;
  } 
}
