class BDAY_TEST

  creation
     make
  feature

     make is
	  local
          bd : BDAY_TWINS
          d,n : INTEGER
          p : REAL
	  do
          !!bd
          print("Input days (365 or 366) ")
          io.read_integer
          d := io.last_integer;
          io.put_new_line
          print("Input number of people : ")
		  io.read_integer
		  n := io.last_integer;
          p := bd.bday(d,n);
          print("Probability that all have different birthdays =  ");
		  io.put_integer((p*100).rounded);
		  io.put_string("%% %N")
          print ("Probability that there are birthday twins = ");
          io.put_integer(((1-p)*100).rounded)
          io.put_string("%% %N")
       end -- make

   end -- BDAY_TEST
