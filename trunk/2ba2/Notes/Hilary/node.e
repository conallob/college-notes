class NODE[G]

feature
	item : G
	next : NODE[G]

	set_item(x : G) is
		
		do
			item := clone(x)
		end

	set_next(n : NODE[G]) is
		
		do
			next := n
		end

end
