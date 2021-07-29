edge(n1,n2).
edge(n2,n3).
edge(n3,n4).
edge(n3,n5).
path(X,X).
path(X,Y) :- edge(X,Z), path(Z,Y).


