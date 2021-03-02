%1
max(X,Y,X):-X>Y,!.
max(_,Y,Y).

%2
max(X,Y,U,Z):-max(X,Y,C),max(U,C,Z).

%3
fact(0,1):-!.
fact(N,X):-C is N-1,fact(C,X1),X is N*X1.

%4
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

%5
fib(N,X):-N=1,X is 1,!.
fib(N,X):-fib(N,X,_).
fib(2,1,1):-!.
fib(N,X,Y):-N1 is N-1,fib(N1,X1,Y1),X is X1+Y1,Y is X1.

%6
fib1(N,X):-fib1(N,1,1,X).
fib1(2,X1,_,X1):-!.
fib1(N,X1,Y1,X):-Cur_X is X1+Y1,N1 is N-1,fib1(N1,Cur_X,X1,X).

%9
max_num_up(0,0):-!.
max_num_up(N,X1):-N1 is N div 10,max_num_up(N1,X),(X<N mod 10 -> X1 is N mod 10;X1 is X).

%10
max_num_down(N,X):-max_num_down(N,0,X).
max_num_down(0,Cur_X,Cur_X):-!.
max_num_down(N,Cur_X,X):-X1 is N mod 10,Cur_X<X1,N1 is N div 10,max_num_down(N1,X1,X),!.
max_num_down(N,Cur_X,X):-N1 is N div 10,max_num_down(N1,Cur_X,X).

%11
min_num_up(0,10):-!.
min_num_up(N,X1):-N1 is N div 10,min_num_up(N1,X),N2 is N mod 10,((1 is N2 mod 2,X>N2)->X1 is N2;X1 is X).

min_num_down(N,X):-min_num_down(N,10,X1),(X1=10->fail;X is X1).
min_num_down(0,Cur_X,Cur_X):-!.
min_num_down(N,Cur_X,X):-N1 is N div 10,N2 is N mod 10,1 is N2 mod 2,Cur_X>N2,min_num_down(N1,N2,X),!.
min_num_down(N,Cur_X,X):-N1 is N div 10,min_num_down(N1,Cur_X,X).

%12_2
prost(X):-prost(X,2).
prost(X,X):-!.
prost(X,I):-not(0 is X mod I),I1 is I+1,prost(X,I1),!.
prost(_,_):-fail.

%12_1
nod(X1,X2,_):-(X1 is 0;X2 is 0),!,fail.
nod(X1,X2,X2):-X1>X2,0 is X1 mod X2,!.
nod(X1,X2,N):-X1>X2,X3 is X1 mod X2,nod(X3,X2,N),!.
nod(X1,X2,X1):-0 is X2 mod X1,!.
nod(X1,X2,N):-X3 is X2 mod X1,nod(X1,X3,N),!.

%12_3
kolvo_del(N,X):-kolvo_del(N,1,1,X).
kolvo_del(N,N,Cur_X,Cur_X):-!.
kolvo_del(N,I,Cur_X,X):-0 is N mod I,X1 is Cur_X+1,I1 is I+1,kolvo_del(N,I1,X1,X),!.
kolvo_del(N,I,Cur_X,X):-I1 is I+1,kolvo_del(N,I1,Cur_X,X),!.

%13

%14

kolvo_del_up3(N,X):-kolvo_del_up3(N,N,X).
kolvo_del_up3(_,0,0):-!.
kolvo_del_up3(N,I,X):-I1 is I-1,kolvo_del_up3(N,I1,X1),((0 is N mod I,not(0 is I mod 3))->X is X1+1;X is X1).

