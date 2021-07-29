female(a).
female(b).
male(c).
male(d).
male(e).
friend(b,c).
friend(a,d).
friend(a,e).
married(X,Y) :- female(X), friend(X,Y).
sad(a,happy(b,c)).
is(X).