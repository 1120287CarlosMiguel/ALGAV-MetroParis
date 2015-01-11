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

minutos_para_horas(Min):-Minutos is Min mod 60,Horas is Min // 60, write(Horas),write(':'),write(Minutos).

/*******************************
predicados para gerar percursos
********************************/

percurso_mais_rapido(Origem,Destino,Min,Dia,Perc):-gera_percursos(Origem,Destino,Min,Dia,Lista),
																							 percurso_rapido(Lista,[],Perc,Min,0).

percurso_rapido([],Perc,Perc,_,_):-!.
percurso_rapido([[A1,B1,C1,[Chegada1|D1]]|T],[],Perc,Min,0):-Dif is Chegada1 - Min,
																														 percurso_rapido(T,[A1,B1,C1,[Chegada1|D1]],Perc,Min,Dif).

percurso_rapido([[A1,B1,C1,[Chegada1|D1]]|T],PercTemp,Perc,Min,Dif) :- Dif2 is Chegada1 - Min,
																																			 Dif2 < Dif,
																																			percurso_rapido(T,PercTemp,Perc,Min,Dif2).

percurso_rapido([_|T],PercTemp,Perc,Min,Dif):-percurso_rapido(T,PercTemp,Perc,Min,Dif).


percurso_menos_trocas(Origem,Destino,Min,Dia,Perc):-gera_percursos(Origem,Destino,Min,Dia,Lista),
																								percurso_trocas(Lista,[],Perc).

percurso_trocas([],Perc,Perc):-!.
percurso_trocas([H|T],[],Perc):-!,percurso_trocas(T,H,Perc).
percurso_trocas([[Perc1,Temp1,Linhas1,Horas1]|T],[_,_,Linhas2,_],Perc):- length(Linhas1,T1),length(Linhas2,T2),T1<T2,
																									!,percurso_trocas(T,[Perc1,Temp1,Linhas1,Horas1],Perc).

percurso_trocas([_|T],Perc,Percf):-!,percurso_trocas(T,Perc,Percf).


gera_percursos(Orig,Dest,MinInicio,Dia,Lista):-findall([Perc,Custo,Linhas,HorasSaida],goBranch(Orig,Dest,Perc,MinInicio,Dia,Custo,Linhas,HorasSaida),Lista).

goBranch(Orig,Dest,Perc,MinEsc,Dia,Custo,Linhas,HorasSaida):-
	go1Branch([(MinEsc,[],[],0,[Orig])],Dest,P,Dia,Custo,L,H),
	reverse(P,Perc),
	remove_repetidos(L,Linhas),
	HorasSaida = H.

go1Branch([(MinEsc,Horas,Linhas,C,Prim)|_],Dest,Prim,_,C,Linhas,Horas):- Prim=[Dest|_].

go1Branch([(_,_,_,_,[Dest|_])|Resto],Dest,Perc,Dia,Custo,Linhas,Horas):- !, go1Branch(Resto,Dest,Perc,Dia,Custo,Linhas,Horas).

go1Branch([(MinDes,Horas,Lin,C,[Ult|T])|Outros],Dest,Perc,Dia,Custo,Linhas,Hor):-
		findall((MinDes,NHoras,NLin,NC,[Z,Ult|T]),
			(proximo_no(Ult,T,Z,C1,Dia,Lin,NLin,T,MinDes,Horas,NHoras),NC is C+C1),Lista),
		append(Outros,Lista,NPerc),
		sort(NPerc,NPerc1),
		%write(NPerc1),nl,
		go1Branch(NPerc1,Dest,Perc,Dia,Custo,Linhas,Hor).

proximo_no(X,T,Z,C,Dia,Linhas,Nl,T,MinDes,[],NHoras):- liga(Linha,X,Z), tempo_de_viagem(Dia,C,MinDes,Linha),
																											\+ member(Z,T), Nl = [Linha|Linhas],
																											calcula_proxima_frequencia(MinDes,C,MinDes,H),
																											%encontra_hora(X,Z,Dia,MinDes,(_,_,H)),
																											NHoras = [H].

proximo_no(X,T,Z,C,Dia,Linhas,Nl,T,_,[Hora|Tail],NHoras):- liga(Linha,X,Z), tempo_de_viagem(Dia,C,Hora,Linha),
																											\+ member(Z,T), Nl = [Linha|Linhas],
																											calcula_proxima_frequencia(Hora,C,Hora,H),
																											%encontra_hora(X,Z,Dia,Hora,(_,_,H)),
																											NHoras = [H,Hora|Tail].


tempo_de_viagem(dia,C,Tempo,Linha):-(Tempo<1200,horario(Linha,_,_,_,_,C,_,_,_),!;horario(Linha,_,_,_,_,_,C,_,_)).
tempo_de_viagem(sabado,C,_,Linha):-horario(Linha,_,_,_,_,_,_,C,_).
tempo_de_viagem(domingo,C,_,Linha):-horario(Linha,_,_,_,_,_,_,_,C).

calcula_proxima_frequencia(Temp,Frequencia,TempC,TempoFinal) :-Temp > TempC,Res is Temp mod Frequencia,
																															 Res == 0, TempoFinal is Temp,!.

calcula_proxima_frequencia(Tempo,Frequencia,TempC,TempoFinal) :- NT is Tempo + 1,
												!,calcula_proxima_frequencia(NT, Frequencia,TempC,TempoFinal).

/**************************************************
Lista com 1 e Ultimo metro a chegar a paragem de determinada paragem
***************************************************/

horario_paragem(Origem,Destino,Dia,Horario):-liga(Linha,Origem,Destino),
																						 bagof(H,mostraHorario(Linha,Dia,H),Horarios),
																						 encontra_horarios(Origem,Destino,Horarios,[],TodosH),
																						 sort(TodosH,HoraFinal),
																						 horario_abertura_fecho(HoraFinal,[],Final),
																						Horario = Final.

horario_abertura_fecho([],Hora,Horario):-!,Horario = Hora.
horario_abertura_fecho([H|T],[],Horario):-!,horario_abertura_fecho(T,[H],Horario).
horario_abertura_fecho([H|[]],Hor,Horario):-!,horario_abertura_fecho([],[H|Hor],Horario).
horario_abertura_fecho([_|T],Hor,Horario):-!,horario_abertura_fecho(T,Hor,Horario).

encontra_horarios(_,_,[],Horarios,Horarios):-!.
encontra_horarios(Origem,Destino,[H|T],[],Horario):-encontra_horarios1(Origem,Destino,H,[],Hor),!,
																										encontra_horarios(Origem,Destino,T,Hor,Horario).
encontra_horarios(Origem,Destino,[H|T],Hor,Horario):-encontra_horarios1(Origem,Destino,H,[],HorTemp),
																										 append(Hor,HorTemp,NHor),!,
																									   encontra_horarios(Origem,Destino,T,NHor,Horario).

encontra_horarios1(_,_,[],Temp,Temp):-!.
encontra_horarios1(Origem,Destino,[(Origem,Destino,Tempo)|T],Temp,Horario):-!,encontra_horarios1(Origem,Destino,T,[(Origem,Destino,Tempo)|Temp],Horario).
encontra_horarios1(Origem,Destino,[_|T],Temp,Horario):-!,encontra_horarios1(Origem,Destino,T,Temp,Horario).


/****************************************************
Retorna a elemento com hora mais proxima da desejada
*****************************************************/

encontra_hora(Origem,Destino,Dia,HoraDese,Hora) :- liga(Linha,Origem,Destino), bagof(Perc,mostraHorario(Linha,Dia,Perc),Lista),encontra_frequencia(Origem,Destino,Lista,HoraDese,HoraTemp,Hora),!,Hora = Hora.

encontra_frequencia(Origem,Destino,[],_,HoraTemp,Hora):-!, Hora = HoraTemp.
encontra_frequencia(Origem,Destino,[H|T],HoraDes,HoraTemp,Hora) :-encontra_melhor_frequencia(Origem,Destino,H,HoraDes,HoraTemp,Hora1),
																								 encontra_frequencia(Origem,Destino,T,HoraDes,Hora1,Hora).

encontra_melhor_frequencia(_,_,[],_,Hora,Hora):-!.
encontra_melhor_frequencia(Origem,Destino,[(Origem,Destino,Hora)|T],HoraDes,HoraFinal,Hora1):-var(HoraFinal),
																																												Hora >= HoraDes,
																																												!,encontra_melhor_frequencia(_,_,[],HoraDes,(Origem,Destino,Hora),Hora1).

encontra_melhor_frequencia(Origem,Destino,[(Origem,Destino,Hora)|T],HoraDes,(Origem,Destino,HoraFinal),Hora1):-Hora >= HoraDes, HoraFinal > Hora,
																																												!,encontra_melhor_frequencia(_,_,[],HoraDes,(Origem,Destino,Hora),Hora1).

encontra_melhor_frequencia(Origem,Destino,[(Origem,Destino,Hora)|T],HoraDes,(Origem,Destino,HoraFinal),Hora1):-Hora >= HoraDes, HoraFinal < Hora,
																																												!,encontra_melhor_frequencia(_,_,[],HoraDes,(Origem,Destino,HoraFinal),Hora1).

encontra_melhor_frequencia(Origem,Destino,[(_,_,_)|T],HoraDes,HoraFinal,Hora):- !,encontra_melhor_frequencia(Origem,Destino,T,HoraDes,HoraFinal,Hora).


/****************************************************************************
Cria lista com elementos de tipod (Origem,Destino,Minutos de Saida de Origem)
*****************************************************************************/

mostraHorario(Linha,dia,Lista):-horario(Linha,Origem,_,HoraIn,HoraFim,HoraDia,HoraNoite,_,_),lista_frequencias(Linha,A,Origem,HoraIn,HoraFim,HoraDia,HoraNoite,[],Lis), reverse(Lis,Lista).
mostraHorario(Linha,sabado,Lista):-horario(Linha,Origem,_,HoraIn,HoraFim,_,_,HoraDia,_),lista_frequencias(Linha,A,Origem,HoraIn,HoraFim,HoraDia,HoraDia,[],Lis), reverse(Lis,Lista).
mostraHorario(Linha,domingo,Lista):-horario(Linha,Origem,_,HoraIn,HoraFim,_,_,_,HoraDia),lista_frequencias(Linha,A,Origem,HoraIn,HoraFim,HoraDia,HoraDia,[],Lis), reverse(Lis,Lista).

lista_frequencias(_,_,_,HoraActual,HoraFim,_,_,ListaTemp,ListaFinal):- HoraActual >= HoraFim, !, ListaFinal = ListaTemp.

lista_frequencias(Linha,Estacao,NEstacao,HoraIn,HoraFim,FreqDia,FreqNoite,ListaTemp,ListaFinal):-liga(Linha,NEstacao,NNEstacao),
																																		(var(Estacao);Estacao \= NNEstacao;horario(Linha,_,NEstacao,_,_,_,_,_,_)),
																																		(HoraIn < 1200,NHora is HoraIn + FreqDia;HoraIn > 1200,NHora is HoraIn + FreqNoite),
																																		lista_frequencias(Linha,NEstacao,NNEstacao,NHora,HoraFim,FreqDia,FreqNoite,[(NEstacao,NNEstacao,HoraIn)|ListaTemp],ListaFinal).

/****************************
********** Visitas **********
****************************/

/*pontos_de_interesse(PDI */
/* [PDI,Estacao, Duracao */
/*
1 lista_pdi_estacao
2 ver ao a lista que dura menos
 */


pontos_de_interesse(ListPDI):- todos_guias(ListPDI, R1), listas_pdis_estacoes(R1,R2), somar_todos(R2,Guia), sort(Guia, [[T|[[H]]],_|_]),T>270,T<510,write('Tempo: '),write(T),nl,write('estacao (Monumento - Tempo )'),nl,imprimirGuia(H),!;false.

imprimirGuia([]):-!.
imprimirGuia([[ PDI, E, Time ]|T]):-write('--> '),write(E),write(' ('),write(PDI),write(' - '), write(Time), write(' )'),nl,!, imprimirGuia(T).


listas_pdis_estacoes([],[]).
listas_pdis_estacoes([H1|T1], [H2|T2]):-lista_pdi_estacao(H1,H2), listas_pdis_estacoes(T1,T2).

lista_pdi_estacao([],[]).
lista_pdi_estacao([H|T], [[H,Estacao, Duracao]|Res]):-pontoDeInteresse(H,Estacao,_,_,Duracao),!, lista_pdi_estacao(T,Res).

somar_tempo( [[_, _, Duracao]|[]], Duracao):-!.
somar_tempo( [[_, E1, D1] | [ [P2,E2,L2] | R2 ]], Duracao):- percurso_mais_rapido(E1,E2,480, dia,[_, D2,_,_]), Ra is D1 + D2, somar_tempo([ [P2,E2,L2] | R2 ], Duracao2), Duracao is Ra + Duracao2.

somar_todos([H|[]], [[Soma,[H]] | [] ]):- somar_tempo(H,Soma).
somar_todos([H|T], [[Soma,[H]] | Res ]):-somar_tempo(H,Soma), somar_todos(T,Res).
somar_todos([_|T], Res):- somar_todos(T,Res).

verficar_pdi(PDI):-pontoDeInteresse(PDI,_,_,_,_).
/***************************/

/****************************
Predicados auxiliares
****************************/

todos_guias(Lista, R):-findall( X, get_set(X,Lista), R).

get_set(L0, L) :-
    length(L, Len),
    length(L0, Len),
    apply_elem(L0, L).

apply_elem([], []).
apply_elem([X|Xs], L) :-
    member(X, L),
	delete(L, X, Li),
    apply_elem(Xs, Li).



remove_repetidos(LisR,Final):-remove_repetidos(LisR,[],Final).

remove_repetidos([H],[],[H]):-!.
remove_repetidos([],Lis,Lis):-!.
remove_repetidos([H|T],[],Lis):-!,remove_repetidos(T,[H],Lis).
remove_repetidos([H|T],Res,Lis):-member(H,T),\+member(H,Res),!,remove_repetidos(T,[H|Res],Lis).
remove_repetidos([H|T],Res,Lis):-member(H,T),member(H,Res),!,remove_repetidos(T,Res,Lis).
remove_repetidos([H|T],Res,Lis):-not(member(H,T)),\+member(H,Res),!,remove_repetidos(T,[H|Res],Lis).
remove_repetidos([H|T],Res,Lis):-not(member(H,T)),member(H,Res),!,remove_repetidos(T,Res,Lis).
