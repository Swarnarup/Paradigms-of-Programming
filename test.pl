language(prolog).
language(scheme).
language(c).


:- use_module(library(clpb)).

isSum(A, B, C):- C is A+B.

isNum(1).
isNum(N):- N>0, M is N-1, isNum(M).

zero(0.0).

isInt(N):- K is (round(N) - N),
    zero(K).

helper(S):-
    isInt((sqrt(1+(8*S)) - 1)/2).

bb(X, V):- V is (sqrt(1+(8*X)) - 1)/2.

dbl_list([],[]).
dbl_list([H | T], [H2 | T2]):- H2 is H*2, dbl_list(T, T2).


shuffle_list([],[]).
shuffle_list([A,B,C|D], [B,C,A|D2]):- shuffle_list(D, D2).


lucas(1, 2):-!.
lucas(2, 1):-!.

lucas(N, X):-
    N1 is N-1,
    N2 is N-2,
    lucas(N1, X1),
    lucas(N2, X2),
    X is X1+X2.


luc2(1, 2) :-!.
luc2(2, 1) :-!.

luc2(N, X) :-
    hpr(2, N, 2, 1, X).

hpr(N, N, _, F, F) :- !.
hpr(N0, N, F0, F1, F) :-
    N1 is N0 + 1,
    F2 is F0 + F1,
    (   F2 = F ; F2 < F),
    hpr(N1, N, F1, F2, F).


solution(A,B,C,D,E,F):-
sat(A=:= (B*C*D*E*F)),sat(B=:=((~C)*(~D)*(~E)*(~F))),sat(C=:= (A+B)),sat(D=:= (E+F)),sat(E=:= ((~A)*(~B)*(~C))),sat(F=:= ((~A)*(~B)*(~C)*(~D)*(~E))).

