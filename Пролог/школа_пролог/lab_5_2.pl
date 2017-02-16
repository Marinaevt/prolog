factorial(0,1):- !.
factorial(_n,_x):-(_k is _n-1),
                      factorial(_k,_y),
                      _x is(_n*_y).
%?-factorial(3,_f).
%?-factorial(6,_f).
