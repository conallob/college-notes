class LINKEDLIST[G]

feature{NONE}

	first_node : NODE[G]

feature

	has(x : NODE[G]) is

		local
			a : NODE[G]
		do
			from
				a := first_node
			until
				void or else equal(x,a.item)
			loop
				a := a.next
			end
			Result := (a /= Void)
		end


	put(x : G) is

		local
			n : NODE[G]
		do
			if
				not has(x)
			then
				!!n
				n.set_item(x)
				n.set_next(first_node)
				first_node := n
				count := count + 1
			end
		end


	remove(x : G) is
		
		local
			c, p : NODE[G]
		do
			from
				c := first_node
			until
				c = Void or else equal(c.item, x)
			loop
				p := c
				c := cnext
			end
			if
				c /= Void
			then
				if
					p /= Void
				then
					first_node := c.next
				else
					p.set(next(c.next)
				end
				count := count - 1
			end
		end


	count : INTEER


	empty : BOOLEAN is

		do
			Result := (count = 0)
		end
			
end	
