-- $Id: parberry.e,v 1.1 2004/03/04 21:35:14 conall Exp $

class PARBERRY
-- Class with features for finding first knights journey, if any, starting from a particular position.
creation
	make
feature

	board : ARRAY2[INTEGER]
	miniboard : ARRAY3[INTEGER]
	size, i, r, c : INTEGER
	success : BOOLEAN

	rows, cols, x0, y0, x1, y1 : ARRAY[INTEGER]


	make is
		do

		-- Getting Board dimensions, start and end positions from the command line.
		-- If command line paramters aren't set, prompt the user...
         if 
				argument_count >= 1 and then argument(1).is_integer and then
				(argument(1).to_integer \\ 2) = 0
			then
            r := argument(1).to_integer
			else
				print("Please specify board width (must be even): ")
				io.read_integer
				r := io.last_integer
         end
         if 
				argument_count >= 2 and then argument(2).is_integer and then
				(argument(2).to_integer \\ 2) = 0
			then
            c := argument(2).to_integer
			else
				print("Please specify board height (must be even): ")
				io.read_integer
				c := io.last_integer
         end
			!!board.make(0,r,0,c)
			!!miniboard.make(0,(r/2),0,(c/2),0,3)
			size := r * c -- board may be rectangular
			board.set_all_with(0)
			miniboard.set_all_with(0)
			x0 := <<((m/2)-1),((m/2)-1),(m/2),((m/2)+2)>>
			y0 := <<((n/2)-2),(n/2),((n/2)+1),(n/2)>>
			x1 := <<((m/2)-3),((m/2)-2),((m/2)+2),((m/2)+1)>>
			y1 := <<((n/2)-1),((n/2)+2),(n/2),((n/2)-3)>>
			board.put(1,x0,y0)
			init_moves
			success := False
			i := 0
			try_all(2,x0.item(i),y0.item(i))
			from
				i := 1
			until
				i = 4
			loop
				if not success then
					print("No Solution")
				else
					i := i + 1
					try_all(2,x0.item(i),y0.item(i))
				end
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
		a, b, d, new_x, new_y, x_off, y_off : INTEGER 
		do 
			if 
				k > size and
				board.item(x1.item(i), y1.item(1)) = (size / 4)
			then
				inspect i
					when 0 then x_off := 0; y_off := 0
					when 1 then x_off := (r/2); y_off := 0
					when 2 then x_off := 0; y_off := (c/2)
					when 3 then x_off := (r/2); y_off := (c/2)
				end
				from
					b := 0
				until
					b = miniboard.column_maximum
				loop
					from
						a := 0
					until
						a = miniboard.line_maximum
					loop
				--		board.put((miniboard.item(a,b,i)+(i*(size/4))),(a + x_off),(b + y_off))
						a := a + 1
					end
					b := b + 1
				end
				success := True
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

end --PARBERRY
