sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

sprava_next(A,B,[A|[B|_]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).
sprava_next(_,_,[_]):-fail.


sleva_next(A,B,[B|[A|_]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).
sleva_next(_,_,[_]):-fail.

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).
%1
pr_ein:- Houses=[_,_,_,_,_],

	in_list(Houses,[red,english,_,_,_]),
	in_list(Houses,[_,spanish,_,dog,_]),
	in_list(Houses,[green,_,coffee,_,_]),
	in_list(Houses,[_,ukrain,tea,_,_]),
	sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
	in_list(Houses,[_,_,_,ulitka,old_gold]),
	in_list(Houses,[yellow,_,_,_,kool]),
	el_no(Houses,3,[_,_,milk,_,_]),
	el_no(Houses,1,[_,norway,_,_,_]),
	next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
	next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
	in_list(Houses,[_,_,orange,_,lucky]),
	in_list(Houses,[_,japan,_,_,parlament]),
	next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),
	in_list(Houses,[_,WHO1,water,_,_]),
        in_list(Houses,[_,WHO2,_,zebra,_]),
	write(Houses),nl,
	write("water - "),write(WHO1),nl,write("zebra - "),write(WHO2),!.

%2
pr5_2:-Hair=[_,_,_],

    in_list(Hair,[belokurov,_]),
    in_list(Hair,[rizhov,_]),
    in_list(Hair,[chernov,_]),
    in_list(Hair,[_,blond]),
    in_list(Hair,[_,brunette]),
    in_list(Hair,[_,red]),
    not(in_list(Hair,[belokurov,blond])),
    not(in_list(Hair,[belokurov,brunette])),
    not(in_list(Hair,[rizhov,red])),
    not(in_list(Hair,[chernov,brunette])),
    write(Hair),!.

%3

pr5_3:-Dress=[_,_,_],

    in_list(Dress,[ann,_,_]),
    in_list(Dress,[valya,_,_]),
    in_list(Dress,[natasha,_,_]),
    in_list(Dress,[_,white,_]),
    in_list(Dress,[_,green,_]),
    in_list(Dress,[_,blue,_]),
    in_list(Dress,[_,_,white]),
    in_list(Dress,[_,_,green]),
    in_list(Dress,[_,_,blue]),
    in_list(Dress,[ann,X,X]),
    not(in_list(Dress,[valya,white,_])),
    not(in_list(Dress,[valya,_,white])),
    in_list(Dress,[natasha,_,green]),
    write(Dress),!.

%4

pr5_4:-Factory=[_,_,_],
    in_list(Factory,[svar,X1,_]),
    in_list(Factory,[sles,X2,_]),
    in_list(Factory,[tok,X3,_]),
    in_list(Factory,[_,borisov,_]),
    in_list(Factory,[_,ivanov,_]),
    in_list(Factory,[_,semenov,_]),
    in_list(Factory,[sles,_,noone]),
    in_list(Factory,[_,semenov,_]),
    in_list(Factory,[_,borisov,sister]),
    not(in_list(Factory,[sles,semenov,_])),
    not(in_list(Factory,[tok,semenov,_])),
    write("svar = "),write(X1),nl,
    write("sles = "),write(X2),nl,
    write("tok = "),write(X3),!.

%5

pr5_5:-Liquids=[_,_,_,_],
    in_list(Liquids,[bottle,_]),
    in_list(Liquids,[glass,_]),
    in_list(Liquids,[jag,_]),
    in_list(Liquids,[jur,_]),
    in_list(Liquids,[_,milk]),
    in_list(Liquids,[_,lemon]),
    in_list(Liquids,[_,kvas]),
    in_list(Liquids,[_,water]),
    not(in_list(Liquids,[bottle,water])),
    not(in_list(Liquids,[bottle,milk])),
    not(in_list(Liquids,[jur,lemon])),
    not(in_list(Liquids,[jur,water])),
    not(in_list(Liquids,[jag,lemon])),
    not(in_list(Liquids,[jag,kvas])),
    not(in_list(Liquids,[glass,milk])),
    not(in_list(Liquids,[jur,milk])),
    write(Liquids),!.

%6

pr5_6:-Humans=[_,_,_,_],
    in_list(Humans,[voronov,_]),
    in_list(Humans,[pavlov,_]),
    in_list(Humans,[levickij,_]),
    in_list(Humans,[saharov,_]),
    in_list(Humans,[_,dancer]),
    in_list(Humans,[_,artist]),
    in_list(Humans,[_,singer]),
    in_list(Humans,[_,writer]),
    not(in_list(Humans,[voronov,singer])),
    not(in_list(Humans,[levickij,singer])),
    not(in_list(Humans,[pavlov,writer])),
    not(in_list(Humans,[pavlov,artist])),
    not(in_list(Humans,[saharov,writer])),
    not(in_list(Humans,[voronov,writer])),
    write(Humans),!.

%7

pr5_7:-Friends=[_,_,_],
    in_list(Friends,[mikle,_,basket]),
    in_list(Friends,[simon,izr,_]),
    in_list(Friends,[richard,_,X1]),
    in_list(Friends,[_,amer,_]),
    in_list(Friends,[X2,avstr,_]),
    in_list(Friends,[_,_,tennis]),
    in_list(Friends,[_,_,krik]),
    not(in_list(Friends,[mikle,amer,_])),
    not(in_list(Friends,[_,amer,basket])),
    not(in_list(Friends,[simon,_,tennis])),
    not(in_list(Friends,[_,amer,krik])),
    write("richard = "),write(X1),nl,
    write("avstr = "),write(X2),!.

