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
        trocadero,
		passy,
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

%horario(linha,direcao,1metro(min),ultMetro(min),tempoDia,tempoNoite,tempoSabado,tempoDomingo)
horario(1,chateaudevincennes,330,1482,4,7,8,8).
horario(1,ladefence,330,1482,4,7,8,8).
horario(2,nation,330,1483,4,7,8,8).
horario(2,portedauphine,330,1482,4,7,8,8).
horario(6,nation,330,1482,4,12,10,10).
horario(6,charlesdegaulleetoile,330,1483,4,12,10,10).
horario(9,mairiedemontreuil,330,1467,9,12,13,10).
horario(9,pontdesevres,325,1467,9,12,13,10).

% pontoDeInteresse(nome, estacaoproxima, hor abertura, hor fecho, dur
% visita)
pontoDeInteresse(arcDeTriomphe, charlesdegaulleetoile, 0:0,0:0,30).
pontoDeInteresse(museeBaccarat, boissiere, 10:0,18:0, 120).
pontoDeInteresse(museedeLHomme, trocadero, 10:0,17:30, 120).
pontoDeInteresse(museeNationalDeLaMarine, trocadero, 10:0,18:0, 60).
pontoDeInteresse(laTourEiifel, birhakeim, 9:30,23:0, 120).
pontoDeInteresse(egliseSaintLeon, dupleix, 8:30, 19:30, 30).
pontoDeInteresse(marcheSaxeBreteuil, sevreslecourbe, 7:0, 15:0, 30).
pontoDeInteresse(museeNationalDeCeramique, pontdesevres, 10:0, 17:0, 30).
pontoDeInteresse(jardinduRanelagh, lamuette, 0:0, 19:0, 120).
pontoDeInteresse(gareSaintLazare, chausseedantinlafayette, 5:0, 0:0,30).
pontoDeInteresse(museegrevin, richelieudruout, 10:0, 19:00, 120).
