factorial1(_n,_x,_m,_y):-nonvar(_x),_y>_x,!,false.
factorial1(_n,_x,_n,_x):- !.
factorial1(_n,_x,_m,_y):- _m1 is(_m+1),
                             _y1 is(_y*_m1),
                             factorial1(_n,_x,_m1,_y1).
factorial2(_n,_x):-factorial1(_n,_x,0,1).
%?- factorial2(_X,6).
%?- factorial2(_X,7).
