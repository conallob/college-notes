class
	TEST_MATRIX_CHAR
creation 
	make

feature  

	mat: MATRIX_CHAR;

			
	make is
		local
			r, c: INTEGER
		do
			io.put_string ("%N Enter filename: ");
			io.read_word;
			file2matrix (io.last_string);
			print_matrix (mat, mat.rows);
		end;

	
	file2matrix (fname: STRING) is
			-- Input from file, fname, into the matrix, mat.
			-- First 2 numbers give #rows and #cols
		local
			in_file: PLAIN_TEXT_FILE;
			i, j, r, c: INTEGER;
			x: INTEGER
		do
			!! in_file.make_open_read (fname);
			in_file.read_integer;
			r := in_file.last_integer;
			in_file.read_integer;
			c := in_file.last_integer;
			!! mat.make (r, c);
			from
				i := 1
			until
				i > r
			loop
				in_file.read_word
				mat.put_row(s,i)
				i := i + 1
			end;
			in_file.close
		end;

	
	print_matrix (m: MATRIX_CHAR; rINTEGER) is
			-- M has r rows and c columns
			-- i.e. M is of height r and width c
		local
			i, j: INTEGER
		do
			from
				i := 1
			until
				i > r
			loop
				print(m.item(i))
				io.new_line;
				i := i + 1
			end;
			io.new_line
		end;
	
end -- class TEST_MATRIX_CHAR 

