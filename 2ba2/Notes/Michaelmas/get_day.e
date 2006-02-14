class
	GET_DAY
creation
	make
feature

	make is
		local
			dd : DATE_DAY
			day,
			month,
			year  : INTEGER
		do
			Get_Date ("%NEnter day (1 <= day <= 31) : ")
	  		day := num;
	  		Get_Date ("%NEnter month (1 <= month <= 12) : ")
	  		month := num
	  		Get_Date ("%NEnter year (1753 <= year)  : ")
	  		year := num
	  		io.put_string ("%N The date is a ")
	  		!!dd
	  		inspect dd.date2day (day, month, year)
	    			when 0 then io.put_string ("Sunday")
	    			when 1 then io.put_string ("Monday")
	    			when 2 then io.put_string ("Tuesday")
	    			when 3 then io.put_string ("Wednesday")
	    			when 4 then io.put_string ("Thursday")
	    			when 5 then io.put_string ("Friday")
	    			when 6 then io.put_string ("Saturday")
	  		end
	  		io.new_line
		end -- make

	num : INTEGER

	Get_Date (Msg : STRING) is
		do
	  		io.put_string(Msg)
	  		io.read_integer
	  		num := io.last_integer
		end -- Get_Date

end -- GET_DAY


