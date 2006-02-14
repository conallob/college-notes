class HAMILTON

feature

	success : BOOLEAN
	visited : ARRAY[BOOLEAN]
	hamilton_cycle : ARRAY[INTEGER]
	g : ARRAY2[BOOLEAN]


	find_cycle(j, move : INTEGER) is

		local
			k : INTEGER
		do
			if
				move = g.count and then
				g.item(j, 1)
			then
				success := True
			else
				from
					k := 1
				until
					k > g.count or 
					success
				loop
					if
						g.item(j, k) and not
						visisted.item(k)
					then
						visited.put(True, k)
						hamilton_cycle.put(k, move + 1)
						find_cycle(k, move + 1)
						visited.put(success, k)
					end
					k := k + 1
				end
			end
		end


end
