class GEN_COMB

feature

	s : ARRAY[BOOLEAN]
	
	all_combs(i, n, k : INTEGER) is

		do
			if
				i > n
			then
				if
					setsize = k
				then
					--print
				end
			else
				s.put(True, i)
				all_combs(i + 1, n, k)
				s.put(False, i)
				all_combs(i + 1, n, k)
			end
		end

	setsize is

		local
			i, counter : INTEGER
		do
			from
				i := 1
				counter := 0
			until
				i > s.count
			loop
				if
					s.item(i)
				then
					counter := counter + 1
				end
					i := i + 1
			end
			Result := counter
		end
			
end				
