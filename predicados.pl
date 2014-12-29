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
