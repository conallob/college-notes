-- $Id: test.e,v 1.4 2004/01/20 21:42:39 conall Exp $

class TEST
creation
  make
feature
  make is
  local
	temp : FILE_INPUT
	list : ARRAY[STRING]
	grid : ARRAY2[CHARACTER]
	x, y : INTEGER
	do
		!!temp
		grid := temp.parse_grid_input("grid.txt", 15, 15)
		list := temp.parse_list_input("list.txt", 45)
		from
			y := 0
		until
			y = 15
		loop
			from
				x := 0
			until
				x = 15
			loop
				print(grid.item(x,y))
				print(" ")
				x := x + 1
			end
		print("%N")
		y := y + 1
		end
		print("%N")
		from
			x := 0
		until
			x = list.count
		loop
			io.put_integer(x)
			print(" ")
			print(list @ x)
			print("%N")
			x := x + 1
		end
  end
end --class TEST
