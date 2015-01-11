%Base de Conhecimento
%linha(nomeEstacao,lista com estacoes)
/*******Linha 1*******/
linha(1,[ladefence,
        esplanadedeladefende,
        pontdeneuilly,
        lessablons,
        portemaillot,
        argentine,
        charlesdegaulleetoile,
        georgev,
        franklindroosevelt,
        champelyseesclemenceau,
        concorde,
        tuileries,
        palaisroyalmuseedulouvre,
        louvrerivoli,
        chatelet,
        hoteldeville,
        saintpaul,
        bastille,
        garedelyon,
        reullydiderot,
        nation,
        portedevincennes,
        saintmande,
        berault,
        chateaudevincennes]).

/******Linha 2 ********/
linha(2,[portedauphine,
        victorhugo,
        charlesdegaulleetoile,
        ternes,
        courcelles,
        monceau,
        villiers,
        rome,
        placedeclich,
        blanche,
        pigalle,
        anvers,
        barbesrochechouart,
        lachapelle,
        stalingrad,
        jaures,
        colonelfabien,
        belleville,
        couronnes,
        menilmontant,
        perelachaise,
        philippe,
        auguste,
        alexandredumas,
        avron,
        nation]).

/******Linha 6********/
linha(6,[charlesdegaulleetoile,
        kleber,
        boissiere,
        trocaderopassy,
        birhakeim,
        dupleix,
        lamottepicquetgrenelle,
        cambronne,
        sevreslecourbe,
        pasteur,
        montparnassebienvenue,
        edgarquinet,
        raspail,
        denfertrochereau,
        saintjacques,
        glaciere,
        corvisart,
        placeditalie,
        nationale,
        chevaleret,
        quaidelagare,
        bercy,
        dugommier,
        daumesnil,
        belair,
        picpus,
        nation]).

/******Linha 9 *******/
linha(9,[pontdesevres,
        billancourt,
        marcelsembat,
        portedesaintcloud,
        exelmans,
        michelangemolitor,
        michelangeauteuil,
        jasmin,
        ranelagh,
        lamuette,
        ruedelapompe,
        trocadero,
        lena,
        almamarceau,
        franklindroosevelt,
        saintphilippedurole,
        miromesnil,
        saintaugustin,
        havrecaumartin,
        chausseedantinlafayette,
        richelieudruout,
        grandsboulevards,
        bonnenouvelle,
        strasbourgsaintdenis,
        republique,
        oberkampf,
        saintambroise,
        voltaire,
        charonne,
        ruedesboulets,
        nation,
        buzenval,
        maraichers,
        portedemontreuil,
        robespierre,
        croisdechavaux,
        mairiedemontreuil]).

%horario(linha,direcaoIn,direcaoFim,1metro(min),ultMetro(min),tempoDia,tempoNoite,tempoSabado,tempoDomingo)
horario(1,ladefence,chateaudevincennes,330,1482,4,7,8,8).
horario(1,chateaudevincennes,ladefence,330,1482,4,7,8,8).
horario(2,portedauphine,nation,330,1483,4,7,8,8).
horario(2,nation,portedauphine,330,1482,4,7,8,8).
horario(6,charlesdegaulleetoile,nation,330,1482,4,12,10,10).
horario(6,nation,charlesdegaulleetoile,330,1483,4,12,10,10).
horario(9,pontdesevres,mairiedemontreuil,330,1467,9,12,13,10).
horario(9,mairiedemontreuil,pontdesevres,325,1467,9,12,13,10).

% pontoDeInteresse(nome, estacaoproxima, hor abertura, hor fecho, dur
% visita)
pontoDeInteresse(arcDeTriomphe, charlesdegaulle - etoile, 0,0,15).
pontoDeInteresse(museeBaccarat, boissiere, 600,1080, 120).
pontoDeInteresse(museedeLHomme, trocadero, 600,1020, 120).
pontoDeInteresse(museeNationalDeLaMarine, trocadero, 600,1080, 60).
pontoDeInteresse(laTourEiifel, birlakeim, 540,1380, 120).
pontoDeInteresse(egliseSaintLeon, dupleix, 480, 1170, 30).
pontoDeInteresse(marcheSaxeBreteuil, sevreslecourbe, 420, 900, 30).
pontoDeInteresse(museeNationalDeCeramique, pontdesevres, 600, 1020, 30).
pontoDeInteresse(jardinduRanelagh, lamuette, 0, 1140, 120).
pontoDeInteresse(gareSaintLazare, chaussedantinlafayette, 300, 90,20).
pontoDeInteresse(museegrevin, richelieudrouot, 600, 1140, 120).
