class Complex {
  private double real;  
  private double imag;  

  public Complex(double realToSet, double imagToSet) {
	  real = realToSet;
	  imag = imagToSet;
  }

  public double getReal() {
    return real;
  } 

  public double getImag() {
    return imag;
  }

  void addComplex(Complex addTo){
	  real += addTo.getReal();
	  imag += addTo.getImag();
  }

  void subComplex(Complex subFrom){
	  real -= subFrom.getReal();
	  imag -= subFrom.getImag();
  }

  void multComplex(Complex multBy){
	  real = (real*multBy.getReal()) - (imag*multBy.getImag());
	  imag = (imag*multBy.getReal()) + (real*multBy.getImag());
  }

  void divComplex(Complex divBy){
	  double tmp = divBy.getReal()*divBy.getReal() + divBy.getImag()*divBy.getImag();
	  real = (real*divBy.getReal()) + (imag*divBy.getImag());
	  imag = (imag*divBy.getReal()) - (real*divBy.getImag());
	  real /= tmp;
	  imag /= tmp;
  }

}
