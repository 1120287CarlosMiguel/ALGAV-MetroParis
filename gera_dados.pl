:-dynamic cruza/3.
:-dynamic estacoes/1.
:-dynamic estaccoes_linhas/2.

intersecao([],_,[]).
intersecao([X|L],L1,L2):- not(member(X,L1)),!,intersecao(L,L1,L2).
intersecao([X|L],L1,[X|L2]):- intersecao(L,L1,L2).

gera_cruzamentos:-bagof(_,cruzamento,_).

cruzamento:- linha(N1,LE1),
             linha(N2,LE2),
             N1\==N2,
             intersecao(LE1,LE2,LI),
             LI\==[],
             assertz(cruza(N1,N2,LI)).

gera_estacoes:-findall(C,linha(_,C),L),
               unir_lista(L,L1),!,
               assertz(estacoes(L1)).
               
unir_lista([],[]).
unir_lista([H],H).
unir_lista([H|T],R):-unir_lista(T,R1),union(H,R1,R).

gera_estacao_linhas:-estacoes(LE),percorrerLista(LE).

percorrerLista([]):-!.
percorrerLista([H|T]):-calcularlinhas(H,Linhas),
                       assertz(estacao_linhas(H,Linhas)),
                       percorrerLista(T).

calcularlinhas(E,Linhas):-findall(N,(linha(N,L),member(E,L)),Linhas).

:-gera_cruzamentos.
:-gera_estacoes.
:-gera_estacao_linhas.
