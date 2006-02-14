class INSERT[G->COMPARABLE]

feature {ANY} 
   
   sort(a: ARRAY[G]; low, high: INTEGER) is 
      require -- a[low..high] is non-empty
         Range: low <= high and a.lower <= low and high <= a.upper; 
         Non_Trivial: a /= Void and then a.count > 0; 
      local 
         k: INTEGER;
         bs: BINARY_SEARCH[G];
      do  
         from 
            !!bs;
            k := low + 1;
         until 
            k > high
         loop 
            bs.Search(a,low,k - 1,a.item(k));
            insert(a.item(k),bs.index + 1,a,low,k - 1);
            k := k + 1;
         end; 
      ensure 
         Sorted: Is_Ordered(a,low,high); 
      end -- sort
   
   Is_Ordered(a: ARRAY[G]; L, H: INTEGER): BOOLEAN is 
      -- check whether array is ordered
      require -- a[L..H] is non-empty
         Range: L <= H and a.lower <= L and H <= a.upper; 
         Non_Trivial: a /= Void and then a.count > 0; 
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
      ensure -- (All k | L <= k < H : a@k <= a@(k+1))
         
      end -- Is_Ordered
   
   insert(x: G; i: INTEGER; a: ARRAY[G]; low, high: INTEGER) is 
      -- insert x at position i in array a.
      require 
         Range: low <= i and i <= high + 1; 
      local 
         k: INTEGER;
      do  
         from 
            k := high + 1;
         until 
            k = i
         loop 
            a.force(a.item(k - 1),k);
            k := k - 1;
         end; 
         a.force(x,i);
      end -- insert

end -- class INSERT
