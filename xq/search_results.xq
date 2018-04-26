xquery version "3.0"; (:Courte description de la feuille: :)


declare namespace html = "http://www.w3.org/1999/xhtml";
declare namespace functx = "http://www.functx.com";
declare option exist:serialize "highlight-matches=both";
declare option exist:serialize "method=html media-type=text/html"; (:Indiquer que le document produit est du html:)

declare variable $page-title := "Result(s) page";
declare variable $searchphrase := request:get-parameter("searchphrase", ());
declare variable $main_text := request:get-parameter("main_text", ());
declare variable $marginalia := request:get-parameter("marginalia", ());
declare variable $interlinear := request:get-parameter("interlinear", ());



<html>
    <head>
        <meta
            HTTP-EQUIV="Content-Type"
            content="text/html; charset=UTF-8"/>
        <title>{$page-title}</title>
        <link
            rel="stylesheet"
            href="libs/bootstrap-4.0.0-dist/css/bootstrap.min.css"/>
        <link
            rel="stylesheet"
            href="css/style.css"/>
    </head>
    <body>
        <nav
            class="navbar navbar-expand-lg navbar-light bg-light">
            <div>
                <form
                    class="form form-inline"
                    method="POST"
                    action="search_results.xq">
                    <input
                        type="text"
                        class="form-control form-control-input"
                        name="searchphrase"
                        value="{$searchphrase}"
                        placeholder="Enter your search term..."
                        size="40"/>
                    <div
                        class="form-check form-check-inline">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            id="search-main-text"
                            value="main-text"/>
                        <label
                            class="form-check-label"
                            for="search-main-text">Main Text</label>
                    </div>
                    <div
                        class="form-check form-check-inline">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            id="search-marginalia"
                            value="marginalia"/>
                        <label
                            class="form-check-label"
                            for="search-marginalia">Marginalia</label>
                    </div>
                    <div
                        class="form-check form-check-inline">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            id="search-interlinear"
                            value="interlinear"/>
                        <label
                            class="form-check-label"
                            for="search-interlinear">Interlinear Glosses</label>
                    </div>
                    <button
                        type="submit"
                        class="btn btn-success">Search</button>
                </form>
            </div>
        </nav>
        <div
            class="container-fluid"
            id="site-wrapper">
            <div
                class="row py-2">
                <h1>{$page-title}</h1>
                <p>Searched string: "{$searchphrase}" <a
                        href="http://logeion.uchicago.edu/index.html#{$searchphrase}" target="_blank">(link to the Logeion)</a></p>
                
                
                { let $select_type_of_text := concat($main_text, $marginalia, $interlinear) (:The first box if checked returns 1, the second 2, the third 3:)
                return 
                
                (:Show the string in context if asked and if found in the main text:)
                    (let $extract := doc("/db/apps/the_beegees_project/data/transcription.xml")/text//text()[contains(., concat(" ", $searchphrase, " "))]
                    return
                        
                        (
                        if (exists($extract))
                        then
                            (<ul>In the main text, I do have found the requested string:
                                {
                                    for $extract at $position in $extract (:Recherche d'une chaine de caractères. :)
                                    let $localisation_extract := $extract/preceding::pb/data(@n)
                                    (:let $highlighted :=util-expand($extract/ancestor::phrase, "expand-xincludes=no"):)
                                    
                                    return
                                        <li>
                                            From folio {$localisation_extract}<br/>
                                            
                                            
                                            
                                            <p
                                                class="main-text"
                                                data-marginalia-id="{$position}"><h5>A bit of context first:</h5>"{$extract/ancestor::phrase}"</p>
                                            {
                                                if ($extract/parent::glossed)
                                                then
                                                    <div
                                                        class="marginalia"
                                                        data-marginalia-id="{$position}"><h5>The string "{$searchphrase}" is part of a glossed sentence</h5>
                                                        <p>"{$extract/parent::glossed}"</p>
                                                        <h5>The gloss is:</h5><p>"{$extract/parent::glossed/data(@content)}"</p></div>
                                                
                                                else
                                                    ()
                                            }
                                        
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
                        (let $extract2 := doc("/db/apps/the_beegees_project/data/transcription.xml")/text/glossed[@where = "margin"][data(@content[contains(., concat(" ", $searchphrase, " "))])]
                        return
                            (if (exists($extract2))
                            then
                                (<ul>In the marginalia, I do have found the requested string:
                                    {
                                        for $extract2 in $extract2 (\:Recherche d'une chaine de caractères. :\)
                                        let $localisation_extract := $extract2/preceding::pb/data(@n)
                                        
                                        return
                                            <li>
                                                From folio {$localisation_extract}<br/>
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
                {
                    '' (: (\:Show the string in context if asked and if found in the interlinear glosses:\)
            (if ($select_type_of_text = contains(., "3"))
            then
                (let $extract3 := doc("/db/apps/the_beegees_project/data/transcription.xml")/text/glossed[@where = "interlinear"][data(@content[contains(., concat(" ", $searchphrase, " "))])]
                return
                    (if (exists($extract3))
                    then
                        (<ul>In the interlinear gloss, I do  have found the requested string:
                            {
                                for $extract3 in $extract3 (\:Recherche d'une chaine de caractères. :\)
                                let $localisation_extract := $extract3/preceding::pb/data(@n)
                                let $gloss_for := doc("/db/apps/the_beegees_project/data/transcription.xml")/text/glossed[@where = "interlinear"]/text()
                                return
                                    <li>
                                        From folio {$localisation_extract}<br/>
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
        :)
                }
            </div></div>
        
        <script
            src="libs/handlebars/handlebars-v4.0.11.js"></script>
        <script
            src="libs/jquery/jquery-3.3.1.min.js"></script>
        <script
            src="libs/popper/popper.min.js"></script>
        <script
            src="libs/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
        <script
            src="js/application.js"
            charset="utf-8"></script>
    </body>
</html>