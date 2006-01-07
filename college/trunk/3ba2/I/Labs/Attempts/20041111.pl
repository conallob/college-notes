% search(Target,[]).

search(Target,[[Target|R]|_].[Target|R]).

search(Target,[[S|R]|Front],Result) :-
                                       findall([X,S|K],move(S,X),NewRoots),
													append(Front,NewRoots,NewFront),
					 								search(Target,NewFront,Result).
