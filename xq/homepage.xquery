xquery version "3.0"; (:Fortement inspiré du cours de Erik Siegel & Adam Retter édité par O'Reilly:)
declare namespace html = "http://www.w3.org/1999/xhtml";
declare namespace functx = "http://www.functx.com";
declare option exist:serialize "method=html media-type=text/html"; (:Indiquer que le document produit est du html:)
declare variable $page-title := "DEMM Hack Prototype";

let $open_transcription_file := doc('/db/apps/the_beegees_project/data/transcription.xml')
return
    <html
        class="no-js"
        lang="en-GB">
        <head>
            <title>DEMM Hack Prototype</title>
            <meta
                charset="utf-8"></meta>
            <meta
                http-equiv="x-ua-compatible"
                content="ie=edge"></meta>
            <script
                src="libs/jquery/jquery-3.3.1.min.js"></script>
            <meta
                name="description"
                content="This is a prototype digital manuscript edition made during the DEMM Hack week at Cambridge University Library."/>
            <meta
                name="viewport"
                content="width=device-width, initial-scale=1"/>
            <link
                rel="stylesheet"
                href="libs/bootstrap-4.0.0-dist/css/bootstrap.min.css"/>
            <link
                rel="stylesheet"
                href="css/style.css"/>
        </head>
        <body>
            <div
                id="welcome-splash"
                class="modal fade"
                tabindex="-1"
                role="dialog">
                <div
                    class="modal-dialog"
                    role="document">
                    <div
                        class="modal-content pt-5 px-2">
                        <h5>The Beegees' Project</h5>
                        <p>The manuscript Cambridge University Library Kk.3.21 contains Boethius' De consolatione philosophiae.
                            It is an 11th century book probably created in the abbey of Abingdon, England.
                            The manuscript contains extensive contemporary glosses
                            (interlinear and marginal almost in Latin, few of them in Old English)
                            and also some subsequent additions (12th century and later). </p>
                        <p>The majority of glosses are written by a single hand, except for rare later addictions;
                            They are divided in three types:</p><p>1) interlinear glosses, used to to clarify the classical Latin;</p>
                        <p>2) marginal glosses, used to explain the main text, i.e. meaning of single words, sentences and events mentioned in;
                            they are anchored to the main text by a set of marks (mostly Greek alphabet).</p>
                        <p>3) additional glosses written in red capital letters,
                            wich refers to the rethorical aspects.</p>
                        <h5>The BGS'Project aims:</h5>
                        <p>1) to give a direct access to the text based on interpretative transcription (i. e. restitution of capital letters, distinction between <i>u</i> / <i>v</i>, modern words' segmentation) in a easy way, also for the readers not used to the Latin paleography;</p>
                        <p>2) to offer the possibility to compare the original layout and the modern transcription;</p>
                        <p>3) to give the text transcription of all type of glosses and to show easily and directly their purpose;</p>
                        <p>4) to explain the correct order of the marginal glosses;</p>
                        <p>5) to offer lexical concordances of the entire text and a direct link to a dictionary i. e. Logeion.</p>
                        <h5>HOW TO NAVIGATE:</h5>
                        <p>1) on the left side of the page you will find the zoomable image of manuscript; on the centre the interpretative transcription of the main text;</p>
                        <p>2) if you want to read the interlinear glosses: move your mouse on the underlined words, they will appear as a pop-up above the text;</p>
                        <p>3) if you want to read the marginal and additional glosses move your mouse on the the highlighted words, they are in the right side of the page;</p>
                        <p>4) if you want to search a single word in the text: write it in the "search box"; you can select the criteria of research "main text", "interlinear glosses", "marginal glosses" (in wich are included the additional ones) or combining them. The concordances will appear in a second page surrounded by context, references to the passages and direct link to the text that they belong.</p>
                        
                        
                        <div
                            class="modal-footer">
                            <div
                                class="col-auto">
                                <button
                                    type="button"
                                    class="btn btn-primary form-control"
                                    data-dismiss="modal">Dismiss this message</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <nav
                class="navbar navbar-expand-lg navbar-light bg-light">
                <div>
                    <form
                        class="form form-inline"
                        method="post"
                        action="search_results.xq">
                        <input
                            type="text"
                            class="form-control form-control-input"
                            name="searchphrase"
                            placeholder="Enter your search term..."
                            size="40"/>
                        <div
                            class="form-check form-check-inline">
                            <input
                                class="form-check-input"
                                type="checkbox"
                                id="search-main-text"
                                name="main_text"
                                value="1"/>
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
                                name="marginalia"
                                value="2"/>
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
                                name="interlinear"
                                value="3"/>
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
                id="site-wrapper"><div
                    class="row py-2">
                    <div
                        class="col-4 bg-light"
                        id="ms-image-container"><div
                            class="btn-group"
                            id="image-controls"
                            role="group"
                            aria-label="Basic example"><button
                                type="button"
                                class="btn btn-secondary"
                                data-action="zoom-image"
                                data-direction="in">+</button><button
                                type="button"
                                class="btn btn-secondary"
                                data-action="zoom-image"
                                data-direction="out">-</button></div>
                        <div
                            class="buttonery"><button>Next folio</button>
                            <button>Previous folio</button></div><figure><img
                                class="ms-image"
                                data-scale="1"
                                src="Photos/kk.3.21-6v.jpg"
                                alt="image of the manuscript"/><figcaption>Ms kk.3.21-6v</figcaption></figure></div>
                    <div
                        class="col-5"><div
                            class="row"><h1
                                class="col-0">Transcription</h1></div><div
                            id="transcription">
                            
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="regali">regiae</a> praepositum domus.
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="ab inchoato malo">ab incoepta</a> per
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="imo non solum coeperat sed imo perpetraverat">perpetrataque</a> iam prorsus <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="iniustitia">iniuria</a> deieci.
                            Quoti ens <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="nostros">miseros</a> quos infinitis calumniis <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="quia impune remanebat sicut sine victoria">inpunita</a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="idest gothorum"><span
                                    class="glossed"
                                    data-glossed-by="marginalia"
                                    data-marginalia-id="1">
                                    B barbarorum</span></a> semper avaritia vexabat;
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="opposita. aversita tibi">obiecta</a> periculis
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="defensione mea. consulari quererat consul">auctoritate protexi.</a>
                            Num quam me <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="sicut a iustitia">ab
                                iure</a>. <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="ad iniustitiam">ad
                                iniuriam</a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="aliquis">quisquam</a>
                            detraxit.
                            
                            <a
                                class="glossed"
                                data-glossed-by="marginalia"
                                data-marginalia-id="2">A Provincialium</a> fortunas. <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="primum patrones ministrosque">tum</a> pri vatis rapinis. <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="aliquando">tum</a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="dominicis">publicis</a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="de teleonis idest cum">vectigalibus</a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="sicut periclitari perire idest in perditionem reditibus que a rege invehebantur"><span
                                    class="glossed"
                                    data-glossed-by="marginalia"
                                    data-marginalia-id="3">
                                    
                                    G pessumdari</span></a> ; non aliter quam qui patiebantur
                            <a
                                class="glossed"
                                data-glossed-by="marginalia"
                                data-marginalia-id="4">F indolui. </a>
                            
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="id est amare et in maturar et est metafora ab uvis immaturis">
                                Cum acerbae famis tempore. gravis </a>
                            atque inexplicabilis <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="a rege constituta"><span
                                    class="glossed"
                                    data-glossed-by="marginalia"
                                    data-marginalia-id="5">
                                    N indicta</span></a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="qua milites alerent"><span
                                    class="glossed"
                                    data-glossed-by="marginalia"
                                    data-marginalia-id="6">
                                    E coemptio</span></a> . <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="afflictura">pro fligatura</a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="per inopiam">inopia</a> campaniam provinciam
                            videretur;
                            certamen adversum <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="a preficiendo">praefectum</a>
                            
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="domus iudicatoriae">praetorii communis</a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="utilitatis">commodi</a> ratione suscepi;
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="Theodorico audiente">rege cognoscente</a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="cum praefecto illo">contendi</a>. <a
                                class="glossed"
                                data-glossed-by="marginalia"
                                data-marginalia-id="7"><span
                                    class="glossed"
                                    data-glossed-by="interlinear"
                                    data-trigger="focus"
                                    data-toggle="popover"
                                    data-placement="top"
                                    data-content="tributum">Et ne coemptio
                                    exigeretur D evici.</span></a>
                            
                            <a
                                class="glossed"
                                data-glossed-by="marginalia"
                                data-marginalia-id="8">R Paulinum </a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="dignum consulatum de consulato depositus iniusta accusatione barbari in palatio ne fiducia"><span
                                    class="glossed"
                                    data-glossed-by="marginalia"
                                    data-marginalia-id="9">
                                    O consularem virum.
                                </span></a> cuius <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="facultates">opes</a>
                            <a
                                class="glossed"
                                data-glossed-by="marginalia"
                                data-marginalia-id="10">X Palatinae </a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="id est canini homines"><span
                                    class="glossed"
                                    data-glossed-by="marginalia"
                                    data-marginalia-id="11">
                                    
                                    H canes</span></a> iam spe atque <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="superbia">ambitione</a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="pro devorant">devorassent</a> ; ab ipsis
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="comedentium">hian tium</a> faucibus
                            traxi.
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="quare">Ne</a>
                            <a
                                class="glossed"
                                data-glossed-by="marginalia"
                                data-marginalia-id="12">R Albinum.</a> consula rem virum. <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="prepropere male iudicate indiscusse">praeiudicatae </a>
                            <a
                                class="glossed"
                                data-glossed-by="marginalia"
                                data-marginalia-id="13">P accusationis</a> poena
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="scilicet ut moriretur">corriperet</a>; odiis me
                            cypriani <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="accusatoris inmisi">delatoris</a>
                            opposui.
                            Satisne <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="contra me">in me</a>
                            magnas <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="a te">uideor</a>
                            <a
                                class="glossed"
                                data-glossed-by="interlinear"
                                data-trigger="focus"
                                data-toggle="popover"
                                data-placement="top"
                                data-content="accumulasse">exacervasse</a>
                            discordias.
                        </div></div><aside
                        class="col-3"
                        id="marginalia"><h2>Marginalia</h2><div
                            class="pre-scrollable"><div
                                class="marginalia"
                                data-marginalia-id="1">Romani exceptis grecis ceteras nationes barbaros nominabant;</div><div
                                class="marginalia"
                                data-marginalia-id="2">Provinciales super milites qui a militia liberi sunt. Et nulli quicquam debent. Idem prolitteri dicti quod soli prole faveant;</div><div
                                class="marginalia"
                                data-marginalia-id="3">Pessum eari quasi pedes sursum dars dum aliquis retro cadit;</div><div
                                class="marginalia"
                                data-marginalia-id="4">Quia insolita tributa pendebant aliquando iubente rege gothorum. aliquando eo nesciente. ideo dolebat iste sicut illi que patiebantur;</div><div
                                class="marginalia"
                                data-marginalia-id="5">Quia indicta fuerat ab rege ut ex iussu illius emeret quisquis utile et constituerat quomodo debuisset emi;</div><div
                                class="marginalia"
                                data-marginalia-id="6">Idest venditione tam graviter ab illo praefecto venundaretur qui ex annona precium recipere volebat;</div><div
                                class="marginalia"
                                data-marginalia-id="7">tempore famis dum regis horrea ac principum plena essent regia iubente potentia. indicta est coemptio gravissima . ita ut gravius emerent frumenta regis . quae res dum nimium campaniam affligeret . boeciis periculose opponens ne id fieret evicit;</div><div
                                class="marginalia"
                                data-marginalia-id="8">Hi duo fuerant homines Theodorici ducis quibus enim illo in tempore accidit commisisse necessariam rem apud ipsum ducem Romae urbis quo scientiae eandem rem iussit eos pergere in ex ilium. Venientes se ad ravennam urbem. noluit inde recedere. qui ipso die quo debis factum fuerit hoc accusaverent me eisque factibus suscepta est apud regem;</div><div
                                class="marginalia"
                                data-marginalia-id="9">Post ammissum consulatum consulares appellabantur illi. quia cessabant ab officio barbari;</div><div
                                class="marginalia"
                                data-marginalia-id="10">Palatinos inros qui assiduae palatium incolunt . Palatines canes vocat propter cupiditatem voracitatis;</div><div
                                class="marginalia"
                                data-marginalia-id="11"> Canes dicuntur qui semper in palatio deserviunt quos iste vocat canes contrarios ./ quia sicut canes ita illi inpudenter incidunt. et comedunt opes palatinam;</div><div
                                class="marginalia"
                                data-marginalia-id="12">Hi duo fuerant homines Theodorici ducis quibus enim illo in tempore accidit commisisse necessariam rem apud ipsum ducem Romae urbis quo scientiae eandem rem iussit eos pergere in ex ilium. Venientes se ad ravennam urbem. noluit inde recedere. qui ipso die quo debis factum fuerit hoc accusaverent me eisque factibus suscepta est apud regem;</div><div
                                class="marginalia"
                                data-marginalia-id="13">Quia antequam praesentaretur ut se defenderet regit potestas iussit eum puniri;</div></div></aside></div>
            </div>
            
            
            <!--<script id="template-note" type="text/x-handlebars-template">
      {{!-\- {{This is a Handlebars template}} -\-}}
      <div class="sidebar-note border border-transparent rounded my-3 p-3" data-note-id="{{id}}">
        <h5>{{type}}</h5>
        {{{content}}}<br/> 
        <p class="text-right"><small>{{author}}</small><br/>
      </div>
    </script>-->
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
