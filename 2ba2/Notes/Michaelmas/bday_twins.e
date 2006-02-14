class BDAY_TWINS

feature {ANY}

   bday(days, n: INTEGER): REAL is
      require
         Pre: days > n
      local
         k: INTEGER;
         p: REAL
      do
         from
            k := days - n + 1;
            p := 1
         until
            k = days
         loop
            p := p * k / days;
            k := k + 1;
         end;
         Result := p
      ensure -- abs_val(result - product(days-(n-1),days-1)/days^(n-1)) < 0.001

      end -- bday

   product(m, n: INTEGER): INTEGER is
      -- returns product m*(m+1).. *n
      local
         k, r: INTEGER
      do
         from
            k := m;
            r := 1
         until
            k > n
         loop
            r := r * k;
            k := k + 1
         end;
         Result := r
      end -- product

   max(x,y :REAL):REAL is
   	do
   		if  x > y then
   			Result := x
   		else
   			Result := y
   		end
   	end -- max

   abs_val(x: REAL): REAL is
      do
         Result := max(x, -x)
      end -- abs_val

end -- class BDAY_TWINS
