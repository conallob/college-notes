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


	date2day(d,m,y:INTEGER):INTEGER is
		-- convert a date (d,m,y) to a day of  the week (0..6)
		require
			days_OK: 0 < d and d <= 31
			months_OK: 0 < m and m <= 12
			years_OK: 1752 < y
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
			Result := (s + r) \\ 7
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

end -- DATE_DAY
