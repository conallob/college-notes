class SimultaneousEquation {
  private double a,b,c,d,e,f; //coefficents as in question

  public SimultaneousEquation(double ia,double ib,double ic,double id,double ie,double nf) {
  a = ia;
  b = ib;
  c = ic;
  d = id;
  e = ie;
  f = nf;
  }


  //checks whether the slopes are equal, if so, return false as calculation is meaningless
  public boolean isPossible(){
    double m1,m2;
    m1 = a/b;
    m2 = d/e;
    if(m1 == m2)
      return false;
    return true;
  }

  public double retX() {
    return ((c/b - f/e) / (a/b - d/e));
  } 

  public double retY() {
    return (c/b - ((a/b)*retX()));
  }
}
