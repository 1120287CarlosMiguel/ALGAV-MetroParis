#predicados a utilizar na aplicao

gera_caminho(Eorigem,Edestino,Ltrocos):- estacao_linhas(Eorigem,Lor),
                                        estacao_linhas(Edestino,Ldes),
                                        intersecao(Lor,Ldes,Temp),
                                        Temp \== [],member(T,Temp),
                                        Ltrocos = (Eorigem,Edestino,T).
                                        
