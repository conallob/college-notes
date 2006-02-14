class TEST_MAT

 creation
	make
 feature

	mat: MATRIX_CHAR;
	rows,cols : INTEGER
---
	make is
		do
			io.put_string ("%N Enter filename for character matrix: ");
			io.read_word;
			file2matrix (io.last_string);
			fill_border('*')
			print_matrix
			io.read_character
			io.read_character
			
		end -- make
		
---
	file2matrix(file_name : STRING)  is
        	-- Input from file, file_name, into the matrix, mat.
		--  First 2 numbers give #rows and #cols
		local
			in_file: PLAIN_TEXT_FILE;
			i, j, r, c: INTEGER;
			x: CHARACTER
		do
			!! in_file.make_open_read (file_name);
			in_file.read_integer;
			rows := in_file.last_integer;
			in_file.read_integer;
			cols := in_file.last_integer;
			!! mat.make (rows+2, cols+2);
			from
				i := 1
			until
				i > rows
			loop
				from
					j := 1
				until
					j > cols
				loop
					in_file.read_character;
					x := in_file.last_character;
               			mat.put (x,i,j);
					j := j + 1
				end;
				in_file.next_line
				i := i + 1
			end;
			in_file.close
         	end; --file2matrix
		
---
			fill_border(ch:CHARACTER) is
				local
					i,j : INTEGER
				do
					-- fill top and bottom borders
					from
						j := 0
					until
						j = cols+2
					loop
						mat.put(ch, 0, j)
						mat.put(ch, rows+1, j)
						j := j+1
					end
					-- fill left and right borders
					from
						i := 1
					until
						i = rows+1
					loop
						mat.put(ch, i, 0)
						mat.put(ch, i, cols+1)
						i := i+1
					end
				end -- fill_border


---
		print_matrix  is
			local
				i, j: INTEGER
			do
				from
					i := 0
				until
					i > rows
				loop
					from
						j := 0
					until
						j > cols
					loop
						io.put_character (mat.item (i, j));
						io.put_character (' ');
						j := j + 1
					end;
					io.put_new_line;
					i := i + 1
				end;
				io.put_new_line
      		end; --print_matrix

end -- class TEST_MAT
