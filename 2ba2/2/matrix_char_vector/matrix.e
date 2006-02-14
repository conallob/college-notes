class
        MATRIX_CHAR
creation
        make
feature {NONE}
        mat: ARRAY [VECTOR_CHAR];
feature
        rows, cols: INTEGER;

---
	make (r, c: INTEGER) is
	  	local
	    		i: INTEGER;
	    		v: VECTOR_CHAR
	  	do
	    		rows := r;
	    		cols := c;
	    		!! mat.make (0, rows-1);
	    	from
	      		i := 0
	    	until
	      		i = rows
	    	loop
	      		!! v.make (cols);
	      		mat.put(v, i);
	      		i := i + 1
	    	end
	  end --make
	  

---
		item (i, j: INTEGER): CHARACTER is
	  		do
	    			Result := mat.item(i).item (j)
	  		end --item

---
		row(i:INTEGER):VECTOR_CHAR is
			do
				Result := mat.item(i)
			end -- row

---
        put (x: CHARACTER; i, j: INTEGER) is
	  		do
	    			mat.item(i).put (x, j)
	  		end --put


end -- MATRIX_CHAR
