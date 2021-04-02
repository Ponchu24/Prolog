read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|T1]):-in_list_exlude(T,El,T1).

%1.1. Дано множество. Построить все размещения с повторениями по k
% элементов.

pr1_1:-read_str(A,_),read(K),k_perm_rep(A,K,[]).
k_perm_rep(_,0,Perm):-write_str(Perm),nl,!,fail.
k_perm_rep(A,N,Perm):-in_list(A,El),N1 is N-1,k_perm_rep(A,N1,[El|Perm]).

%1.2. Дано множество. Построить все перестановки.

pr1_2:-read_str(A,_),perm(A,[]).
perm([],Perm):-write_str(Perm),nl,!,fail.
perm(A,Perm):-in_list_exlude(A,El,A1),perm(A1,[El|Perm]).

