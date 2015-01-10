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
percurso_rapido([H|T],[],Perc):-!,percurso_rapido(T,H,Perc).
percurso_rapido([[Perc1,Temp1,_]|T],[_,Temp2,_],Perc):- Temp1 < Temp2,
																									 !,percurso_rapido(T,[Perc1,Temp1,_],Perc).

percurso_rapido([_|T],Perc,Percf):-!,percurso_rapido(T,Perc,Percf).

percurso_menos_trocas(Origem,Destino,Dia,Perc):-gera_percursos(Origem,Destino,Dia,Lista),
																								percurso_trocas(Lista,[],Perc).

percurso_trocas([],Perc,Perc):-!.
percurso_trocas([H|T],[],Perc):-!,percurso_trocas(T,H,Perc).
percurso_trocas([[Perc1,Temp1,Linhas1]|T],[_,_,Linhas2],Perc):- length(Linhas1,T1),length(Linhas2,T2),T1<T2,
																									!,percurso_trocas(T,[Perc1,Temp1,Linhas1],Perc).

percurso_trocas([_|T],Perc,Percf):-!,percurso_trocas(T,Perc,Percf).


gera_percursos(Orig,Dest,Dia,Lista):-findall([Perc,Custo,Linhas],goBranch(Orig,Dest,Perc,Dia,Custo,Linhas),Lista).

goBranch(Orig,Dest,Perc,Dia,Custo,Linhas):-
	go1Branch([([],0,[Orig])],Dest,P,Dia,Custo,L),
	reverse(P,Perc),
	remove_repetidos(L,Linhas).

go1Branch([(Linhas,C,Prim)|_],Dest,Prim,_,C,Linhas):- Prim=[Dest|_].
go1Branch([(_,_,[Dest|_])|Resto],Dest,Perc,Dia,Custo,Linhas):- !, go1Branch(Resto,Dest,Perc,Dia,Custo,Linhas).
go1Branch([(Lin,C,[Ult|T])|Outros],Dest,Perc,Dia,Custo,Linhas):-
		findall((NLin,NC,[Z,Ult|T]),
			(proximo_no(Ult,T,Z,C1,Dia,Lin,NLin),NC is C+C1),Lista),
		append(Outros,Lista,NPerc),
		sort(NPerc,NPerc1),
		%write(NPerc1),nl,
		go1Branch(NPerc1,Dest,Perc,Dia,Custo,Linhas).

proximo_no(X,T,Z,C,Dia,Linhas,Nl):- liga(Linha,X,Z), tempo_de_viagem(Dia,C,Linha), \+ member(Z,T), Nl = [Linha|Linhas].

tempo_de_viagem(dia,C,Linha):-horario(Linha,_,_,_,C,_,_,_).

tempo_de_viagem(noite,C,Linha):-horario(Linha,_,_,_,_,C,_,_).

tempo_de_viagem(sabado,C,Linha):-horario(Linha,_,_,_,_,_,C,_).

tempo_de_viagem(domingo,C,Linha):-horario(Linha,_,_,_,_,_,_,C).

/****************************
********** Visitas **********
****************************/

/*pontos_de_interesse(PDI*/
pontos_de_interesse([]):-!.
pontos_de_interesse([H|T]):-pontoDeInteresse(H,Estacao,_,_,_),write('--->'), write(Estacao), pontos_de_interesse(T).

verficar_pdi(PDI):-pontoDeInteresse(PDI,_,_,_,_).
/***************************/

/****************************
Predicados auxiliares
****************************/



remove_repetidos(LisR,Final):-remove_repetidos(LisR,[],Final).

remove_repetidos([H],[],[H]):-!.
remove_repetidos([],Lis,Lis):-!.
remove_repetidos([H|T],[],Lis):-!,remove_repetidos(T,[H],Lis).
remove_repetidos([H|T],Res,Lis):-member(H,T),\+member(H,Res),!,remove_repetidos(T,[H|Res],Lis).
remove_repetidos([H|T],Res,Lis):-member(H,T),member(H,Res),!,remove_repetidos(T,Res,Lis).
remove_repetidos([H|T],Res,Lis):-not(member(H,T)),\+member(H,Res),!,remove_repetidos(T,[H|Res],Lis).
remove_repetidos([H|T],Res,Lis):-not(member(H,T)),member(H,Res),!,remove_repetidos(T,Res,Lis).
