:-[metroparis].
:-[gera_dados].
:-[predicados].

imprime_menu :- repeat,
                write('1 - Percurso'),nl,
                write('2-Guia'),nl,
                write('0-Sair'),nl,
                write('Escolha uma das opcoes(. para finalizar escolha): '),
                read(Op),
                Op > -1, Op <3,
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
                OpT<4,OpT>0,
                escolher_opcao_tempo(OpT,Min,Tempo).

escolher_opcao_tempo(1,Min,Tempo):-Min<1200,Tempo = dia.
escolher_opcao_tempo(1,Min,Tempo):-Min>1200,Tempo = noite.
escolher_opcao_tempo(2,_,sabado).
escolher_opcao_tempo(3,_,domingo).



:-write('Bem vindo a rede de metro de Paris'),nl.
:-imprime_menu.
