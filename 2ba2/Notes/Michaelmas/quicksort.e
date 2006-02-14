class QUICKSORT[G->COMPARABLE]

feature		-- Only sort is exported
	
	sort(a0 : ARRAY[G], low, high : INTEGER) is

		do
			a := a0
			qsort(low, high)
		end --sort

feature{NONE}

	a : ARRAY[G]
	l, l :INTEGER

	exchange (i, j : INTEGER) is -- same thing as ARRAY.swap(i,j : INTEGER)
		
		local
			bla : G
		do
			it : a.item(i)
			a.put(a.item(j),i)
			a.put(it,j)
		end


	qsort(left, right : INTEGER) is

		local
			i, j : INTEGER
			pivot : G
		do
			if
				left <= right
			then
				pivot := a.item((left + right) // 2)
				partition(left, right, pivot)
				i := l
				j := r
				qsort(left,j)
				qsort(i,right)
			end
		end


	partition(l0, r0 : INTEGER, p : G) is

		do
			from
				l := l0
				r := r0
			until
				l > r
			loop
				left_scan(p)
				right_scan(p)
				if
					l <= r
				then
					exchange(l,r)
					l := l + 1
					r := r - 1
				end
			end
		end


	left_scan(p : G) is

		do
			from
			until
				a.item(l <= p
			do
				l := l + 1
			end
		end


	right_scan(p : G) is

		do
			from
			until
				a.item(r) <= p
			do
				r := r - 1
			end
		end
				
end
