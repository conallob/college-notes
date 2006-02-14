class
	FIB_ROOT

creation
	test_fib

feature

	test_fib is
		local
			f: FIB;
			n: INTEGER
		do
			!! f;
			print ("Input a Nat. Num. ");
			io.readint;
			n := io.lastint;
			io.putint (f.fib1 (n));
			io.new_line;
			io.putint (f.fib2 (n));
			io.new_line;
			io.putint (f.fib3 (n));
			io.new_line;
			io.putint (f.fib (n));
		end;

end -- class FIB_ROOT
