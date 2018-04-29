xquery version "3.0"; (:Fortement inspiré du cours de Erik Siegel & Adam Retter édité par O'Reilly:)
declare namespace html = "http://www.w3.org/1999/xhtml";
declare namespace functx = "http://www.functx.com";
declare variable $doc := doc("../Transcription/transcription_final_one.xml");


<div
    class="container-fluid"
    id="site-wrapper">
    <div
        class="row py-2">
        <div
            class="col-4 bg-light"
            id="ms-image-container">
            <div
                class="btn-group"
                id="image-controls"
                role="group"
                aria-label="Basic example">
                <button
                    type="button"
                    class="btn btn-secondary"
                    data-action="zoom-image"
                    data-direction="in">+</button>
                <button
                    type="button"
                    class="btn btn-secondary"
                    data-action="zoom-image"
                    data-direction="out">-</button>
            </div>
            <img
                class="ms-image"
                data-scale="1"
                src="Photos/kk.3.21-7r.jpg"
                alt="image of the manuscript">kk.3.21-7r</img>
        </div>
        <div
            class="col-5">
            <div
                class="row">
                <h1
                    class="col-0">Transcription</h1>
            </div>
            <div
                id="transcription">
                >>here is the transcription>>
                {
                    for $text in $doc/text
                    return 
                        for $region in $text/region/glossed
                        let $glossesA-1 := $region/descendant::glossed[@where = "interlinear"]
                        let $glossesA-2 := $glossesA-1/descendant::glossed[@where = "marginal"]
                        return
                            if ($region/data(@where = "interlinear"))
                            then
                                if ($region[data(@where = "interlinear")]/descendant::glossed[@where = "marginal"])
                                then
                                    (<a
                                        class="glossed"
                                        data-glossed-by="interlinear"
                                        data-trigger="focus"
                                        data-toggle="popover"
                                        data-placement="top"
                                        data-content="{$region/glossed/data(@content)}"><span
                                            class="glossed"
                                            data-glossed-by="marginalia"
                                            data-marginalia-id="{count($region[data(@where = "interlinear")]/descendant::glossed[@where = "marginal"]/preceding::glossed[@where = 'marginal']) + 1}"><b>[{data($region/glossed/call)}]</b>{data($region/glossed//text()[not(parent::call)])}</span></a>
                                    
                                    
                                    )
                                else
                                    ((<a
                                        class="glossed"
                                        data-glossed-by="interlinear"
                                        data-trigger="focus"
                                        data-toggle="popover"
                                        data-placement="top"
                                        data-content="{$region/data(@content)}">{data($region//text())}</a>
                                    
                                    
                                    ))
                            else
                                if ($region/data(@where = "marginal"))
                                then
                                    
                                    (<a
                                        class="glossed"
                                        data-glossed-by="marginalia"
                                        data-marginalia-id="{count($region[data(@where = "marginal")]/preceding::glossed[@where = 'marginal']) + 1}"
                                    ><b>[{data($region/call)}]</b>{data($region//text()[not(parent::call)])}</a>)
                                else
                                    ()
                
                }
            </div>
        
        </div>
    </div>
</div>