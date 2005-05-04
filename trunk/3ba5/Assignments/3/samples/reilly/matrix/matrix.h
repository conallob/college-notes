
class Matrix{
	private:
		int **mat;
		int n;
	public:
		Matrix(int i, int n);
		Matrix Mult(Matrix A,Matrix B);
		void Display();
		Matrix Mult2(Matrix A, Matrix B);
		void SetA(Matrix A, int k);
		void SetB(Matrix B, int k);
};

