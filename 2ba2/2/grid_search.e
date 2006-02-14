-- $Id: grid_search.e,v 1.10 2004/01/23 00:08:34 conall Exp $

class GRID_SEARCH

creation
	bla

feature
	bla is

	local
		file_parser : FILE_INPUT
		a, i, j, l : INTEGER
		grid : ARRAY2[CHARACTER]
		list : ARRAY[STRING]
		ans : INTEGER
  	do
		!!file_parser -- initialise my file parsing class
		i := 15
		j := 15
		l := 45
		grid := file_parser.parse_grid_input("grid.txt", i, j) -- parse the grid from a file
		list := file_parser.parse_list_input("list.txt", l) -- parse the list from a file
		from
	 		a := 0
		until
			a = l 
		loop
 			ans := search(list.item(a), grid) -- search for the selected word
			a := a + 1 -- a++
		end
	end

	
	search(word: STRING; matrix : ARRAY2[CHARACTER]) : INTEGER is

	require -- make sure words are longer then 0, the 
			  -- grid is at least 1	by 1 and the word isn't Void
		word /= Void and word.count > 0 and 
		matrix.line_maximum > 0 and matrix.column_maximum > 0
	local
		first, last : CHARACTER
		ans, x, y, len : INTEGER
	do
		first := word.first -- extract the first character
		last := word.last -- extract the last character
		len := word.count -- get the length
		print(word)
		print("%T%T")
		from
			y := 0
		until
			y = matrix.column_maximum -- 15
		loop
			from
				x := 0
			until
				x = matrix.line_maximum -- 15
			loop
				ans := scan(word, matrix, first, last, len, x, y) -- scan around this point for the word
				x := x + 1 -- x++
			end
			y := y + 1 -- y++
		end
		if
			ans = 1
		then
			print("[[32mFOUND[0m]") -- Print FOUND in green when I find a word
--			crash
		else
			print("[[31mNOT FOUND[0m]") -- Printi NOT FOUND in red if the word isn't found
--			crash
		end
			print("%N")
	end


feature{NONE}


	scan(word : STRING; grid : ARRAY2[CHARACTER]; f, l : CHARACTER; len,	x, y : INTEGER) : INTEGER is

	require
		grid.valid_index(x, y) and len > 0 -- I need to have a non trivial word length and 
								 					  -- a starting point within my grid of characters

	local
		g, x2, y2, found : INTEGER
	do
		from
			found := 0
			g := 0
		until
			g = 8
		loop
		
-- (x - len), (y - len) 	-- 	x, (y - len) 	-- 	(x + len), (y - len)
--
--
-- (x - len), y				--			x, y			-- 	(x + len), y
--
--
--	(x - len), (y + len) 	-- 	x, (y + len) 	-- 	(x + len), (y + len)
		
			inspect g -- let's choose our direction...
				when 0 then -- vertical - bottom to top
					x2 := x
					y2 := (y - len)
				when 1 then -- forwardslash - left to right
					x2 := (x + len)
					y2 := (y - len)
				when 2 then -- horizontal - left to right
					x2 := (x + len)
					y2 := y
				when 3 then -- backslash - left to right
					x2 := (x + len)
					y2 := (y + len)
				when 4 then -- vertical - top to bottom
					x2 := x
					y2 := (y + len)
				when 5 then -- forwardslash - right to left
					x2 := (x - len)
					y2 := (y + len)
				when 6 then -- horizontal - right to left
					x2 := (x - len)
					y2 := y
				when 7 then -- backslash - right to left
					x2 := (x - len)
					y2 := (y - len)
			end
			if
				grid.valid_index(x2, y2) -- check if the end point is within my grid
			then
				if
					grid.item(x, y) = f and grid.item(x2, y2) = l -- do the first and last characters match?
				then
					found := found + further_investigation(word, grid, x, y, x2, y2) -- yes, let's look closer
				end
			end
			g := g + 1 -- g++
		end
		if
			found > 0 -- Did I find anything?
		then
			Result := 1 -- Yah! I found a word!!
		else
			Result := 0 -- Uh Oh, I couldn't find the word at all. :(
		end
	ensure
		Result = 0 or Result = 1
	end


	further_investigation(word : STRING; grid : ARRAY2[CHARACTER]; x1, y1, x2, y2 : INTEGER) :INTEGER is
	
	require -- the start and end points are going to have to be word.count 
			  -- spaces apart, but in either the x, y or even both axes...
		(x1 - x2) * (x1 - x2) = word.count * word.count or 
		(x2 - x1) * (x2 - x1) = word.count * word.count or 
		(y1 - y2) * (y1 - y2) = word.count * word.count or 
		(y2 - y1) * (y1 - y2) = word.count * word.count
	local
		a, b, good, z : INTEGER
	do
		good := 0
		from
			a := forward_or_reverse(x1, x2) -- Am I working left->right or right->left?
			b := forward_or_reverse(y1, y2) -- Am I working bottom->top or	top->bottom?
			z := 0
		until
--			a = x2 or
--			b = y2 or
			z = word.count
   	loop
      	if
				grid.item(a, b) = word.item(z) -- Is the character at pos z in word also in position a, b in grid?
			then
				good := good + 1 -- If so, good++
			end
			if
				x2 = forward_or_reverse(x1, x2) -- check if I need to increment or decrement
			then
				a := a + 1 -- a++
			else
				a := a - 1 -- a--
			end
			if
				y2 = forward_or_reverse(y1, y2) -- check if I need to increment or decrement				
			then
				b := b + 1 -- b++
			else
				b := b - 1 -- b--
			end
         z := z + 1 -- z++
      end
		if
			good = word.count -- if I find an exact match, good will be the
									-- same as the length of the word...
		then
			Result := 1 -- ...which means I found the word
		else
			Result := 0 -- ...or maybe not...
		end
	ensure
		Result = 0 or Result = 1
	end -- further_investigation


	forward_or_reverse(a, b : INTEGER) : INTEGER is -- return the smaller number

	require
		a >= 0 and b >= 0
	do
		if
			b >= a 
		then
			Result := a
		elseif
			a >= b
		then
			Result := b
		end
	ensure
		Result = a or Result = b
	end -- forward_or_reverse


end -- GRID_SEARCH
