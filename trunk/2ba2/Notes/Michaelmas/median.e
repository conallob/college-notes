class MEDIAN

feature

	find(k, left, right : INTEGER)is

	local
		i, j : INTEGER
		p : G
	do
		from
			i := left
			j := right
		until
			i >= j
		loop
			p := a.item(k)
			partition(i, j, p)
			if
				r < k
			then
				i := l
			end
			if
				k < l
			then
				j := r
			end
		end
	end

	
	partition(l0, r0 : INTEGER, p :G) is

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
				a.item(l) >= p
			loop
				l := l + 1
			end
		end


	right_scan(p : G) is

		do
			from
			until
				a.item(r) <= p
			loop
				r := r - 1
			end
		end

end		
