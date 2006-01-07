class WEIGHTS

feature

	s, opset : ARRAY[BOOLEAN]
	wgts : ARRAY[INTEGER]
	opt, max : INTEGER

	add_el(i, sum, achwgt : INTEGER) is

		local
			newsum, new_ach : INTEGER
		do
			newsum := sum + wgts.item(i)
			if
				newsum <= max
			then
				s.put(True, i)
				if
					i < s.count
				then
					add_el(i + 1, newsum, achwgt)
				elseif
					achwgt > opt
				then
					opt := achwgt
					opset.copy(s)
				end
				s.put(False, i)
			end
			new_ach := ach_wgt - wgts.item(i)
			if
				opt < new_ach
			then
				if
					i < s.count
				then
					add_el(i + 1, sum, new_ach)
				else
					opt := new_ach
					opset.copy(s)
				end
			end
		end


end
