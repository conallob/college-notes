-- $Id: file_input.e,v 1.7 2004/01/20 23:42:39 conall Exp $

class FILE_INPUT


feature
 	parse_grid_input(file: STRING; i, j : INTEGER) : ARRAY2[CHARACTER] is

	require
		file /= Void and i >= 0 and j >= 0
	local
		fp : TEXT_FILE_READ
		x, y : INTEGER
		output : ARRAY2[CHARACTER]
  	do
		!!fp.connect_to(file) -- open the file
		!!output.make(0,(i - 1),0,(j - 1)) -- initialise the 2D array
		from
			y := 0
		until
			y = j or fp.end_of_input = TRUE -- whichever comes first...
		loop
			from
				x := 0
			until
				x = i --or (fp.last_character).same_as('%N') -- whichever comes first...
			loop
				fp.read_character -- read a character
				output.put(fp.last_character,x,y) -- save it in my array
				x := x + 1 -- x++
			end
			fp.skip_remainder_of_line -- flush the io buffer
			y := y + 1 -- y++
		end
		Result := output --result is the 2D array
	ensure
		Result /= Void and Result.line_maximum = (i - 1) and
		Result.column_maximum = (j - 1)
	end
	


   parse_list_input(file: STRING; length : INTEGER) : ARRAY[STRING] is

	require
		file /= Void and length > 0
   local
      fp : TEXT_FILE_READ
      a: INTEGER
      list : ARRAY[STRING]
   do
      !!fp.connect_to(file) -- open the file
		!!list.make(0, (length - 1)) -- initialise the array
      from
         a := 0
      until
         a = length or fp.end_of_input = TRUE -- whichever comes first...
      loop
         fp.newline -- read a word
         list.put(clone(fp.last_string), a) -- save it in my array
         a := a + 1 -- a++
      end
      Result := list --result is the array
	ensure
		Result /= Void and Result.count <= length
   end

end -- FILE_INPUT
