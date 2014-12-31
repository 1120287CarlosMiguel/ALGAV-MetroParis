#predicados a utilizar na aplicao

gera_caminho(A,B,_,[(A,B,L)|L]):-linha(L,LE),
	                               member(A,LE),
	                               member(B,LE).

gera_caminho(A,B,PASSADO,[(A,TEMP,NL)|L]):-linha(NL,LELA),
	                                         member(TEMP,LELA),
	                                         TEMP \== A,
	                                         estacao_linhas(TEMP,LC),
	                                         member(LisT,LC),
	                                         LisT \== NL,
                                           not(member(LisT,PASSADO)),
	                                         gera_caminho(TEMP,B,[NL|PASSADO],L).

gera_caminho(A,B,R):-gera_caminho(A,B,[],R).

/*********************************
validacoes na insercao de estacoes
*********************************/

validaEstacao(Estacao):- estacao_linhas(Estacao,_).

validaEstacao(_):- write('Estacao inexistente!!!'),false.

verifica_estacoes_diferentes(Eorigem,Edestino):-Eorigem == Edestino,write('Inseriu estacoes iguais'),!,false.

verifica_estacoes_diferentes(_,_):-true.

/************************
predicados para calculos
************************/

horas_para_minutos([H|[M]],Res):- atom_number(H,NH),atom_number(M,NM),
                                  NH < 24, NH > 0, NM > -1, NM <60,
                                  Hora is NH * 60,
                                  Res is Hora + NM.

horas_para_minutos(_,_):-write('Hora invalida'),nl,false.

/*******************************
predicados para gerar percursos
********************************/

percurso_mais_rapido(Origem,Destino,Dia,Perc):-gera_percursos(Origem,Destino,Dia,Lista),
																							 percurso_rapido(Lista,[],Perc).

percurso_rapido([],Perc,Perc):-!.
percurso_rapido([H|T],[],Perc):-percurso_rapido(T,H,Perc).
percurso_rapido([[Perc1,Temp1]|T],[_,Temp2],Perc):- Temp1 < Temp2,
																									 percurso_rapido(T,[Perc1,Temp1],Perc).

percurso_rapido([_|T],Perc,Percf):-percurso_rapido(T,Perc,Percf).

gera_percursos(Orig,Dest,Dia,Lista):-findall([Perc,Custo],goBranch(Orig,Dest,Perc,Dia,Custo),Lista).


goBranch(Orig,Dest,Perc,Dia,Custo):-
	go1Branch([(0,[Orig])],Dest,P,Dia,Custo),
	reverse(P,Perc).

go1Branch([(C,Prim)|_],Dest,Prim,_,C):- Prim=[Dest|_].
go1Branch([(_,[Dest|_])|Resto],Dest,Perc,Dia,Custo):- !, go1Branch(Resto,Dest,Perc,Dia,Custo).
go1Branch([(C,[Ult|T])|Outros],Dest,Perc,Dia,Custo):-
		findall((NC,[Z,Ult|T]),
			(proximo_no(Ult,T,Z,C1,Dia),NC is C+C1),Lista),
		append(Outros,Lista,NPerc),
		sort(NPerc,NPerc1),
		%write(NPerc1),nl,
		go1Branch(NPerc1,Dest,Perc,Dia,Custo).

proximo_no(X,T,Z,C,Dia):- liga(Linha,X,Z), tempo_de_viagem(Dia,C,Linha), \+ member(Z,T).

tempo_de_viagem(dia,C,Linha):-horario(Linha,_,_,_,C,_,_,_).

tempo_de_viagem(noite,C,Linha):-horario(Linha,_,_,_,_,C,_,_).

tempo_de_viagem(sabado,C,Linha):-horario(Linha,_,_,_,_,_,C,_).

tempo_de_viagem(domingo,C,Linha):-horario(Linha,_,_,_,_,_,_,C).
