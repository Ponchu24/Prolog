%1
max(X,Y,X):-X>Y,!.
max(_,Y,Y).

%2
max(X,Y,U,Z):-max(X,Y,C),max(U,C,Z).

%2
fact(0,1):-!.
fact(N,X):-C is N-1,fact(C,X1),X is N*X1.

%3
fact1(N,X):-fact1(0,1,N,X).
fact1(N,X,N,X):-!.
fact1(I,F,N,X):-I1 is I+1,F1 is F*I1,fact1(I1,F1,N,X).

%7
sum(0,0):-!.
sum(N,X):-N1 is N div 10,sum(N1,X1),X is N mod 10+X1.

%8
sum1(N,X):-sum1(N,0,X).
sum1(0,X,X):-!.
sum1(A,X1,X):-A1 is A mod 10,A2 is A div 10,X2 is X1+A1,sum1(A2,X2,X).
