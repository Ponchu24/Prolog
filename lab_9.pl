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

%1.1. Дано множество. Построить все размещения с повторениями по k
% элементов.

pr1_1:-read_str(A,_),read(K),k_arr_rep(A,K,[]).

k_arr_rep(_,0,Perm):-write_str(Perm),nl,!,fail.
k_arr_rep(A,N,Perm):-in_list(A,El),N1 is N-1,k_arr_rep(A,N1,[El|Perm]).

%1.2. Дано множество. Построить все перестановки.

pr1_2:-read_str(A,_),perm(A,[]).

perm([],Perm):-write_str(Perm),nl,!,fail.
perm(A,Perm):-in_list_exlude(A,El,A1),perm(A1,[El|Perm]).

%1.3. Дано множество. Построить все размещения по k элементов.

pr1_3:-read_str(A,_),read(K),k_arr(A,K,[]).

k_arr(_,0,Perm):-write_str(Perm),nl,!,fail.
k_arr(A,N,Perm):-in_list_exlude(A,El,A1),N1 is N-1,k_arr(A1,N1,[El|Perm]).

%1.4. Дано множество. Построить все подмножества.

pr1_4:-read_str(A,_),sub(A,Sub),write_str(Sub),nl,fail.

sub([],[]).
sub([H|List],[H|Sub]):-sub(List,Sub).
sub([_|List],Sub):-sub(List,Sub).

%1.5. Дано множество. Построить все сочетания по k элементов.

pr1_5:-read_str(A,_),read(K),k_perm(A,K,K_perms),write_str(K_perms),nl,fail.

k_perm([],0,_):-!.
k_perm([H|List],K,[H|Sub]):-K1 is K-1,k_perm(List,K1,Sub).
k_perm([_|List],K,Sub):-k_perm(List,K,Sub).

make_ar(0,[]):-!.
make_ar(K,[K|Tail]):-K1 is K-1,make_ar(K1,Tail).
