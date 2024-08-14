%Q1


is_valid_sum(S) :-
    is_valid_sum_helper(S, 0), !.

is_valid_sum_helper(S, I) :-
    Sum is I * (I + 1) // 2,
    (Sum = S;
    (Sum < S,
    NextI is I + 1,
    is_valid_sum_helper(S, NextI))).


%Another approach
zero(0.0).
isInt(N):- K is (round(N) - N),
    zero(K).

is_valid_sum2(S):-
    isInt((sqrt(1+(8*S)) - 1)/2).







%Q2


shuffle_list([],[]).
shuffle_list([A,B,C|D], [B,C,A|D2]):- shuffle_list(D, D2).





%Q3

is_natural_number(1):-!.
is_natural_number(N) :- N > 1, M is N - 1, is_natural_number(M).

lucas(1, 2) :-!.
lucas(2, 1) :-!.


lucas(N, X) :-
    is_natural_number(N),
    helper_forward(2, N, 2, 1, X),!.

lucas(N, X):-
    is_natural_number(X),
    helper(2, N, 2, 1, X).



helper_forward(N, N, _, L, L) :- !.
helper_forward(N0, N, L0, L1, L) :-
    N1 is N0 + 1,
    L2 is L0 + L1,
    N0 < N,
    helper_forward(N1, N, L1, L2, L).

helper(N, N, _, L, L) :- !.
helper(N0, N, L0, L1, L) :-
    N1 is N0 + 1,
    L2 is L0 + L1,
    L2 =< L,
    helper(N1, N, L1, L2, L).





%Q4

:- use_module(library(clpb)).

solution(A,B,C,D,E,F):-
    sat(A=:= (B*C*D*E*F)),sat(B=:=((~C)*(~D)*(~E)*(~F))),sat(C=:= (A+B)),sat(D=:= (E+F)),sat(E=:= ((~A)*(~B)*(~C))),sat(F=:= ((~A)*(~B)*(~C)*(~D)*(~E))).
