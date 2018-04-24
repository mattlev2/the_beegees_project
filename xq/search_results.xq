xquery version "3.0"; (:Courte description de la feuille: :)
import module namespace x101log =
"http://www.exist-db.org/book/namespaces/exist101" at "log-module.xqm";

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
        {
            (if ($select_type_of_text = contains("1"))
            then
                (let $extrait := doc("transcription.xml")/text/text()[contains(., concat(" ", $searchphrase, " "))]
                return
                    (if (exists($extrait))
                    then
                        (<ul>In the main text, I do have found the requested string:
                            {
                                for $extrait in $extrait (:Recherche d'une chaine de caractères. :)
                                let $localisation_extrait := $extrait/preceding::pb/data(@n)
                                return
                                    <li>
                                        From folio {$localisation_extrait}<br/>
                                        <i>template to match the text between two lb elements</i>
                                    </li>
                            
                            }
                        </ul>)
                    else
                        ('The main text does not contains the string you are looking for. Bad luck !')
                    )
                )
            else
                ()
            )
        }
        {
            (if ($select_type_of_text = contains("2"))
            then
                (let $extrait2 := doc("transcription.xml")/text/glossed[@where = "margin"][@content[contains(., concat(" ", $searchphrase, " "))]]
                return
                    (if (exists($extrait2))
                    then
                        (<ul>In the marginalia, I do have found the requested string:
                            {
                                for $extrait2 in $extrait2 (:Recherche d'une chaine de caractères. :)
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
        }
        {
            (if ($select_type_of_text = contains("3"))
            then
                (let $extrait3 := doc("transcription.xml")/text/text()[contains(., concat(" ", $searchphrase, " "))]
                return
                    (if (exists($extrait3))
                    then
                        (<ul>In the interlinear gloss, I do have found the requested string:
                            {
                                for $extrait3 in $extrait3 (:Recherche d'une chaine de caractères. :)
                                let $localisation_extrait := $extrait3/preceding::pb/data(@n)
                                return
                                    <li>
                                        From folio {$localisation_extrait}<br/>
                                        <i>template to match the text between two lb elements</i>
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
        }
    </body>
</html>