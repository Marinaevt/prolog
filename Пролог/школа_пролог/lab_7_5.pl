�����������(_x,[_x|_]).
�����������(_x,[_|_�����]):-�����������(_x,_�����).

�����1([],_,[]).
�����1([_x|_l],_h,[_x|_l1]):-�����������(_x,_h),!,�����1(_l,_h,_l1).
�����1([_|_l],_h,_l1):-�����1(_l,_h,_l1).

