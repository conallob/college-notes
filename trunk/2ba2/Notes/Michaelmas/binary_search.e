class BINARY_SEARCH[G->COMPARABLE]

feature {ANY}

   found: BOOLEAN;

   index: INTEGER;

   Search(A: ARRAY[G]; L, H: INTEGER; x: G) is
      require
         ordered: is_ordered(A,L,H);
      local
         i, j, mid: INTEGER;
      do
         from
            i := L - 1;
            j := H + 1;
         until
            j = i + 1
         loop
            mid := (i + j) // 2;
            if a.item(mid) <= x then
               i := mid;
            else
               -- A.item(mid) > x
               j := mid;
            end;
         end;
         index := i;
         found := L <= index and then equal(A.item(index),x);
      ensure
         Found_it: found implies equal(A.item(index),x);
         Failed: not found implies L - 1 <= index and
		  index <= H and (index = L - 1 or else A.item(index) < x) and
		  (index = H or else x < A.item(index + 1));
      end -- Search

   is_ordered(a: ARRAY[G]; L, H: INTEGER): BOOLEAN is
      -- check whether array is ordered
      require -- a[L..H] is non-empty
         Non_Trivial: a /= Void and then a.count > 0;
         Range: L <= H and a.lower <= L and H <= a.upper;
      local
         i, j: INTEGER;
      do
         from
            i := L;
            j := H;
         until
            i = j
         loop
            if a.item(i) <= a.item(i + 1) then
               i := i + 1;
            else
               j := i;
            end;
         end;
         Result := i = H;
      ensure -- (All k | L <= k < H : a@k <= a@(k+2))

      end -- is_ordered

end -- class BINARY_SEARCH
