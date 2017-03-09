%member(_name, age, pay)
:-dynamic(member/3).
member('Ivanov', 15, p).
member('Ivanov', 33, np).
member('Hromov', 40, np).
payment(Age, rub(1)):-Age<18.
payment(Age, rub(2)):-Age>=18.
add_member(Mem):-assert(Mem).
print_info(member(Name, Age, PayInfo)):-member(Name, Age, PayInfo),payment(Age, Cost),write(member(Name, Age, Cost, PayInfo)),nl,fail.
print_info(_).
del_member(Mem):-retractall(Mem).
paid(member(Name, Age)):-retract(member(Name, Age, np)),assert(member(Name, Age, p)).

%6_1
/*
add_member(member('Pronin', 45, p)).
add_member(member('Sidorov', 27, np)).
add_member(member('Danilov', 12, np)).
add_member(member('Ivanov', 15, np)).
add_member(member('Ivanov', 33, np)).
add_member(member('Hromov', 40, np)).
*/

%6_2
/*
paid(member('Hromov', 40)),print_info(_).
print_info(member(_, _, np)).
del_member(member(_, _, np)),print_info(_).
*/

%6_3

start_counter(Name,Start):-retractall(conter(Name,_)),assert(counter(Name,Start)).
inc_counter(Name,Incr):-retract(counter(Name,Val)),New_val is Val+Incr,assert(counter(Name,New_val)).
free_counter(Name,Val):-retract(counter(Name,Val)).

count_members(member(Name,Age,Payinfo),_):-start_counter(num_mem,0),member(Name,Age,Payinfo),inc_counter(num_mem,1),fail.
count_members(_,Counter):-free_counter(num_mem,Counter).
menu:-repeat,nl,nl,write('MENU'),nl,
    write('1. Members info'),nl,
    write('2. Number of members'),nl,
    write('3. Add a member'),nl,
    write('0. EXIT'),nl,nl,
    write('Input number'),
    read(X),
    getmenu(X).
getmenu(0):-!.
getmenu(X):-menunum(X),fail.
menunum(1):-nl,write('Members:'),nl,print_info(_),!.
menunum(2):-nl,count_members(member(_,_,_),Num),write('Number of members = '),write(Num),nl,!.
menunum(3):-nl,write('Input new member info'),nl,write('Name'),read(Name),write('Age'),read(Age),write('Paid'),read(Payinfo),add_member(member(Name,Age,Payinfo)),!.
menunum(_):-write('No such number'),nl,!.
