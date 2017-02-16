wife('Anna','Kola').
wife('Mary','Ivan').
wife('Olga','Petr').

have('Ivan',rub(10000)).
have('Ivan','TV').
have('Ivan',car('volga','red')).
have('Ivan','magn').
have('Petr',rub(5000)).
have('Petr','TV').
have('Petr','fridge').
have('Kola',rub(20000)).
have('Kola','TV').
have(X,Y) :- wife(X,Z),have(Z,Y).
price(car('volga'),32000).
price('TV',8400).
price('fridge',4200).
price('magn',3500).
price('video',12000).
price('radio',1300).
price('clock',500).
buy(X,Y,Z):-price(X,Y),not(have(Z,Y)),have(Z,rub(W)),W>=Y.
