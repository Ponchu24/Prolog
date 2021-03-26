write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

%1. Дана строка. Вывести ее три раза через запятую и показать количество символов в ней.
pr1:-read_str(List,Length),write_str(List),write(", "),write_str(List),write(", "),write_str(List),nl,write("Lenght = "),write(Length).

%2. Дана строка. Найти количество слов.
pr2:-read_str(List,_),count_words(List,0,K),write(K),!.
count_words([],K,K):-!.
count_words(Str,I,K):-skip_space_marks(Str,Str1),get_word(Str1,Word,Str2),Word\=[],I1 is I+1,count_words(Str2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],Str1):-skip_space(T,Str1),!.
skip_space(Str1,Str1).

skip_space_marks([H|T],Str1):-(H=32;H=40;H=41;H=43;H=44;H=46;H=47),skip_space_marks(T,Str1),!.
skip_space_marks(Str1,Str1).

get_word([],[],[]):-!.
get_word(Str,Word,Str2):-get_word(Str,[],Word,Str2).
get_word([],Word,Word,[]).
get_word([H|T],Word,Word,T):-(H=32;H=40;H=41;H=43;H=44;H=46;H=47),!.
get_word([H|T],Word,Word1,Str2):-append(Word,[H],Word2),get_word(T,Word2,Word1,Str2).

%3. Дана строка, определить самое частое слово.

pr3:-read_str(Str,_),pr3(Str,0,[],Res),write_str(Res).
pr3([],_,Res,Res):-!.
pr3(Str,Cur_count,Cur_word,Res):-skip_space_marks(Str,Str1),get_word(Str1,Word,Str2),numb_same_words(Word,Str1,Count),(Count>Cur_count->pr3(Str2,Count,Word,Res);pr3(Str2,Cur_count,Cur_word,Res)).
numb_same_words(Word,Str,Count):-numb_same_words(Word,Str,1,Count),!.
numb_same_words(_,[],Count,Count):-!.
numb_same_words(Word,Str,Cur_count,Count):-skip_space_marks(Str,Str1),get_word(Str1,Word1,Str2),(Word=Word1->Cur_count1 is Cur_count+1,numb_same_words(Word,Str2,Cur_count1,Count);numb_same_words(Word,Str2,Cur_count,Count)).

%4. Дана строка. Вывести первые три символа и последний три символа,
% если длина строки больше 5 Иначе вывести первый символ столько
% раз, какова длина строки.

swap_list([H|T],Res_list):-swap_list([H|T],[],Res_list).
swap_list([],Cur_list,Cur_list):-!.
swap_list([H|T],Cur_list,Res_list):-swap_list(T,[H|Cur_list],Res_list).

pr4:-read_str(Str,Lenght),(Lenght>5->pr4_more5(Str,Res),write_str(Res);pr4_less5(Str,Lenght)).

pr4_more5(Str,Res):-get_3first(Str,First3),swap_list(Str,Str1),get_3first(Str1,Swapped_last3),swap_list(Swapped_last3,Last3),append(First3,Last3,Res).

pr4_less5(_,0):-!.
pr4_less5([H|_],I):-write_str([H]),I1 is I-1,pr4_less5([H],I1).

get_3first(Str,Res):-get_3first(Str,3,[],Res).
get_3first(_,0,Res,Res):-!.
get_3first([H|T],I,Cur_res,Res):-append(Cur_res,[H],Cur_res1),I1 is I-1,get_3first(T,I1,Cur_res1,Res).

%5. Дана строка. Показать номера символов, совпадающих с последним
% символом строки.

pr5:-read_str(Str,_),get_last(Str,Last),pr5(Str,Last,1,[],Res),write(Res).
pr5([],_,_,Res,Res):-!.
pr5([H|T],Last,I,Cur_res,Res):-H=Last,append(Cur_res,[I],Cur_res1),I1 is I+1,pr5(T,Last,I1,Cur_res1,Res),!.
pr5([_|T],Last,I,Cur_res,Res):-I1 is I+1,pr5(T,Last,I1,Cur_res,Res).

get_last(Str,Res):-swap_list(Str,[H|_]),Res is H.

%6. Дана строка. Показать третий, шестой, девятый и так далее символы.

pr6:-read_str(Str,_),pr6(Str,1,[],Res),write_str(Res).
pr6([],_,Res,Res):-!.
pr6([H|T],I,Cur_res,Res):-0 is I mod 3,append(Cur_res,[H],Cur_res1),I1 is I+1,pr6(T,I1,Cur_res1,Res),!.
pr6([_|T],I,Cur_res,Res):-I1 is I+1,pr6(T,I1,Cur_res,Res).

%7. Дана строка. Определите общее количество символов '+' и '-' в ней. А
% так же сколько таких символов, после которых следует цифра ноль.

pr7:-read_str(Str,_),count_plus_minus(Str,Res1),count_before_zero(Str,Res2),write("Count of pluses and minuses: "),write(Res1),nl,write("Count of symbols followed by zero: "),write(Res2).

count_plus_minus(Str,Res):-count_plus_minus(Str,0,Res).
count_plus_minus([],Res,Res):-!.
count_plus_minus([H|T],Cur_res,Res):-(H=43;H=45),Cur_res1 is Cur_res+1,count_plus_minus(T,Cur_res1,Res),!.
count_plus_minus([_|T],Cur_res,Res):-count_plus_minus(T,Cur_res,Res).

count_before_zero(Str,Res):-count_before_zero(Str,0,Res).
count_before_zero([],Res,Res):-!.
count_before_zero([_|[48|T]],Cur_res,Res):-Cur_res1 is Cur_res+1,count_before_zero([48|T],Cur_res1,Res),!.
count_before_zero([_|T],Cur_res,Res):-count_before_zero(T,Cur_res,Res).

%8. Дана строка. Определите, какой символ в ней встречается раньше:
% 'x'(120) или 'w'(119). Если какого-то из символов нет, вывести
% сообщение об этом.

list_el_numb(List,El,Num):-list_el_numb(List,El,0,Num).
list_el_numb([H|_],H,Num,Num):-!.
list_el_numb([_|T],El,I,Num):-I1 is I+1,list_el_numb(T,El,I1,Num).

pr8:-read_str(Str,_),find_x(Str,Num_x),find_w(Str,Num_w),(Num_x<Num_w -> write("x");write("w")).

find_x(Str,Num):-list_el_numb(Str,120,Num),!.
find_x(_,_):-write("\"x\" not found"),fail.
find_w(Str,Num):-list_el_numb(Str,119,Num),!.
find_w(_,_):-write("\"w\" not found"),fail.

%9. Даны две строки. Вывести большую по длине строку столько раз, на
% сколько символов отличаются строки.

pr9:-read_str(Str1,Lenght1),read_str(Str2,Lenght2),(Lenght1>Lenght2 -> Diff is Lenght1-Lenght2, write_I_times(Str1,Diff);Diff is Lenght2-Lenght1, write_I_times(Str2,Diff)).

write_I_times(_,0):-!.
write_I_times(Str,I):-write_str(Str),nl,I1 is I-1,write_I_times(Str,I1).

%10. Дана строка. Если она начинается на 'abc', то заменить их на 'www',
% иначе добавить в конец строки 'zzz'.

pr10:-read_str(Str,_),(pr10_abc(Str) -> change_first_www(Str,Res);append(Str,[122,122,122],Res)),write_str(Res).

change_first_www(Str,Res):-change_first_www(Str,3,Res).
change_first_www(Str,0,Res):-append([119,119,119],Str,Res),!.
change_first_www([_|T],I,Res):-I1 is I-1,change_first_www(T,I1,Res).

pr10_abc([97|[98|[99|_]]]).
%pr10_a([97|T]):-pr10_b(T).
%pr10_b([98|T]):-pr10_c(T).
%pr10_c([99|_]).

%11. Дана строка. Если ее длина больше 10, то оставить в строке только
% первые 6 символов, иначе дополнить строку символами 'o' до длины 12.

pr11:-read_str(Str,Lenght),(Lenght>10 -> get_6first(Str,Res);pr11_less_10(Str,Res)),write_str(Res).

lenght([_|T],Res):-lenght([_|T],0,Res).
lenght([],I,I):-!.
lenght([_|T],I,Res):-I1 is I+1,lenght(T,I1,Res).

get_6first(Str,Res):-get_6first(Str,6,[],Res).
get_6first(_,0,Res,Res):-!.
get_6first([H|T],I,Cur_res,Res):-append(Cur_res,[H],Cur_res1),I1 is I-1,get_6first(T,I1,Cur_res1,Res).

pr11_less_10(Str,Res):-add_o(Str,Str1),lenght(Str1,Lenght),(Lenght<12->pr11_less_10(Str1,Res);Res = Str1).
add_o(Str,Res):-append([111],Str,Res).

