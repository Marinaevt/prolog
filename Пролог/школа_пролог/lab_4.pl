�����('����',���������).
�����('����',������(����,������)).
�����('����',����������).
�����('����',���(10000)).
�����('����',����(['���������', '����������'])).
�����('����',���������).
�����('����',�����������).
�����('����',������(����,�������)).
�����('����',������(����,������)).
�����('����',���(5500)).
�����('����',����([])).
�����('�������',���������).
�����('�������',���(500)).
�����('�������',����(['�������'])).
����(������(����,_),5000).
%?-����(������(����,�����������),_X).
����(������(����,������),6000).
����(������(����,�������),6500).
����(���������,1000).
����(�����������,800).
����(����������,600).
����(�����,3000).
����(��������,300).
����(����,100).
�����_������(_���,_���):-�����(_���,���(_������)),����(_���,_����),_������>_����,not(�����(_���,_���)).
%?-�����_������('����',_X).
�������(_���):- not(�����(_���,������(_,_))).
%?-�������('����').
%?-�������('�������').
%?-�������(_���).
%�������(_���):- �����(_���,_), not(�����(_���, ������(_,_))).
��������('����',���������������).
��������('����',�����_�������������).
��������('�������','���').
�������(_���������):-�����(_�����,���(_��������)),
                      _�������� > 5000,��������(_�����,_���������).
