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

%1.1. ��� ����. ��������� �� ����� ������ � ������� ����� ����������
% ������.
pr1_1:-see('C:/Users/HP/Documents/Prolog/lab_8.txt'),read_list_str(_, LengthList),seen,max_member(Max,LengthList),write(Max).

%1.2. ��� ����. ����������, ������� � ����� �����, �� ����������
% �������.
pr1_2:-see('C:/Users/HP/Documents/Prolog/lab_8.txt'),read_list_str(ListStr,_),seen,pr1_2(ListStr,Res),write(Res).

pr1_2(ListStr,Res):-pr1_2(ListStr,0,Res).
pr1_2([],Res,Res):-!.
pr1_2([H|T],Cur_res,Res):-not(member(32,H)),Cur_res1 is Cur_res+1,pr1_2(T,Cur_res1,Res),!.
pr1_2([_|T],Cur_res,Res):-pr1_2(T,Cur_res,Res).

%1.3. ��� ����, ����� � ������� �� ����� ������ �� ������, � ������� ����
% � ������, ��� � ������� �� ������.

pr1_3:-see('C:/Users/HP/Documents/Prolog/lab_8.txt'),read_list_str(ListStr,_),seen,count_A_list(ListStr,Count_A_list),sum_list(Count_A_list,Sum),length(ListStr,Lenght),Sr is Sum/Lenght,pr1_3_write(ListStr,Count_A_list,Sr).

pr1_3_write([],[],_):-!.
pr1_3_write([H|T],[HA|TA],Sr):-HA>Sr,write_str(H),nl,pr1_3_write(T,TA,Sr),!.
pr1_3_write([_|T],[_|TA],Sr):-pr1_3_write(T,TA,Sr).

count_A_list(ListStr,Res):-count_A_list(ListStr,[],Res).
count_A_list([],Res,Res):-!.
count_A_list([H|T],Cur_res,Res):-count_A(H,Count_A),append(Cur_res,[Count_A],Cur_res1),count_A_list(T,Cur_res1,Res).

count_A(Str,Res):-count_A(Str,0,Res).
count_A([],Res,Res):-!.
count_A([H|T],Cur_res,Res):-H=65,Cur_res1 is Cur_res+1,count_A(T,Cur_res1,Res),!.
count_A([_|T],Cur_res,Res):-count_A(T,Cur_res,Res).

%1.4. ��� ����, ������� ����� ������ �����.

pr1_4:-see('C:/Users/HP/Documents/Prolog/lab_8.txt'),read_list_str(ListStr),seen,add_enter(ListStr,ListStr1),append(ListStr1,Str),pr1_4(Str,0,[],Res),write_str(Res).

add_enter(ListStr,Res):-add_enter(ListStr,[],Res).
add_enter([],Res,Res):-!.
add_enter([H|T],Cur_res,Res):-append(H,[10],H1),append(Cur_res,[H1],Cur_res1),add_enter(T,Cur_res1,Res).

pr1_4([],_,Res,Res):-!.
pr1_4(Str,Cur_count,Cur_word,Res):-skip_space_marks(Str,Str1),get_word(Str1,Word,Str2),numb_same_words(Word,Str1,Count),(Count>Cur_count->pr1_4(Str2,Count,Word,Res);pr1_4(Str2,Cur_count,Cur_word,Res)).

skip_space_marks([H|T],Str1):-(H=32;H=40;H=41;H=43;H=44;H=46;H=47;H=10),skip_space_marks(T,Str1),!.
skip_space_marks(Str1,Str1).

get_word([],[],[]):-!.
get_word(Str,Word,Str2):-get_word(Str,[],Word,Str2).
get_word([],Word,Word,[]).
get_word([H|T],Word,Word,T):-(H=32;H=40;H=41;H=43;H=44;H=46;H=47;H=10),!.
get_word([H|T],Word,Word1,Str2):-append(Word,[H],Word2),get_word(T,Word2,Word1,Str2).

numb_same_words(Word,Str,Count):-numb_same_words(Word,Str,1,Count),!.
numb_same_words(_,[],Count,Count):-!.
numb_same_words(Word,Str,Cur_count,Count):-skip_space_marks(Str,Str1),get_word(Str1,Word1,Str2),(Word=Word1->Cur_count1 is Cur_count+1,numb_same_words(Word,Str2,Cur_count1,Count);numb_same_words(Word,Str2,Cur_count,Count)).

%1.5. ��� ����, ������� � ��������� ���� ������, ��������� �� ����, ��
% ������������� � �������� �����.

pr1_5:-see('C:/Users/HP/Documents/Prolog/lab_8.txt'),read_list_str(ListStr),seen,add_enter(ListStr,ListStr1),append(ListStr1,Str),tell('C:/Users/HP/Documents/Prolog/lab_8#1_5.txt'),pr1_5_write(ListStr,Str),told.

check:-read_str(Str,_,_),write(Str).

pr1_5_write([],_):-!.
pr1_5_write([H|T],All_str):-pr1_5_repeat_check(H,All_str),write_str(H),nl,pr1_5_write(T,All_str),!.
pr1_5_write([_|T],All_str):-pr1_5_write(T,All_str).

pr1_5_repeat_check([],_):-!.
pr1_5_repeat_check(Str,All_str):-skip_space_marks(Str,Str1),get_word(Str1,Word,Str2),numb_same_words(Word,All_str,Count),Count=2,pr1_5_repeat_check(Str2,All_str).

%2.5. ���� ������. ���������� ���������� ��� ������� ������ � ���������
% �������.

pr2_5:-read_str(Str,_,_),random_permutation(Str,Str1),write_str(Str1).

%2.7. ���� ������, ��������� �� �������� ��������. ���������� ���������,
% �������� �� ��������� ������� ���� ������ ���������.

pr2_7:-read_str(Str,_,_),get_prop(Str,Str1),reverse(Str1,Rev_Str1),Str1=Rev_Str1.

get_prop(Str,Res):-get_prop(Str,[],Res).
get_prop([],Res,Res):-!.
get_prop([H|T],Cur_res,Res):-H>=65,H=<90,append(Cur_res,[H],Cur_res1),get_prop(T,Cur_res1,Res),!.
get_prop([_|T],Cur_res,Res):-get_prop(T,Cur_res,Res).

%2.14. ���� ������ � ������� �������� ����� ����� ������. ����������
% ����������� ����� �� ���������� ���� � ������ �����.

pr2_14:-read_str(Str,_,_),split(Str,Str1),bubble(Str1,Res),write_list_str(Res).

split(Str,Res):-split(Str,[],Res).
split([],Res,Res):-!.
split(Str,Cur_res,Res):-get_word_space(Str,Word,Str1),append(Cur_res,[Word],Cur_res1),split(Str1,Cur_res1,Res),!.

get_word_space([],[],[]):-!.
get_word_space(Str,Word,Str2):-get_word_space(Str,[],Word,Str2).
get_word_space([],Word,Word,[]).
get_word_space([H|T],Word,Word,T):-H=32,!.
get_word_space([H|T],Word,Word1,Str2):-append(Word,[H],Word2),get_word_space(T,Word2,Word1,Str2).

bubble_iter([X,Y|T],[Y,X|T]) :- length(X, LengthX), length(Y, LengthY), LengthX > LengthY, !.
bubble_iter([X|T],[X|T1]) :- bubble_iter(T, T1).
bubble(List,List_res) :- bubble_iter(List, List1), bubble(List1,List_res),!.
bubble(List,List):-!.

%4.5. ���� ������. ���������� ����� ���������� ���������� ������
% ������ �������� ���������.

pr4_5:-read_str(Str,_,_),pr4_5(Str,Res),write(Res).

pr4_5(Str,Res):-pr4_5(Str,0,0,Res).
pr4_5([],I,Cur_res,Res):-I>Cur_res->Res is I;Res is Cur_res,!.
pr4_5([H|T],I,Cur_res,Res):-H>=1040,H=<1103->I1 is I+1,pr4_5(T,I1,Cur_res,Res),!.
pr4_5([_|T],I,Cur_res,Res):-I>Cur_res->Cur_res1 is I,pr4_5(T,0,Cur_res1,Res);pr4_5(T,0,Cur_res,Res).
