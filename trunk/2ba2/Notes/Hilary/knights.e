class KNIGHTS
-- Class with features for finding first knights journey, if any, starting from a particular position.
creation
	make
feature

	board : ARRAY2[INTEGER]
	size : INTEGER
	success : BOOLEAN

	rows, cols : ARRAY[INTEGER]


	make is
		local
			r,c : INTEGER
			x0,y0 : INTEGER
		do

		-- Getting Board size
			print("%NBoard Size")
			print("%Ninput row size: ")
			io.read_integer
			r := io.last_integer
			print("%Ninput column size : ")
			io.read_integer
			c := io.last_integer
			!!board.make(r,c)
			size := r*c -- board may be rectangular
			board.initialize(0)

		-- Getting initial position
			print("Starting position")
			print("%Ninput row position: ")
			io.read_integer
			x0 := io.last_integer
			print("%Ninput column position: ")
			io.read_integer
			y0 := io.last_integer

			board.put(1,x0,y0)
			init_moves
			success := False

			Try_Next_Move(2,x0,y0)

			if not success then
				io.put_string("No Solution")
			else
				display_board
			end
		end -- make


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


	try_next_move(k, x,y :INTEGER) is
	-- Find first journey of knight from position (x,y) from kth move.
		local
			d, new_x, new_y : INTEGER
		do
			if k > size then
				success := True
			else
				from
					d := 0
				until
					d = 8 or success
				loop
					d := d+1
					new_x := x + rows.item(d)
					new_y := y + cols.item(d)
					if acceptable(new_x,new_y) then
					  board.put(k,new_x,new_y)
					  try_next_move(k+1,new_x,new_y)
					  if not success then
						board.put(0,new_x,new_y)
					  end
					end
				end --loop
			end
		end -- try_next_move


	Acceptable(s,t : INTEGER):BOOLEAN is
		do
		  result :=   s >= 1 and  s <= board.height and
				    t >= 1 and t <= board.width and then
				    board.item(s,t) = 0
		end -- Acceptable



	display_board is
		local
	        i,j : INTEGER
        do
			io.put_string("%N Knights Journey is given by %N")
			io.put_new_line
			from
				i := 1
			until
				i > board.height
			loop
				from
					j := 1
				until
					j > board.width
				loop
					io.put_integer(board.item(i,j))
					io.put_character(' ')
	                j := j+1
	            end
	            io.put_new_line
	            i := i+1
	        end
		end -- Display_Board

end -- class Knights_Journey
