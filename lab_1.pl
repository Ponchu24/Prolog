
man(adrian).
man(alexandru).
man(aurel).
man(bogdan).
man(vasile).
man(viorel).
man(genadie).
man(dragosh).
man(dorin).
man(dorel).
man(emil).

woman(aurica).
woman(ioana).
woman(eudjenia).
woman(doina).
woman(luminitsa).
woman(rada).
woman(rodica).
woman(ana).
woman(alina).
woman(luchia).
woman(mihaela).

parent(adrian,dorel).
parent(adrian,dorin).
parent(adrian,rada).
parent(adrian,luminitsa).
parent(aurica,dorel).
parent(aurica,dorin).
parent(aurica,rada).
parent(aurica,luminitsa).

parent(bogdan,dragosh).
parent(bogdan,genadie).
parent(ioana,dragosh).
parent(ioana,genadie).

parent(dorel,ana).
parent(doina,ana).

parent(dragosh,alexandru).
parent(dragosh,aurel).
parent(luminitsa,alexandru).
parent(luminitsa,aurel).

parent(vasile,viorel).
parent(vasile,alina).
parent(ana,viorel).
parent(ana,alina).

parent(alexandru,rodica).
parent(alexandru,luchia).
parent(eudjenia,rodica).
parent(eudjenia,luchia).

parent(emil,doina).
parent(mihaela,doina).

men(X):-man(X),write(X),nl,fail.
women(X):-woman(X),write(X),nl,fail.

children(X):-parent(X,Y),write(Y),nl,fail.

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y),nl,fail.

son(X,Y):-parent(Y,X),man(X).
son(X):-son(Y,X),write(Y),nl,fail.

brother(X,Y):-mother(Z,X),mother(Z,Y),man(X),X\=Y.
brothers(X):-brother(Y,X),write(Y),nl,fail.

husband(X,Y):-parent(X,Z),mother(Y,Z),X\=Y.
husband(X):-husband(Y,X),write(Y),nl.

b_s(X,Y):-mother(Z,X),mother(Z,Y),X\=Y.
b_s(X):-b_s(Y,X),write(Y),nl,fail.

grand_pa(X,Y):-parent(Z,Y),parent(X,Z),not(mother(X,Z)).
grand_pas(X):-grand_pa(Y,X),write(Y),nl,fail.

grand_da(X,Y):-parent(Z,X),parent(Y,Z),woman(X).
grand_dats(X):-grand_da(Y,X),write(Y),nl,fail.

grand_pa_and_son(X,Y):-(grand_pa(X,Y),man(Y);grand_pa(Y,X),man(X)).

grand_pa_and_da(X,Y):-(grand_pa(X,Y),woman(Y);grand_pa(Y,X),woman(X)).

uncle(X,Y):-man(X),b_s(X,Z),parent(Z,Y).
uncle(X):-uncle(Y,X),write(Y),nl,fail.

w_cousen(X,Y):-woman(X),b_s(Y,Z),parent(Z,X).
w_cousens(X):-w_cousen(Y,X),write(Y),nl,fail.
