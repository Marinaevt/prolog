:-dynamic(lesson/1).
lesson('Math').
lesson('Physics').
lesson('Inform').
:-dynamic(student/4).
student('Pupkin', lesson('Inform'), 10, 0).
student('Ivanov', lesson('Physics'), 1, 1).
student('Ivanov', lesson('Math'), 7, 0).
student('Sidorov', lesson('Math'), 4, 0).
student('Sidorov', lesson('Physics'), 7, 0).
add_lesson(Less):-assertz(Less).
add_student(Name,lesson(Less),ExMark,ExMark2):-assertz(student(Name,lesson(Less),ExMark,ExMark2)).

start_counter(Name,Start):-retractall(counter(Name,_)),assert(counter(Name,Start)).
inc_counter(Name,Incr):-retract(counter(Name,Val)),New_val is Val+Incr,assert(counter(Name,New_val)).
free_counter(Name,Val):-retract(counter(Name,Val)).

count_lessons(lesson(Less),_):-start_counter(num_less,0),lesson(Less),inc_counter(num_less,1),fail.
count_lessons(_,Counter):-free_counter(num_less,Counter).

count_students(student(Name,Less,X,Y),_):-start_counter(num_st,0),student(Name,Less,X,Y),inc_counter(num_st,1),fail.
count_students(_,Counter):-free_counter(num_st,Counter).

print_lessons(lesson(Less)):-lesson(Less),write(lesson(Less)),nl,fail.
print_lessons(_).
print_students(student(Name,lesson(Less),ExMark,ExMark2)):-student(Name,lesson(Less),ExMark,ExMark2),write(student(Name,lesson(Less),ExMark,ExMark2)),nl,fail.
print_students(_).

del_lesson(Less):-retractall(Less).
del_students(St):-retractall(St).

passed(ExMark,Remark):-ExMark>=4;Remark>=4.
start_mark(Name1, Start1):-retractall(counter(Name1,_)),assert(counter(Name1,Start1)).
inc_mark(Name1, Start1):-retract(counter(Name1,Val1)), NewVal1 is Val1+Start1,assert(counter(Name1,NewVal1)).
free_mark(Name,Val):-retract(counter(Name,Val)).
sum_mark(Less, _):-count_students(student(_,Less,_,_), Num),start_mark(mark,0),student(_,Less,Y,_),inc_mark(mark,Y/Num),fail.
sum_mark(_,Counter):-free_mark(mark, Counter).

name_mark(Name,_):-count_students(student(Name,_,_,_), Num),start_mark(mark,0),student(Name,_,Y,_),inc_mark(mark,Y/Num),fail.
name_mark(_,Counter):-free_mark(mark, Counter).

max_mark(Z,X):-student(Y,_,_,_),name_mark(Y,X1),student(Z,_,_,_),name_mark(Z,X), not(X>X1).


scholar(Nn):-student(Nn,_,X,_), X<6.

pass_exam(student(Name,lesson(X),Exam,_)):-retract(student(Name,lesson(X),_,Y)),assertz(student(Name,lesson(X),Exam,Y)).

pass_retake(student(Name,lesson(X),_,Retake)):-retract(student(Name,lesson(X),Y,_)),assertz(student(Name,lesson(X),Y,Retake)).

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
    write('15. Mean by student'), nl,
    write('16. Max mean by student'),nl,
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
menunum(6):-nl,write('Delete students with bad marks'),student(Name,_,X,Y),not(passed(X,Y)),del_students(student(Name,_,_,_)),fail.
menunum(7):-nl,write('Students with bad marks'),nl,student(Name,_,X,Y),not(passed(X,Y)),print_students(student(Name,_,_,_)),fail.
menunum(8):-nl,write('Mean mark by lesson:'),read(Less),sum_mark(lesson(Less),Y),write(Y),!.
menunum(9):-nl,write('They are gonna have scholarship'), nl,student(Name,_,_,_),not(scholar(Name)),print_students(student(Name,_,_,_)),fail.
menunum(10):-nl,write('Input name'),read(Name),student(Name,_,_,_),del_students(student(Name,_,_,_)),!.
menunum(11):-nl,write('Number of students:'),count_students(students(_,_,_,_),Num),write(Num),!.
menunum(12):-nl,write('Change exam mark for:'),nl,write('Name'),read(Name),write('lesson'),read(LS),write('new mark'),read(Exam),pass_exam(student(Name, lesson(LS), Exam, _)),!.
menunum(13):-nl,write('Change retake mark for:'),nl,write('Name'),read(Name),write('lesson'),read(LS),write('new mark'),read(Remark),pass_retake(student(Name,lesson(LS),_,Remark)).
menunum(14):-nl,write('Name of lesson you want to delete?'),read(X),del_lesson(lesson(X)),!.
menunum(15):-nl,write('Mean by student. Name:'),read(Name),name_mark(Name,Y),write(Y),!.
menunum(16):-nl,write('Max mean='),max_mark(Name,_),write(Name),!.
