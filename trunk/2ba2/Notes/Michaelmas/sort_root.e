class SORT_ROOT

creation {ANY} 
   make

feature {ANY} 
   
   make is 
      local 
         s, t: STRING;
         i, sz: INTEGER;
         v: ARRAY[STRING];
         ins: INSERT[STRING];
         bs: BINARY_SEARCH[STRING];
         in_file: TEXT_FILE_READ;
      do  
         from 
            !!in_file.connect_to("in.txt");
            in_file.read_integer;
            sz := in_file.last_integer;
            !!v.make(1,sz);
            i := 0;
            in_file.read_word;
         until 
            in_file.end_of_input
         loop 
            i := i + 1;
            t := clone(in_file.last_string);
            v.put(t,i);
            in_file.read_word;
         end; 
         in_file.disconnect;
         print("Input Sequence is %N");
         print_array(v,v.lower,v.upper);
         !!ins;
         ins.sort(v,v.lower,v.upper);
         print("Sorted Version is %N");
         print_array(v,v.lower,v.upper);
         !!bs;
         io.put_string("%N%NLooking for which word :");
         io.read_word;
         s := io.last_string;
         bs.Search(v,v.lower,v.upper,s);
         print(s);
         if bs.found then 
            print(join(" found at index ",bs.index.out));
         else 
            print(join(" not found: put after index ",bs.index.out));
            ins.insert(s,bs.index + 1,v,v.lower,v.upper);
            print(s);
            print(join(" now at index ",(bs.index + 1).out));
            io.put_new_line;
            print_array(v,v.lower,v.upper);
         end; 
      end -- make
   
   join(S1, S2: STRING): STRING is 
      do  
         Result := clone(S1);
         Result.append(S2);
         Result.extend('%N');
      end -- join
   
   print_array(a0: ARRAY[STRING]; low, high: INTEGER) is 
      local 
         i: INTEGER;
      do  
         from 
            i := low;
         until 
            i > high
         loop 
            io.put_string(a0.item(i));
            if i /= high then 
               io.put_string(",  ");
            end; 
            i := i + 1;
         end; 
         io.put_new_line;
      end -- print_array

end -- class SORT_ROOT
