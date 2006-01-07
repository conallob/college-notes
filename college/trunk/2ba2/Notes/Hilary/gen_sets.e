class GEN_SETS

feature

	-- gen_subsets with ARRAY[INTEGER]

	s : ARRAY[INTEGER]

	gen_subsets(i, n : INTEGER) is

		local
			bit : INTEGER
		do
			if
				i > n
			then
				-- print
			else
				from
					bit := 0
				until
					bit > 1
				loop
					s.put(bit, i)
					gen_subsets(i + 1, n)
					bit := bit + 1
				end
			end
		end

	--gen_subsets with ARRAY[BOOLEAN]

	s : ARRAY[BOOLEAN]

	gen_subsets(i, n : INTEGER) is
		
		do
			if
				i > n
			then
				--print
			else
				s.put(False, i)
				gen_subsets(i + 1, n)
				s.put(True, i)
				gen_subsets(i + 1, n)
			end
		end

end		
