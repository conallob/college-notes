class
	MATRIX_CHAR

creation 
	make

feature {NONE} 

	mat: ARRAY [STRING];
			
feature  

	rows: INTEGER;

			
	cols: INTEGER;		

			

	make (r, c: INTEGER) is
		local
			i: INTEGER;
			s: STRING
		do
			rows := r;
			cols := c;
			!! mat.make (1, rows);
			from
				i := 1
			until
				i > rows
			loop
				!! s.make (cols);
				mat.put (s, i);
				i := i + 1
			end
		end;

	
	item (i, j: INTEGER): G is
		do
			Result := mat.item (i).item (j)
		end;

	
	put (ch: CHARACTER; i, j: INTEGER) is
		do
			mat.item (i).put (ch, j)
		end;

	
	put_row (s: STRING; i: INTEGER) is
		do
			mat.put (clone(s), i)
		end;

	
	
	
end -- class MATRIX_CHAR

