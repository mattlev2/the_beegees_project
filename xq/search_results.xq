xquery version "3.0"; (:Courte description de la feuille: :)


declare namespace html = "http://www.w3.org/1999/xhtml";
declare namespace functx = "http://www.functx.com";
declare option exist:serialize "highlight-matches=both";
declare option exist:serialize "method=html media-type=text/html"; (:Indiquer que le document produit est du html:)

declare variable $page-title := "Result(s) page";
declare variable $nbsp := "&#xa0;";
declare variable $searchphrase := request:get-parameter("searchphrase", ());
declare variable $main_text := request:get-parameter("main_text", ());
declare variable $marginalia := request:get-parameter("marginalia", ());
declare variable $interlinear := request:get-parameter("interlinear", ());
declare variable $select_type_of_text := concat($main_text, $marginalia, $interlinear);

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
            <a
                href="homepage.xquery"
                class="btn btn-info"
                role="button">Return to main page</a>
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
                
                <h1>Searched string: "<a
                        href="http://logeion.uchicago.edu/index.html#{$searchphrase}"
                        target="_blank">{$searchphrase}</a>"</h1><br/>
                
                
                {
                    if (contains($select_type_of_text, "1"))
                    then
                        <div>{
                                (
                                
                                (::) (:The first box if checked returns 1, the second 2, the third 3:)
                                
                                (:Things that doesnt work: 
                                - strings before punctuation. 
                                - Find a way to avoid the tokenization of 
                                the call letter:)
                                (:Show the string in context if asked and if found in the main text:)
                                (let $extract := doc("/db/apps/the_beegees_project/data/transcription_final.xml")/text//text()[contains(., concat(" ", $searchphrase))]
                                return
                                    (<h5>Main text</h5>,
                                    if (exists($extract))
                                    then
                                        (<ul>
                                            {
                                                for $extract at $position in $extract (:Recherche d'une chaine de caractères. :)
                                                let $localisation_extract := $extract/preceding::pb/data(@n)
                                                (:let $highlighted :=util-expand($extract/ancestor::region, "expand-xincludes=no"):)
                                                
                                                return
                                                    <li>
                                                        Folio {$localisation_extract}<br/>
                                                        
                                                        
                                                        
                                                        <p
                                                            class="main-text"
                                                            data-marginalia-id="{$position}"><h5>Context:</h5>"{
                                                                for $item in fn:tokenize($extract/ancestor::region, '\W+')
                                                                return
                                                                    <a
                                                                        href="http://logeion.uchicago.edu/index.html#{$item}">{$item}{$nbsp}</a>
                                                            }"</p>
                                                        {
                                                            if ($extract/parent::glossed)
                                                            then
                                                                <div
                                                                    class="marginalias"
                                                                    data-marginalia-id="{$position}"><h5>The string "{$searchphrase}" is part of the following glossed word or sentence:</h5>
                                                                    <p>"{
                                                                            for $item in fn:tokenize($extract/parent::glossed, '\W+')
                                                                            return
                                                                                <a
                                                                                    href="http://logeion.uchicago.edu/index.html#{$item}">{$item}{$nbsp}</a>
                                                                        }"</p>
                                                                    <h5>The gloss to this sentence or word is:</h5><p>"{
                                                                            for $item in fn:tokenize($extract/parent::glossed/data(@content), '\W+')
                                                                            return
                                                                                <a
                                                                                    href="http://logeion.uchicago.edu/index.html#{$item}">{$item}{$nbsp}</a>
                                                                        }"</p></div>
                                                            
                                                            else
                                                                ()
                                                        }
                                                    
                                                    </li>
                                            
                                            }
                                        </ul>)
                                    else
                                        ('The main text does not contains the string you are looking for. You should try again later!')
                                    )
                                ))
                            }</div>
                    else
                        ()
                }
                { (:Show the string in context if asked and if found in the marginalia:)
                    (if (contains($select_type_of_text, "2"))
                    then
                        <div>{
                                (let $extract2 := doc("/db/apps/the_beegees_project/data/transcription_final.xml")/text//glossed[@where = "marginal"][data(@content[contains(., $searchphrase)])]
                                return
                                    (<h5>Marginal glosses</h5>,
                                    if (exists($extract2))
                                    then
                                        (<ul>
                                            {
                                                for $extract2 at $position in $extract2 (:Recherche d'une chaine de caractères. :)
                                                let $localisation_extract := $extract2/preceding::pb/data(@n)
                                                return
                                                    <li>
                                                        Folio {$localisation_extract}<br/>
                                                        <div
                                                            class="marginalias"
                                                            data-marginalia-id="{$position}"><h5>The string "{$searchphrase}" is part of the following marginal gloss:</h5>
                                                            <p>"{
                                                                    for $item in $extract2/fn:tokenize(data(@content), '\W+')
                                                                    return
                                                                        <a
                                                                            href="http://logeion.uchicago.edu/index.html#{$item}">{$item}{$nbsp}</a>
                                                                }"</p>
                                                            <h5>The glossed word or sentence is:</h5><p>"{
                                                                    for $item in fn:tokenize($extract2/text(), '\W+')
                                                                    return
                                                                        <a
                                                                            href="http://logeion.uchicago.edu/index.html#{$item}">{$item}{$nbsp}</a>
                                                                }"</p><p
                                                                class="main-text"
                                                                data-marginalia-id="{$position}"><h5>Context:</h5>"{
                                                                    for $item in $extract2/fn:tokenize($extract2/ancestor::region, '\W+')
                                                                    return
                                                                        <a
                                                                            href="http://logeion.uchicago.edu/index.html#{$item}">{$item}{$nbsp}</a>
                                                                }"</p></div>
                                                    
                                                    
                                                    </li>
                                            }
                                        </ul>)
                                    else
                                        ('There is no such string in the marginal glosses, sorry ! ')
                                    )
                                )
                            }</div>
                    else
                        ()
                    )
                }
                {
                    (:Show the string in context if asked and if found in the interlinear glosses:)
                    (if (contains($select_type_of_text, "3"))
                    then
                        <div>{
                                (let $extract3 := doc("/db/apps/the_beegees_project/data/transcription_final.xml")/text//glossed[@where = "interlinear"][data(@content[contains(., $searchphrase)])]
                                return
                                    (<h5>Interlinear glosses</h5>,
                                    if (exists($extract3))
                                    then
                                        (<ul>
                                            {
                                                for $extract3 at $position in $extract3 (:Recherche d'une chaine de caractères. :)
                                                let $localisation_extract := $extract3/preceding::pb/data(@n)
                                                return
                                                    <li>
                                                        Folio {$localisation_extract}<br/>
                                                        <div
                                                            class="marginalias"
                                                            data-marginalia-id="{$position}"><h5>The string "{$searchphrase}" is part of the following interlinear gloss:</h5>
                                                            <p>"{
                                                                    for $item in $extract3/fn:tokenize(data(@content), '\W+')
                                                                    return
                                                                        <a
                                                                            href="http://logeion.uchicago.edu/index.html#{$item}">{$item}{$nbsp}</a>
                                                                }"</p>
                                                            <h5>The glossed word or sentence is:</h5><p>"{
                                                                    for $item in $extract3/fn:tokenize($extract3/text(), '\W+')
                                                                    return
                                                                        <a
                                                                            href="http://logeion.uchicago.edu/index.html#{$item}">{$item}{$nbsp}</a>
                                                                }"</p>
                                                            <p
                                                                class="main-text"
                                                                data-marginalia-id="{$position}"><h5>Context:</h5>"{
                                                                    for $item in $extract3/fn:tokenize($extract3/ancestor::region, '\W+')
                                                                    return
                                                                        <a
                                                                            href="http://logeion.uchicago.edu/index.html#{$item}">{$item}{$nbsp}</a>
                                                                }"</p></div>
                                                    </li>
                                            
                                            }
                                        </ul>)
                                    else
                                        ('There is no such string in the interlinear glosses, sorry ! ')
                                    )
                                )
                            }</div>
                    else
                        ()
                    )
                
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