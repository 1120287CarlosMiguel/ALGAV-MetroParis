:-[metroparis].
:-[gera_dados].
:-[predicados].

imprime_menu :- repeat,
                write('1 - Percurso'),nl,
                write('2-Guia'),nl,
                write('0-Sair'),nl,
                write('Escolha uma das opcoes(. para finalizar escolha): '),
                read(Op),
                number(Op),Op > -1, Op <3,
                escolher_opcao_menu(Op),nl,
                imprime_menu.

escolher_opcao_menu(1) :- menu_percurso.

escolher_opcao_menu(2) :- menu_guia.

escolher_opcao_menu(_):-halt.

menu_percurso:- write('***Vamos iniciar a configuracao do seu percurso***'),nl,
                repeat,
                write('Indique a estacao de origem: '),
                read(Eorigem),nl,
                validaEstacao(Eorigem),
                repeat,
                nl,write('Indique a estacao de destino: '),
                read(Edestino),nl,
                verifica_estacoes_diferentes(Eorigem,Edestino),
                validaEstacao(Edestino),
                repeat,
                write('Indique a hora de partida(HH:MM): '),
                read_line_to_codes(user_input,String),
                atom_codes(Atom, String),
                atomic_list_concat(Hora, ':', Atom),
                horas_para_minutos(Hora,Min),
                repeat,
                nl,write('1-Dia Normal'),
                nl,write('2-Sabado'),
                nl,write('3-Domingo'),
                nl,write('Selecione uma das opcoes: '),
                read(OpT),
                number(OpT),OpT<4,OpT>0,
                escolher_opcao_tempo(OpT,Min,TipoDia),
                repeat,
                write('Que caminho deseja:'),nl,
                write('1-Menos trocas'),nl,
                write('2-Mais rapido'),nl,
                write('3-Menor percurso a pe'),nl,
                write('Escolha uma opcao: '),
                read(OpTipo),
                number(OpTipo),OpTipo > 0, OpTipo < 4,
                cria_percurso(OpTipo,TipoDia,Min,Eorigem,Edestino,Percurso),
                imprime_percurso(Percurso,Min).

menu_guia:-write('***Vamos iniciar a configuracao do seu guia***'),nl,
	write('Numero de Pontos de Iteresse? '),nl,
	read(NPDI),
	ler_pdis1(NPDI,Lista),
	pontos_de_interesse(Lista).

ler_pdis1(N,Lista):-ler_pdis2(0,N,Lista).
ler_pdis2(N,N,_).
ler_pdis2(N1,N,[H|T]):-write(N1),write('º ponto de interesse: '),read(H),
	verficar_pdi(H),N2 is N1+1,ler_pdis2(N2,N,T);write('erro').

/*

	*/


escolher_opcao_tempo(1,_,dia).
escolher_opcao_tempo(2,_,sabado).
escolher_opcao_tempo(3,_,domingo).

%menos trocas
cria_percurso(1,TipoDia,Min,Eorigem,Edestino,Percurso):-percurso_menos_trocas(Eorigem,Edestino,Min,TipoDia,Percurso).

%mais rapido
cria_percurso(2,TipoDia,Min,Eorigem,Edestino,Percurso):-percurso_mais_rapido(Eorigem,Edestino,Min,TipoDia,Percurso).

%menor percuros a pe
%cria_percurso(3,TipoDia,Min,Eorigem,Edestino,Precurso).

imprime_percurso([Perc,_,Linhas,[H|T]],Min):-nl,write('Hora Escolhida: '),write(Min),nl,
                              write('Duracao: '), Dur is H - Min, write(Dur),nl,
                              reverse([H|T],Horas),
                              write('Linhas: '),nl,
                              imprime_linhas(Linhas),
                              write('Estacoes: '),nl,
                              imprime_percurso1(Perc,Horas).

imprime_percurso1([],[]):-!.
imprime_percurso1([H1|T1],[H2|T2]):-write(H1),write('  '),write(H2),nl,imprime_percurso1(T1,T2).

imprime_linhas([H]):-!,write(H),nl.
imprime_linhas([H|T]):-write(H),write('=>'),imprime_linhas(T).


:-write('Bem vindo a rede de metro de Paris'),nl.
:-imprime_menu.
