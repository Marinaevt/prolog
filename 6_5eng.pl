:-dynamic(lesson/1).
lesson('Math').
lesson('Physics').
lesson('Inform').

add_lesson(Less):-assertz(Less).
add_student(Name,lesson(Less),ExMark,ExMark2):-assertz(student(Name,lesson(Less),ExMark,ExMark2)).

start_counter(Name,Start):-retractall(conter(Name,_)),assertz(counter(Name,Start)).
inc_counter(Name,Incr):-retract(counter(Name,Val)),New_val is Val+Incr,assertz(counter(Name,New_val)).
free_counter(Name,Val):-retract(counter(Name,Val)).

count_lessons(lesson(Less),_):-start_counter(num_less,0),lesson(Less),inc_counter(num_less,1),fail.
count_lessons(_,Counter):-free_counter(num_less,Counter).

print_lessons(lesson(Less)):-lesson(Less),write(lesson(Less)),nl,fail.
print_lessons(_).
print_students(student(Name,lesson(Less),ExMark,ExMark2)):-student(Name,lesson(Less),ExMark,ExMark2),write(student(Name,lesson(Less),ExMark,ExMark2)),nl,fail.
print_students(_).

del_lesson(Less):-retractall(Less).

menu:-repeat,nl,nl,write('MENU'),nl,
    write('1. Add lessons'),nl,
    write('2. Add student'),nl,
    write('3. Number of existing lessons'),nl,
    write('4. List of existing lessons'), nl,
    write('5. Show all students'), nl,
    write('6. Delete all with bad marks'),nl,
    write('7. Show all with bad marks'), nl,
    write('8. Mean mark by lesson'), nl,
    write('9. Whos gonna have scholarship'), nl,
    write('10. Delete student'), nl,
    write('11. Number of students'), nl,
    write('12. Change student mark for exam'), nl,
    write('13. Change student mark for exam second try'), nl,
    write('14. Delete lesson'), nl,
    write('0. EXIT'),nl,nl,
    write('Input number'),
    read(X),
    getmenu(X).
getmenu(0):-!.
getmenu(X):-menunum(X),fail.
menunum(1):-nl,write('Adding lessons until stop input'),repeat,read(X),add_lesson(lesson(X)), retract(lesson(stop)), X=stop,!.
menunum(2):-nl,write('Adding students until stop input'),write('Name'),read(Name),repeat,write('Lesson'),read(Less),write('Mark exam'),read(ExMark),write('Retake mark'),read(Remark),add_student(Name, lesson(Less), ExMark, Remark),write('Add more lessons? y/n'), read(X), X = n,!.
menunum(3):-nl,write('Number of existing lessons = '),count_lessons(lesson(_),Num),write(Num),!.
menunum(4):-nl, print_lessons(_),!.
menunum(5):-nl,print_students(student(_,_,_,_)),!.
menunum(14):-nl,write('Name of lesson you want to delete?'),read(X),del_lesson(lesson(X)),!.
/*
menunum(2):-nl,count_members(member(_,_,_),Num),write('Number of members = '),write(Num),nl,!.
menunum(3):-nl,write('Input new member info'),nl,write('Name'),read(Name),write('Age'),read(Age),write('Paid'),read(Payinfo),add_member(member(Name,Age,Payinfo)),!.
menunum(4):-nl,write('Input member info to delete'),nl,write('Name'),read(Name),write('Age'),read(Age),del_member(member(Name,Age,_)),!.
menunum(5):-nl,write('Input member info to add payment'),nl,write('Name'),read(Name),write('Age'),read(Age),paid(member(Name, Age)),!.
menunum(6):-nl,write('All who havent paid deleted'),del_member(member(_, _, np)),nl,write('who is still here:'), nl, print_info(_),!.
menunum(7):-nl,write('List of ones who never paid:'),nl,print_info(member(_, _, np)),!.
menunum(_):-write('No such number'),nl,!.



*/








/*

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

%6_3 and 6_4


start_counter(Name,Start):-retractall(conter(Name,_)),assert(counter(Name,Start)).
inc_counter(Name,Incr):-retract(counter(Name,Val)),New_val is Val+Incr,assert(counter(Name,New_val)).
free_counter(Name,Val):-retract(counter(Name,Val)).

count_members(member(Name,Age,Payinfo),_):-start_counter(num_mem,0),member(Name,Age,Payinfo),inc_counter(num_mem,1),fail.
count_members(_,Counter):-free_counter(num_mem,Counter).
menu:-repeat,nl,nl,write('MENU'),nl,
    write('1. Members info'),nl,
    write('2. Number of members'),nl,
    write('3. Add a member'),nl,
    write('4. Delete member'), nl,
    write('5. Add a payment info'), nl,
    write('6. Delete all who havent paid'),nl,
    write('7. Who havent paid'), nl,
    write('0. EXIT'),nl,nl,
    write('Input number'),
    read(X),
    getmenu(X).
getmenu(0):-!.
getmenu(X):-menunum(X),fail.
menunum(1):-nl,write('Members:'),nl,print_info(_),!.
menunum(2):-nl,count_members(member(_,_,_),Num),write('Number of members = '),write(Num),nl,!.
menunum(3):-nl,write('Input new member info'),nl,write('Name'),read(Name),write('Age'),read(Age),write('Paid'),read(Payinfo),add_member(member(Name,Age,Payinfo)),!.
menunum(4):-nl,write('Input member info to delete'),nl,write('Name'),read(Name),write('Age'),read(Age),del_member(member(Name,Age,_)),!.
menunum(5):-nl,write('Input member info to add payment'),nl,write('Name'),read(Name),write('Age'),read(Age),paid(member(Name, Age)),!.
menunum(6):-nl,write('All who havent paid deleted'),del_member(member(_, _, np)),nl,write('who is still here:'), nl, print_info(_),!.
menunum(7):-nl,write('List of ones who never paid:'),nl,print_info(member(_, _, np)),!.
menunum(_):-write('No such number'),nl,!.

*/
