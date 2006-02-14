class HEAPSORTER[G->COMPARABLE]

feature

	sort(a0 : ARRAY[G], low, high : INTEGER) is
		
		do
			a := a0
			base := low - 1
			n := high - base
			heapsort
		end


feature{NONE}

	a : ARRAY[G]
	base : INTEGER
	n : INTEGER

	-- resurvice version

	heapify (i, j : INTEGER) is

		local
			k : INTEGER
		do
			k := 2 * 1
			if
				k <= j
			then
				if
					k < j and then
					a.item(k) < a.item(k + 1)
				then
					k := k + 1
				end
				if
					a.item(i) < a.item(k)
				then
					exchange(i, k)
					heapify(k, j)
				end
			end
		end

	-- non recursive version

	
	heapify(i_val, j : INTEGER)

		local
			v : G
			i, j : INTEGER
		do
			i := i_val
			k := i * 2
			if
				k < j and then
				a.item(k) < a.item(k + 1)
			then
				k :=k + 1
			end
			from
				v := a.item(i)
			until
				k > j or else
				v >= a.item(k)
			loop
				a.put(a.item(k), i)
				i := k
				k := i * 2
				if
					k < j and then
					a.item(k) <= a.item(k + 1)
				then
					k := k + 1
				end
			end
			a.put(v, i)
		end

	
	build_heap is

		local
			k : INTEGER
		do
			from
				k := n // 2
			until 
				k = 0
			loop
				heapify(k, n)
				k := k - 1
			end
		end


end
