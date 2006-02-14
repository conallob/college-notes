

class
	DATE_DAY
feature

	month_days: ARRAY[INTEGER] 		-- accumulated days in months
	leap_month_days: ARRAY[INTEGER]	-- accumulated days in months for leap year

	setup_months is
		-- Set up value for accumulating arrays, months_day and leap_month_days
		local
			k, sum : INTEGER
			days_in_month:ARRAY[INTEGER]
		do
			from
				days_in_month := <<31,28,31,30,31,30,31,31,30,31,30,31>>
				!!month_days.make(0,12)
				!!leap_month_days.make(0,12)
				month_days.put(31,1)
				leap_month_days.put(31,1)
				k := 2
			until
				k > 12
			loop
				sum := month_days.item(k-1) + days_in_month.item(k)
				month_days.put(sum,k)
				leap_month_days.put(sum+1,k)
				k := k+1
			end
		end -- setup_months


	date2num(d,m,y:INTEGER):INTEGER is
		-- convert a date (d,m,y) to a number of days since virtual start of calendar
		local
			s, r : INTEGER
 		do
			setup_months
			s := simplify(d,y)
 			if is_leap_year(y) then
 				r := leap_month_days.item(m-1)
 			else
   				r := month_days.item(m-1)
 			end
			Result := (s + r) 
 		end -- date2day

	simplify(d,y:INTEGER):INTEGER is
		do
			Result := d +  (y-1) * 365 + (y-1) // 4 - (y-1) // 100 + (y-1) // 400
		end -- simplify

	is_leap_year(y:INTEGER):BOOLEAN is
		require
			Pre: y >= 0
  		do
 			if y \\ 100 = 0 then
 				Result := y \\ 400 = 0
 			else
 				Result := y \\ 4 = 0
 			end
		ensure
			Post: Result = (y \\ 4 = 0 and (y \\ 100 = 0 implies y \\ 400 = 0))
 		end --is_leap_year

	date_diff(d1,m1,y1,d2,m2,y2:INTEGER):INTEGER is
		local
			numDays1, numDays2 : INTEGER
		do
			numDays1 := date2num(d1, m1, y1)
			numDays2 := date2num(d2, m2, y2)
			
			if numDays1 > numDays2 then
				Result := numDays1 - NumDays2
			else 
				Result := numDays2 - numDays1
			end	
		end
end -- DATE_DAY
