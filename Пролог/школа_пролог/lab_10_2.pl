������(8,5,3).
��������(���������(8,0,0)).
����(���������(4,4,0)).
�������:-��������(_s),��������([_s]).
��������([_s|_p]):- ����(_s),����������_�������([_s|_p]).
��������([���������(_1,_2,_3)|_p]):-
		���������(_1,_2,_3,_n1,_n2,_n3),
		not(�����������(���������(_n1,_n2,_n3),
	          [���������(_1,_2,_3)|_p])),
		��������([���������(_n1,_n2,_n3),
		���������(_1,_2,_3)|_p]).

��������(_1,_2,_f,_n1,_n2):- �������(_1,_f,_k), _n1 is _1 - _k,_n2 is _2 + _k.

�������(_x,_y,_x):-_x=<_y,!.
�������(_x,_y,_y).

�����������(_x,[_x|_]):-!.
�����������(_x,[_y|_l]):-!,�����������(_x,_l),!.

����������_�������([]):-!.
����������_�������([_x|_l]):-����������_�������(_l),!,write(_x),nl.

%1->2

���������(_1,_2,_3,_n1,_n2,_3):-
                  _1>0,������(_v1,_v2,_v3),
                  _f is _v2-_2,
                  _f>0,
                  ��������(_1,_2,_f,_n1,_n2).



