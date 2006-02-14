class BIN_NODE[G]

feature

	value : G
	left, right : BIN_NODE[G]


	set_left(l : BIN_NODE[G]) is

		do
			left := l
		end


	set_right( r : BIN_NODE[G]) is

		do
			right := r
		end


	build(v : G, l, r : BIN_NODE[G]) is

		do
			value := v
			left := r
			right := r
		end

end	
