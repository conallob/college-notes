class SQRT

feature

	simple_sqrt(x:REAL):INTEGER is
		require
			Pre_Sq_Rt:	x >= 0.0
		local
	   		r : INTEGER
		do
	  		from
				r := 0;
	  		until
				(r+1)^2 > x
	  		loop
				r := r+1
	  		end
	  		result := r
		ensure
	  		Post_Sq_Rt:	result^2 <= x and x < (result+1)^2
		end -- simple_sqrt

-----------------------------------------------------------------------------------


	floor_sqrt(x:REAL):INTEGER is
		require
			Pre_Sq_Rt:	x >= 0.0
		local
	   		r,n,s : INTEGER
		do
	  		from
				r := 0; n := 1; s := 1
	  		until
				s > x
	  		loop
				r := r+1; n := n+2; s := s+n
	  		end
	  		result := r
		ensure
	  		Post_Sq_Rt:	result^2 <= x and x < (result+1)^2
		end -- floor_sqrt

-----------------------------------------------------------------------------------


	bin_sqrt_r (low, high: REAL; eps: REAL; x: REAL): REAL is
        -- (Recursive version)
		require
			within: low^2 <= x and x < high^2
		local
			mid: REAL
		do
			if low + eps < high then
				mid := (low + high) / 2;
				if mid^2 - x <= 0 then
					Result := bin_sqrt_r (mid, high, eps, x)
				else
					Result := bin_sqrt_r (low, mid, eps, x)
				end
			else
				Result := low
			end
		ensure
			Result^2 <= x and x < (Result + eps)^2
		end;

	sqrt_r (x: REAL): REAL is
		require
			Pre_sqrt_r: x >= 0.0
		local
			y: REAL
		do
			from
				y := 1
			until
				y ^ 2 > x
			loop
				y := 2 * y
			end;
			 Result := bin_sqrt_r (0, y, 0.0001, x)
		end; -- sqrt_r


end -- SQRT
