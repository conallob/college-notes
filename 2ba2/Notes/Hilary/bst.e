class BST[G]

feature

	insert(x : G, t : BIN_NODE[G]) is
		
		local
			p, c, new : BIN_NODE[G]
		do
			from
				c := t
			until
				c = Void or else
				equal(x, c.value)
			loop
				if
					x < c.value
				then
					p := c
					c := c.left
				elseif
					x > c.value
				then
					p := c
					c := c.right
				end
			end
			if
				c = Void
			then
				if
					x < p.value
				then
					!!new
					new.build(x, Void, Void)
					p.set_left(new)
					count := count + 1
				elseif
					x > p.value
				then
					!!new
					new.build(x, Void, Void)
					p.set_right(new)
					count := count + 1
				end
			end
		end


	add(x : G) is

		do
			if
				root /= Void
			then
				insert(x, root)
			else
				!!root
				root.build(x, Void, Void)
				count := 1
			end
		end

			
	preorder(bt : BIN_NODE[G]) is

		do
			if
				bt /= Void
			then
				process(bt.value)
				preorder(bt.left)
				preorder(bt.right)
			end
		end

	
	postorder(bt : BIN_NODE[G]) is

		do
			if
				bt /= Void
			then
				postorder(bt.left)
				postorder(bt.right)
				process(bt.value)
			end
		end

	
	inorder(bt : BIN_NODE[G]) is

		do
			if
				bt /= Void
			then
				inord(bt)
			end
		end


	inord(bt : BIN_NODE[G]) is

		require
			Not_Void: bt /= Void
		do
			if
				bt.left /= Void
			then
				inord(bt.left)
			end
			process(bt.value)
			if
				bt.right /= Void
			then
				inord(bt.right)
			end
		end


	update(x : G, bt : BIN_NODE[G]) : BIN_NODE[G] is

		local
			t : BIN_NODE[G]
		do
			if
				x = bt.value
			then
				Result := bt
			else
				!!t
				if
					bt = Void
				then
					t.build(x, Void, Void)
					count := count + 1
				elseif
					x < bt.value
				then
					t.build(bt.value, update(x, bt.left), bt.right)
				elseif
					t.build(bt.value, bt.left, update(x, bt.right))
				end
				Result := t
			end
		end
			
			
	add_rec(x : G) is
		
		do
			root := update(x, root)
		end

	
	remove(x : G) is

		do
			root := delete(x, root)
		end

	
	right_most(bt : BIN_NODE[G]) : G is
		
		require
			Not_Void: bt /= Void
		local
			t : BIN_NODE[G]
		do
			from
				t := bt
			until
				t.right = Void
			loop
				t := t.right
			end
			Result := t.value
		end
			

	delete(x : G, bt : BIN_NODE[G]) : BIN_NODE[G] is
		
		local
			t : BIN_NODE[G]
		do
			if
				bt /= Void
			then
				if
					equal(x, bt.value)
				then
					Result := delete_root(x, bt)
				else
					!!t
					if
						x < bt.value
					then
						t.build(bt.root, delete(x, bt.left), bt.right)
					elseif
						x > bt.value
					then
						t.build(bt.root, bt.left, delete(x, bt.right))
					end
					Result := t
				end
			end
		end

	
	delete_root(x : G, bt : BIN_NODE[G]) : BIN_NODE[G] is

		require
			Not_Void: bt /= Void
		local
			rm : G
			t : BIN_NODE[G]
		do
			if
				bt.left = Void
			then
				Result := bt.right
			elseif
				bt.right = Void
			then
				Result := bt.left
			else
				rm := right_most(bt.left)
				!!t
				t.build(rm, delte(rm, bt.left), bt.right)
				Result := t
			end
		end

	
end
