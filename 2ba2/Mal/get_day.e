

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
			year,
			day1,
			month1,
			year1,
			ans  : INTEGER
		do
			Get_Date ("%NEnter day (1 <= day <= 31) : ")
	  		day := num;
	  		Get_Date ("%NEnter month (1 <= month <= 12) : ")
	  		month := num
	  		Get_Date ("%NEnter year (1753 <= year)  : ")
	  		year := num
			Get_Date ("%NEnter day (1 <= day <= 31) : ")
	  		day1 := num;
	  		Get_Date ("%NEnter month (1 <= month <= 12) : ")
	  		month1 := num
	  		Get_Date ("%NEnter year (1753 <= year)  : ")
	  		year1 := num
			!!dd
			ans := dd.date_diff(day, month, year,day1 ,month1, year1)

			io.put_string("%NThe difference is: ")
			io.put_integer(ans)			

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


