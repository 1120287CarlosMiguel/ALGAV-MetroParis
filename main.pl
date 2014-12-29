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
                escolher_opcao_menu(Op).

escolher_opcao_menu(1) :- menu_percurso.

escolher_opcao_menu(2).

escolher_opcao_menu(_).

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
                read(OpTipo),
                number(OpTipo),OpTipo > 0, OpTipo < 4,
                cria_percurso(OpTipo,TipoDia,Min,Eorigem,Edestino,_).



escolher_opcao_tempo(1,Min,Tipo):-Min<1200,Tipo = dia.
escolher_opcao_tempo(1,Min,Tipo):-Min>1200,Tipo = noite.
escolher_opcao_tempo(2,_,sabado).
escolher_opcao_tempo(3,_,domingo).

%menos trocas
cria_percurso(1,TipoDia,Min,Eorigem,Edestino,Precurso):-percurso_menos_trocas(Eorigem,Edestino,Min,TipoDia,Inicio,Fim,Percurso).

%mais rapido
cria_percurso(2,TipoDia,Min,Eorigem,Edestino,Precurso).

%menor percuros a pe
cria_percurso(3,TipoDia,Min,Eorigem,Edestino,Precurso).


:-write('Bem vindo a rede de metro de Paris'),nl.
:-imprime_menu.
