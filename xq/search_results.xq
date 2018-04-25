xquery version "3.0"; (:Courte description de la feuille: :)


declare namespace html = "http://www.w3.org/1999/xhtml";
declare namespace functx = "http://www.functx.com";
declare option exist:serialize "method=html media-type=text/html"; (:Indiquer que le document produit est du html:)

declare variable $page-title := "Result(s) page";
declare variable $searchphrase := request:get-parameter("searchphrase", ());
declare variable $select_type_of_text := request:get-parameter(concat("select_type_of_text1", "select_type_of_text2", "select_type_of_text3"), ()); (:The first box if checked returns 1, the second 2, the third 3:)


<html>
    <head>
        <meta
            HTTP-EQUIV="Content-Type"
            content="text/html; charset=UTF-8"/>
        <title>{$page-title}</title>
    </head>
    <body>
        <h1>{$page-title}</h1>
        <p>Searched string: "{$searchphrase}"</p>
        { (:Show the string in context if asked and if found in the main text:)
                (let $extrait := doc("/db/apps/the_beegees_project/data/transcription.xml")/text//text()[contains(., $searchphrase)]
                return
                    (
                    if (exists($extrait))
                    then
                        (<ul>In the main text, I do have found the requested string:
                            {
                                for $extrait in $extrait (:Recherche d'une chaine de caractères. :)
                                let $localisation_extrait := $extrait/preceding::pb/data(@n)
                                return
                                    <li>
                                        From folio {$localisation_extrait}<br/>
                                        <i>{$extrait/parent::phrase//text()}</i>
                                    </li>
                            
                            }
                        </ul>)
                    else
                        ('The main text does not contains the string you are looking for. You should try again later!')
                    )
                )
            
        }
        { (:(\:Show the string in context if asked and if found in the marginalia:\)
            (if ($select_type_of_text = contains(., "2"))
            then
                (let $extrait2 := doc("/db/apps/the_beegees_project/data/transcription.xml")/text/glossed[@where = "margin"][data(@content[contains(., concat(" ", $searchphrase, " "))])]
                return
                    (if (exists($extrait2))
                    then
                        (<ul>In the marginalia, I do have found the requested string:
                            {
                                for $extrait2 in $extrait2 (\:Recherche d'une chaine de caractères. :\)
                                let $localisation_extrait := $extrait2/preceding::pb/data(@n)
                                
                                return
                                    <li>
                                        From folio {$localisation_extrait}<br/>
                                        <i>template to match the text between two lb elements</i>
                                    </li>
                            
                            }
                        </ul>)
                    else
                        ('There is no such string in the marginalia, sorry ! ')
                    )
                )
            else
                ()
            )
        :)''}
        {''(: (\:Show the string in context if asked and if found in the interlinear glosses:\)
            (if ($select_type_of_text = contains(., "3"))
            then
                (let $extrait3 := doc("/db/apps/the_beegees_project/data/transcription.xml")/text/glossed[@where = "interlinear"][data(@content[contains(., concat(" ", $searchphrase, " "))])]
                return
                    (if (exists($extrait3))
                    then
                        (<ul>In the interlinear gloss, I do  have found the requested string:
                            {
                                for $extrait3 in $extrait3 (\:Recherche d'une chaine de caractères. :\)
                                let $localisation_extrait := $extrait3/preceding::pb/data(@n)
                                let $gloss_for := doc("/db/apps/the_beegees_project/data/transcription.xml")/text/glossed[@where = "interlinear"]/text()
                                return
                                    <li>
                                        From folio {$localisation_extrait}<br/>
                                        <i>template to match the text between two lb elements</i>
                                        <b>gloss for:{$gloss_for}</b>
                                    </li>
                            
                            }
                        </ul>)
                    else
                        ('There is no such string in the interlinear glosses, sorry ! ')
                    )
                )
            else
                ()
            )
        :)}
    </body>
</html>