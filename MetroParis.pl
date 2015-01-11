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

/******Linha 3********/
/*****************************
linha(3,[pontdelevalloisbecon,
          anatolefrance,
          louisemichel,
          portedechamperret,
          pereire,
          wagram,
          malesherbes,
          villiers,
          europe,
          saintlazare,
          havrecaumartin,
          opera,
          quatreseptembre,
          bourse,
          sentier,
          reaumursebastopol,
          artsetmetiers,
          temple,
          republique,
          parmentier,
          ruesaintmaur,
          perelachaise,
          gambetta,
          portedebagnolet,
          gallieni]).
**********************/

/******Linha 4 ********/
linha(4,[portedeclignancourt,
          simplon,
          marcadetpoissonniers,
          chateaudeau,
          strasbourgsaintdenis,
          reaumursebastopol,
          etiennemarcel,
          leshalles,
          chatelet,
          cite,
          saintmichel,
          odeon,
          saintgermaindespres,
          saintsulpice,
          montparnassebienvenue,
          vavin,
          raspail,
          denfertrochereau,
          moutonduvernet,
          alesia,
          portedorleans,
          mairiedemontrouge]).

/******Linha 5 ********/
linha(5,[bobignypablopicasso,
          bobignypantinraymondqueneau,
          eglisedepantin,
          hoche,
          portedepantin,
          ourcq,
          laumiere,
          jaures,
          stalingrad,
          garedunord,
          garedelest,
          jacquesbonsergent,
          republique,
          oberkampf,
          richardlenoir,
          breguetsabin,
          bastille,
          quaidelarapee,
          garedausterlitz,
          saintmarcel,
          campoformio,
          placeditalie]).

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

/******Linha 7 ********/
/***************************
linha(7,[lacourneuve8mai1945,
          fortdaubervilliers,
          aubervillierspantinquatrechemins,
          portedelavillette,
          corentincariou,
          crimee,
          riquet,
          stalingrad,
          louisblanc,
          chateauLandon,
          garedelest,
          poissonniere,
          cadet,
          lepeletier,
          chausseedantinlafayette,
          opera,
          pyramides,
          palaisroyalmuseeduLouvre,
          pontneuf,
          chatelet,
          pontMarie,
          sullymorland,
          jussieu,
          placemonge,
          censierdaubenton,
          lesgobelins,
          placeditalie,
          tolbiac,
          maisonblanche,
          porteditalie,
          portedechoisy,
          portedivry,
          pierreetmariecurie,
          mairiedivry]).
*************************/

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
horario(3,pontdelevalloisbecon,gallieni,630,1485,2,5,5,8).
horario(3,gallieni,pontdelevalloisbecon,630,1486,2,5,5,8).
horario(4,portedeclignancourt,mairiedemontrouge,630,1486,1,4,4,4).
horario(4,mairiedemontrouge,portedeclignancourt,630,1487,1,4,4,4).
horario(5,bobignypablopicasso,placeditalie,630,1482,3,9,5,12).
horario(5,placeditalie,bobignypablopicasso,630,1483,3,9,5,12).
horario(6,charlesdegaulleetoile,nation,330,1482,4,12,10,10).
horario(6,nation,charlesdegaulleetoile,330,1483,4,12,10,10).
horario(7,lacourneuve8mai1945,mairiedivry,329,1470,3,2,5,6).
horario(7,mairiedivry,lacourneuve8mai1945,330,1461,3,2,5,6).
horario(8,balard,creteilpointedulac,330,1465,4,7,5,5).
horario(8,creteilpointedulac,balard,330,1465,4,7,5,5).
horario(9,pontdesevres,mairiedemontreuil,330,1467,9,12,13,10).
horario(9,mairiedemontreuil,pontdesevres,325,1467,9,12,13,10).

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
