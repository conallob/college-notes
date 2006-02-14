class MASTERMIND
creation
  make
feature
  make is
  local
  		code, guess, correct, wrong_place : INTEGER
		index : INTEGER -- loop index
		esc : CHARACTER
	do
  		esc := (27).to_character
		code := generate_code -- generate the code
		print(esc.out+"[32m"+"Welcome To Mastermind"+esc.out+"[0m%N%N")
		print("You will have 10 attempts to guess a 4 digit number ")
		print("using only the digits 1 - 6.%N%N")
		print("After every guess, you will be informed how similar ")
		print("your guess is to the code.%N%N")
		from
			index := 1
		until
			index > 10
		loop
			print("Guess No "+esc.out+"[35m")
			io.put_integer(index)
			print(esc.out+"[0m") -- set text back to white
			print(": ")
			io.read_integer
			guess := io.last_integer
			if 
				guess >= 1111 and guess <= 6666 and is_valid_input(guess)
			then
				correct := compare_guess_for_exact_matches(guess, code)
				wrong_place := compare_guess_for_wrong_places(guess, code)
				wrong_place := wrong_place - correct -- re-adjust for duplicates
				if
					correct = 0
				then
					print("No digits exactly right.%N")
				elseif
					correct > 1
				then
	         	print(esc.out+"[32m")
				   io.put_integer(correct)
					print(" digits exactly right%N")
					print(esc.out+"[0m") -- set text back to white
				elseif
					correct = 1
				then
	         	print(esc.out+"[32m")
				   io.put_integer(correct)
					print(" digit exactly right%N")
					print(esc.out+"[0m") -- set text back to white
				end
				if
					wrong_place = 0
				then
					print(esc.out+"[33m")
					print("No digits in the wrong position.%N")
					print(esc.out+"[0m") -- set text back to white
				elseif
					wrong_place > 1
				then
	         	print(esc.out+"[33m")
				   io.put_integer(wrong_place)
					print(" right digits, but in the wrong places%N")
					print(esc.out+"[0m") -- set text back to white
				elseif
					wrong_place = 1
				then
					print(esc.out+"[33m")
					io.put_integer(wrong_place)
					print(" digit in the wrong position.%N")
					print(esc.out+"[0m") -- set text back to white
				end
				print("%N")
				if
					correct = 4 and wrong_place = 0
				then
					index := 11 -- Game's over, user won...
					print(esc.out+"[34m")
					print("Congradulations. You won!!%N%N")
					print(esc.out+"[0m") -- set text back to white
				else
					index := index + 1 -- otherwise continue playing
				end
         else
				print(esc.out+"[31m")
            print("%NError: Invalid Input!%N")
            print("Please enter a 4 digit number next time, using only the digits 1 to 6.%N%N")
            print(esc.out+"[0m") -- set text back to white
				index := 11 -- kill the program
         end

		end
  	end -- make


  generate_code : INTEGER is
  		local
			random : STD_RAND -- To generate the random no
			a, b, z , seed : INTEGER -- internal indexes and code storage
		do
			seed := get_seconds_from_epoch -- calculate the no of seconds since UNIX Epoch
			!!random.with_seed(seed) -- initialise the random no with my seed
			from
				a := 0
			until
				a = 4 -- loop four times, for 4 digits
			loop
				random.next
				b := random.last_integer(6) -- generate a no between 1 - 6
				z := z * 10 + b -- shift existing digits 1 digit left and add new digit
				a := a + 1 -- increment the loop counter
			end	
			Result := z -- return 4 digit code
		end -- generate_code	


	compare_guess_for_exact_matches(guess : INTEGER; code : INTEGER) : INTEGER is
--      require
--		    guess >= 1111 and guess <= 6666
		local
			exact : INTEGER
			i : INTEGER
			b, c : STRING
			char_c, char_g : CHARACTER
		do
			if
				guess.is_equal(code) -- if the guess and code are exactly the same
			then	
				exact := 4
			else
				from
					i := 1 -- index
					b := guess.to_string -- code and guess converted to strings for a while
					c := code.to_string
				until
					i = 4
				loop
					char_g := b.item(i) -- select the current digits
					char_c := c.item(i)
					if
						char_c.same_as(char_g) -- comare the current digits
					then
						exact := exact + 1 -- increment exact no of matches
					end
					i := i + 1
				end
			end
			Result := exact
		ensure
		    Result >= 0 and Result <= 4
		end -- compare_guess_for_exact_matches


   compare_guess_for_wrong_places(guess : INTEGER; code : INTEGER) : INTEGER is
      
--		require
--			guess >= 1111 and guess <= 6666
		local
         wrong_pos : INTEGER
         i : INTEGER
         b, c : STRING
         g_char : CHARACTER
      do 
         if
            guess.is_equal(code) -- if the guess and code are exactly the same
         then
            wrong_pos := 4
         else
            from
               i := 1 -- index
               b := guess.to_string -- code and guess converted to strings for a
               c := code.to_string
            until
               i = 4
            loop
	            g_char := b.item(i) -- select the current digit
					if
						c.occurrences(g_char) > 0 -- get the no of occurrences of the selected digit
					then
	               wrong_pos := wrong_pos + 1 -- increment the no of right digits in the wrong places
					end
               i := i + 1 -- increment the counter
            end
			end
      	Result := wrong_pos
		ensure
			Result >= 0 and Result <= 4
		end -- compare_guess_for_wrong_places 



	is_valid_input(guess : INTEGER) : BOOLEAN	is
--		require
--			guess >= 1111 and guess <= 6666
		local
			temp : STRING
			a, c : INTEGER
			foobar : INTEGER
			invalid : ARRAY[INTEGER]
		do
			from
				a := 1
				temp := guess.to_string
				invalid := <<0, 7, 8, 9>> -- these are the digits not allowed
			until
				a = 5
			loop
				foobar := invalid @ a
				c := c + temp.occurrences(foobar.digit) -- check for occurences of invalid digits
				a := a + 1
			end
			if
				c > 0 -- If there are any invalid digits
			then
				Result := false
			elseif 
				c = 0 -- otherwise...
			then
				Result := true
			end
		end -- is_valid_input


   get_seconds_from_epoch : INTEGER is
      local
         clock : TIME
         bla : INTEGER
      do
         clock.update -- get the current time
         bla := bla + ((clock.year - 1970) * 60 * 60 * 24 * 365) -- calculate the time from
         bla := bla + (clock.year_day * 60 * 60 * 24)				  -- UNIX Epoch (00:00 1st Jan 1970)
         bla := bla + clock.hour * 60 * 60							  -- until now, in seconds (Yes, I'm crazy!)
         bla := bla + clock.minute * 60
         bla := bla + clock.second
         Result := bla
      ensure
         Result > 0
      end -- get_seconds_from_epoch

end -- class MASTERMIND
