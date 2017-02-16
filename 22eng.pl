car(moskv,9500,green,1).
car(moskv,3000,blue,5).
car(volga,15000,black,1).
car(volga,8000,white,6).
car('UAZ',9000,green,3).
car('VAZ',6000,white,4).
car('VAZ',4000,blue,10).
car('VAZ-2108',8000,grey,2).
buy(W,X):-car(W,Y,U,Z),(U==green;U==blue),Z<3, Y<X.
