
a  :- b,c.
a  :- d.
b  :- c.
c  :- d.
d.


a1  :- d1.
a1  :- b1,c1.
b1  :- c1.
c1  :- d1.
d1.


a2  :- b2,c2.
a2  :- d2.
b2  :- c2.
c2  :- a2.
d2.


% node = to-do list  (an agenda)
arc([H|T],X,KB) :- member([H|B],KB), append(B,T,X).
                %  resolution: replace H by B

seek([],_).  % [] = nothing left to do

seek(N,KB) :- arc(N,X,KB),
	      seek(X,KB).  % try some other node X reachable from N


% turn fact X into a node [X]
seek0(X) :- seek([X],[[a,b,c],[a,d],[b,c],[c,d],[d]]).

seek1(X) :- seek([X],[[a1,d1],[a1,b1,c1],[b1,c1],[c1,d1],[d1]]).

seek2(X) :- seek([X],[[a2,b2,c2],[a2,d2],[b2,c2],[c2,a2],[d2]]).



% Frontier Search
%   frontier = list of nodes
search([[]|_],_).

search([N|Frest],KB) :-
	      findall(X,arc(N,X,KB),Children),
	      append(Frest,Children,Fnew),
	      search(Fnew,KB).



bf0(X) :- search([[X]],[[a,b,c],[a,d],[b,c],[c,d],[d]]).

bf1(X) :- search([[X]],[[a1,d1],[a1,b1,c1],[b1,c1],[c1,d1],[d1]]).

bf2(X) :- search([[X]],[[a2,21,c2],[a2,d2],[b2,c2],[c2,a2],[d2]]).



dfSearch([N|Frest],KB) :-
	      findall(X,arc(N,X,KB),Children),
	      append(Children,Frest,Fnew),
	      dfSearch(Fnew,KB).



member(X,[X|_]).
member(X,[_|T]) :- member(X,T).

append([],X,X).
append([H|T],L,[H|R]) :- append(T,L,R).




