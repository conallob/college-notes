class
        VECTOR_CHAR
creation
        make
feature
        v: ARRAY [CHARACTER];
feature
        size : INTEGER;
---
        make (n: INTEGER) is
	  require
	    pre: n >= 0
	  do
	    size := n
	    !! v.make (0, n-1)
	  end --make
	  
---

		item (i: INTEGER): CHARACTER is
			require
				pre: 0 <= i and i <= size-1
			do
				Result := v.item(i)
			end --item
	  
---

		put (x: CHARACTER; i: INTEGER) is
	  		require
	    		pre: 0 <= i and i <= size-1
	  		do
	    		v.put (x, i)
	  		end --put
	  
	  
------------

        string_copy (s: STRING)is
	  		require
	    			pre: s.count = size
	  		local
	    			i, j: INTEGER
	  		do
	    			from
	      				i := 1;
	      				j := 0
	    			until
	      				i > s.count
	    			loop
	      				put(s.item(i), j);
	      				i := i + 1;
	      				j := j + 1
	    			end
	  		end --arr_copy
	  
---

		to_string:STRING is
			local
				k : INTEGER
				str : STRING
		  	do
				from
					k := 1
					str := ""
			 	until
					k > size
			 	loop
			 		str.append(item(k).out)
					str.append(" ")
					k := k+1
			 	end
				Result := clone(str)
		  	end -- to_string


end -- VECTOR_CHAR
