#predicados a utilizar na aplicao

:- [metroparis].

linha(N,L):-findall(E,estacao(E,N),L).
