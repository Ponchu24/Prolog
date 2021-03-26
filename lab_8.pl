read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

read_list_str(List, LengthList):-read_str(A,N,Flag),read_list_str([A],List,[N],LengthList,Flag).
read_list_str(List,List,LengthList, LengthList,1):-!.
read_list_str(Cur_list,List,CurLengthList,LengthList,0):-
read_str(A,N,Flag),append(Cur_list,[A],C_l),append(CurLengthList, [N], NewLengthList),read_list_str(C_l,List,NewLengthList,LengthList,Flag).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

%1.1. Дан файл. Прочитать из файла строки и вывести длину наибольшей
% строки.
pr1_1:-see('C:/Users/HP/Documents/Prolog/lab_8.txt'),read_list_str(_, LengthList),seen,max_member(Max,LengthList),write(Max).

%1.2. Дан файл. Определить, сколько в файле строк, не содержащих
% пробелы.
pr1_2:-see('C:/Users/HP/Documents/Prolog/lab_8.txt'),read_list_str(ListStr,_),seen,pr1_2(ListStr,Res),write(Res).

pr1_2(ListStr,Res):-pr1_2(ListStr,0,Res).
pr1_2([],Res,Res):-!.
pr1_2([H|T],Cur_res,Res):-not(member(32,H)),Cur_res1 is Cur_res+1,pr1_2(T,Cur_res1,Res),!.
pr1_2([_|T],Cur_res,Res):-pr1_2(T,Cur_res,Res).
