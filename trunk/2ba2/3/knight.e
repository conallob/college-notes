-- $Id: knight.e,v 1.7 2004/03/04 21:35:14 conall Exp $

class KNIGHT
-- Class with features for finding first knights journey, if any, starting from a particular position.
creation
	make
feature

	board : ARRAY2[INTEGER]
	size, x1, y1 : INTEGER
	success : BOOLEAN

	rows, cols : ARRAY[INTEGER]


	make is
		local
			r, c : INTEGER
			x0, y0 : INTEGER
		do

		-- Getting Board dimensions, start and end positions from the command line.
		-- If command line paramters aren't set, prompt the user...
         if 
				argument_count >= 1 and then argument(1).is_integer 
			then
            r := argument(1).to_integer
			else
				print("Please specify board width: ")
				io.read_integer
				r := io.last_integer
         end
         if 
				argument_count >= 2 and then argument(2).is_integer 
			then
            c := argument(2).to_integer
			else
				print("Please specify board height: ")
				io.read_integer
				c := io.last_integer
         end
         if 
				argument_count >= 3 and then argument(3).is_integer and
				argument_count >= 4 and then argument(4).is_integer
			then
            x0 := argument(3).to_integer
				y0 := argument(4).to_integer
			else
				print("Please specify start coordinates:%N")
				print("X: ")
				io.read_integer
				x0 := io.last_integer
				print("Y: ")
				io.read_integer
				y0 := io.last_integer
         end
			if
				argument_count >= 5 and then argument(5).is_integer and
				argument_count >= 6 and then argument(6).is_integer
			then
				x1 := argument(5).to_integer
				y1 := argument(6).to_integer
			else
				print("Please specify end coordinates:%N")
            print("X: ")
            io.read_integer
            x1 := io.last_integer
            print("Y: ")
            io.read_integer
            y1 := io.last_integer				
			end	
			!!board.make(0,r,0,c)
			size := r * c -- board may be rectangular
			board.set_all_with(0)
			board.put(1,x0,y0)
			init_moves
			success := False
			try_all(2,x0,y0)

			if not success then
				print("No Solution")
			else
				display_board
			end
		end --make


	init_moves is
		local
			i,j,k : INTEGER
		do
			!!rows.make(1,8)
			!!cols.make(1,8)
			k := 1
			from
				i := -2
			until
				i > 2
			loop
				from
					j := -2
				until
					j > 2
				loop
					if i*i + j*j = 5 then
						rows.put(i,k)
						cols.put(j,k)
						k:=k+1
					end
					j := j+1
				end
				i := i+1
			end
		end --init_moves


	try_all(k, x,y : INTEGER) is 
		local 
		d, new_x, new_y : INTEGER 
		do 
			if 
				k > size and
				board.item(x1, y1) = size
			then  
				display_board
			else 
				from 
					d := 1 
				until 
					d > 8 
				loop 
					new_x := x + rows.item(d) 
					new_y := y + cols.item(d) 
					if 
						acceptable(new_x, new_y) 
					then 
						board.put(k, new_x,new_y) 
						try_all(k+1, new_x,new_y) 
						board.put(0,new_x,new_y) 
					end 
					d := d+1 
				end 
			end 
		end -- try_all


	acceptable(s,t : INTEGER):BOOLEAN is
		do
		  result :=   s >= 1 and  s <= board.column_maximum and
				    t >= 1 and t <= board.line_maximum and then
				    board.item(s,t) = 0
		end --acceptable



	display_board is
		local
	        i,j : INTEGER
        do
			print("%N Knights Journey is given by %N")
			io.put_new_line
			from
				i := 1
			until
				i > board.column_maximum
			loop
				from
					j := 1
				until
					j > board.line_maximum
				loop
					io.put_integer(board.item(i,j))
					io.put_character(' ')
	                j := j+1
	            end
	            io.put_new_line
	            i := i+1
	        end
		end --display_board

end --KNIGHT
