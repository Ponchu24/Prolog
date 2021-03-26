write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

%1
pr1:-read_str(List,Length),write_str(List),write(", "),write_str(List),write(", "),write_str(List),nl,write("Lenght = "),write(Length).

pr2:-read_str(List,_),count_words(List,0,K),write(K),!.
count_words([],K,K):-!.
count_words(Str,I,K):-skip_space_marks(Str,Str1),catch_word(Str1,Word,Str2),Word\=[],I1 is I+1,count_words(Str2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],Str1):-skip_space(T,Str1),!.
skip_space(Str1,Str1).

skip_space_marks([H|T],Str1):-(H=32;H=40;H=41;H=43;H=44;H=46;H=47),skip_space_marks(T,Str1),!.
skip_space_marks(Str1,Str1).

catch_word([],[],[]):-!.
catch_word(Str,Word,Str2):-catch_word(Str,[],Word,Str2).
catch_word([],Word,Word,[]).
catch_word([H|T],Word,Word,T):-(H=32;H=40;H=41;H=43;H=44;H=46;H=47),!.
catch_word([H|T],Word,Word1,Str2):-append(Word,[H],Word2),catch_word(T,Word2,Word1,Str2).
