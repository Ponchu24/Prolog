get_code:-read_str(Str,_),write(Str).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|T1]):-in_list_exlude(T,El,T1).

del_all([],_,[]):-!.
del_all([H|T],El,[H|T1]):-H\=El,del_all(T,El,T1),!.
del_all([_|T],El,T1):-del_all(T,El,T1).

%1.1. ���� ���������. ��������� ��� ���������� � ������������ �� k
% ���������.

pr1_1:-read_str(A,_),read(K),k_arr_rep(A,K,[]).

k_arr_rep(_,0,Perm):-write_str(Perm),nl,!,fail.
k_arr_rep(A,N,Perm):-in_list(A,El),N1 is N-1,k_arr_rep(A,N1,[El|Perm]).

%1.2. ���� ���������. ��������� ��� ������������.

pr1_2:-read_str(A,_),perm(A,[]).

perm([],Perm):-write_str(Perm),nl,!,fail.
perm(A,Perm):-in_list_exlude(A,El,A1),perm(A1,[El|Perm]).

%1.3. ���� ���������. ��������� ��� ���������� �� k ���������.

pr1_3:-read_str(A,_),read(K),k_arr(A,K,[]).

k_arr(_,0,Perm):-write_str(Perm),nl,!,fail.
k_arr(A,N,Perm):-in_list_exlude(A,El,A1),N1 is N-1,k_arr(A1,N1,[El|Perm]).

%1.4. ���� ���������. ��������� ��� ������������.

pr1_4:-read_str(A,_),sub(A,Sub),write_str(Sub),nl,fail.

sub([],[]).
sub([H|List],[H|Sub]):-sub(List,Sub).
sub([_|List],Sub):-sub(List,Sub).

%1.5. ���� ���������. ��������� ��� ��������� �� k ���������.

pr1_5:-read_str(A,_),read(K),k_perm(A,K,K_perms),write_str(K_perms),nl,fail.

k_perm(_,0,[]):-!.
k_perm([H|List],K,[H|Sub]):-K1 is K-1,k_perm(List,K1,Sub).
k_perm([_|List],K,Sub):-k_perm(List,K,Sub).

%1.6. ���� ���������. ��������� ��� ��������� � ������������.

pr1_6:-read_str(A,_),read(K),k_perm_rep(A,K,K_perms),write_str(K_perms),nl,fail.

k_perm_rep(_,0,[]):-!.
k_perm_rep([H|List],K,[H|Sub]):-K1 is K-1,k_perm_rep([H|List],K1,Sub).
k_perm_rep([_|List],K,Sub):-k_perm_rep(List,K,Sub).

%2. ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 5, �
% ������� ����� ��� ����� a. ����� � ����.

pr2:-A=[a,b,c,d,e,f],tell('C:/Users/HP/Documents/Prolog/lab9files/2.txt'),not(word_2a(A,5,[])),told.

word_2a(_,0,Perm):-!,count_symb(Perm,a,C),C=2,write_str(Perm),nl,fail.
word_2a(A,N,Perm):-in_list(A,El),N1 is N-1,word_2a(A,N1,[El|Perm]).

%3. ������� 3 ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 5, �
% ������� ����� 2 ����� a, ��������� ����� �� �����������. ����� � ����.

pr3:-A=[a,b,c,d,e,f],tell('C:/Users/HP/Documents/Prolog/lab9files/3.txt'),not(word_2a_only(A,5,[])),told.

word_2a_only(_,0,Perm):-!,count_symb(Perm,a,C),C=2,del_all(Perm,a,Perm1),is_set(Perm1),write_str(Perm),nl,fail.
word_2a_only(A,N,Perm):-in_list(A,El),N1 is N-1,word_2a_only(A,N1,[El|Perm]).

count_symb(Str,Symb,Res):-count_symb(Str,Symb,0,Res),!.
count_symb([],_,Res,Res):-!.
count_symb([H|T],H,Cur_res,Res):-Cur_res1 is Cur_res+1,count_symb(T,H,Cur_res1,Res),!.
count_symb([_|T],S,Cur_res,Res):-count_symb(T,S,Cur_res,Res).






