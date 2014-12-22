#predicados a utilizar na aplicao

#adiciona predicado cruza(linha1, linha2, estacao onde cruzam)
:-dyanemic linha/2
:-dynamic cruza/3.
:-[metroparis].

gera_linhas :-  findall((L,LE),setof(E,estacao(E,L),LE),LF),
				cria_linha(LF).

cria_linha([]):-!.
cria_linha([(L,E)|T]):-assertz(linha(L,E)),
					   cria_linha(T).

gera_cruzamentos :- linha(N1,L1),
			  linha(N2,L2),
			  N1 \== N2,
			  intersection(L1,L2,L),
			  L \== [],
			  assertz(cruza(N1,N2,L)).

:-gera_linhas.
:-gera_cruzamentos.
