lucas(1,2):-!.
lucas(2,1):-!.

lucas(N,X):-
    lucas_helper(N,1,2,X,2). 

lucas_helper(N,L,_,L,N):-!.
%lucas_helper(1,,,2,_):-!.
%lucas_helper(2,,,1,_):-!.

%rules:
lucas_helper(N,X1,X2,X,I):-
    I1 is I+1,
    X3 is X1+X2,
    I1 =< N,
    lucas_helper(N,X3,X1,X,I1).