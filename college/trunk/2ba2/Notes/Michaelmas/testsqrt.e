class TESTSQRT
  creation
	make
  feature

	make is
	  local
	  	s  : SQRT
		x,r : REAL
		n : INTEGER
	  do
		!!s
		print("Input a number :")
		io.read_real
		x := io.last_real
		print("%NSimple_sqrt is : ")
		n := s.simple_sqrt(x)
		io.put_integer(n)
		print("%NFloor_sqrt is : ")
		n := s.floor_sqrt(x)
		io.put_integer(n)
		print("%NBinary sqrt is : ")
		r := s.sqrt_r(x)
		io.put_real(r)
		io.put_new_line
	  end -- make

end -- TESTSQRT
