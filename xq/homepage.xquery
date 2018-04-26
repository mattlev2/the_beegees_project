xquery version "3.0"; (:Fortement inspiré du cours de Erik Siegel & Adam Retter édité par O'Reilly:)
declare namespace html = "http://www.w3.org/1999/xhtml";
declare namespace functx = "http://www.functx.com";
declare option exist:serialize "method=html media-type=text/html"; (:Indiquer que le document produit est du html:)
declare variable $page-title := "DEMM Hack Prototype";

let $open_transcription_file := doc('/db/apps/the_beegees_project/data/transcription.xml')
return
<html class="no-js" lang="en-GB">
  <head>
    <title>DEMM Hack Prototype</title>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <script src="libs/jquery/jquery-3.3.1.min.js"></script> 
    <script type="text/javascript" src="libs/csi.js/csi.min.js"></script>
    <meta name="description" content="This is a prototype digital manuscript edition made during the DEMM Hack week at Cambridge University Library.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="libs/bootstrap-4.0.0-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
  <body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div>
          <form class="form form-inline" method="post" action="search_results.xq">
            <input type="text" class="form-control form-control-input" name="searchphrase" placeholder="Enter your search term..." size="40"/>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="search-main-text" value="main-text"/>
              <label class="form-check-label" for="search-main-text">Main Text</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="search-marginalia" value="marginalia"/>
              <label class="form-check-label" for="search-marginalia">Marginalia</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="search-interlinear" value="interlinear"/>
              <label class="form-check-label" for="search-interlinear">Interlinear Glosses</label>
            </div>
            <button type="submit" class="btn btn-success">Search</button>
          </form>
        </div>
      </nav>
    <div class="container-fluid" id="site-wrapper">
    <div class="row py-2">
        <div class="col-4 bg-light" id="ms-image-container">
            <div class="btn-group" id="image-controls" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-secondary" data-action="zoom-image"
                    data-direction="in">+</button>
                <button type="button" class="btn btn-secondary" data-action="zoom-image"
                    data-direction="out">-</button>
            </div>
            <img class="ms-image" data-scale="1" src="Photos/kk.3.21-6v.jpg"
                alt="image of the manuscript"/>
        </div>
        <div class="col-5">
            <div class="row">
                <h1 class="col-0">Transcription</h1>
                <button class="btn btn-light" data-action="show" id="toggle-all-interlinear">Show
                    all Interlinear Glosses</button>
            </div>
            <div id="transcription">
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="regali">regiae</a>
                praepositum domus. <a class="glossed" data-glossed-by="interlinear"
                    data-trigger="focus" data-toggle="popover" data-placement="top"
                    data-content="ab inchoato malo">ab incoepta</a> per<br/>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top"
                    data-content="imo non solum coeperat sed imo perpetraverat">perpetrataque</a>
                iam prorsus <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="iniustitia">iniuria</a>
                deieci. Quoti<br/> ens <a class="glossed" data-glossed-by="interlinear"
                    data-trigger="focus" data-toggle="popover" data-placement="top"
                    data-content="nostros">miseros</a> quos infinitis calumniis <a class="glossed"
                    data-glossed-by="interlinear" data-trigger="focus" data-toggle="popover"
                    data-placement="top" data-content="quia impune remanebat sicut sine victoria"
                    >inpunita</a><br/> B <a class="glossed" data-glossed-by="interlinear"
                    data-trigger="focus" data-toggle="popover" data-placement="top"
                    data-content="ibest gothorum"><a class="glossed" data-glossed-by="marginalia"
                        data-marginalia-id="1"> barbarorum</a></a> semper avaritia vexabat;<br/>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top"
                    data-content="opposita. aversita tibi">obiecta</a> periculis <a class="glossed"
                    data-glossed-by="interlinear" data-trigger="focus" data-toggle="popover"
                    data-placement="top" data-content="defensione mea. consulari quererat consul"
                    >auctoritate protexi.</a> Num<br/> quam me <a class="glossed"
                    data-glossed-by="interlinear" data-trigger="focus" data-toggle="popover"
                    data-placement="top" data-content="sicut a iustitia">ab iure</a>. <a
                    class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="ad iniustitiam">ad
                    iniuriam</a>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="aliquis">quisquam</a>
                <br/> detraxit. <a class="glossed" data-glossed-by="marginalia"
                    data-marginalia-id="2">A Provincialium</a> fortunas. <a class="glossed"
                    data-glossed-by="interlinear" data-trigger="focus" data-toggle="popover"
                    data-placement="top" data-content="primum per??ones ministrosque">tum</a>
                pri<br/> vatis rapinis. <a class="glossed" data-glossed-by="interlinear"
                    data-trigger="focus" data-toggle="popover" data-placement="top"
                    data-content="aliquando">tum</a>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="dominicis">publicis</a>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="de teleo idest cum"
                    >vectigalibus</a><br/>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top"
                    data-content="sicut per aciturarri perire idest in pertid???onem reditibus que arege invehebantur"
                        ><a class="glossed" data-glossed-by="marginalia" data-marginalia-id="3">G
                        pessumdari</a></a> ; non aliter quam qui patiebantur<br/> F <a
                    class="glossed" data-glossed-by="marginalia" data-marginalia-id="4"> indolui. </a>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top"
                    data-content="id est amare et in maturar et est metafora ab uvis immaturis"> Cum
                    acerbae famis tempore. gravis </a>
                <br/> atque inexplicabilis <a class="glossed" data-glossed-by="interlinear"
                    data-trigger="focus" data-toggle="popover" data-placement="top"
                    data-content="a rege constituta"><a class="glossed" data-glossed-by="marginalia"
                        data-marginalia-id="5">N indicta</a></a>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="qua milites alerent"><a
                        class="glossed" data-glossed-by="marginalia" data-marginalia-id="6">E
                        coemptio</a></a> . <a class="glossed" data-glossed-by="interlinear"
                    data-trigger="focus" data-toggle="popover" data-placement="top"
                    data-content="afflictura">pro fligatura</a>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="per inopiam">inopia</a>
                campaniam provinciam <br/> videretur; certamen adversum <a class="glossed"
                    data-glossed-by="interlinear" data-trigger="focus" data-toggle="popover"
                    data-placement="top" data-content="a preficiendo">praefectum</a>
                <br/>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="domus iudicatoriae"
                    >praetorii communis</a>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="utilitatis">commodi</a>
                ratione suscepi;<br/>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="Theodorico audiente"
                    >rege cognoscente</a>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="cum praefecto illo"
                    >contendi</a>. <a class="glossed" data-glossed-by="marginalia"
                    data-marginalia-id="7"><a class="glossed" data-glossed-by="interlinear"
                        data-trigger="focus" data-toggle="popover" data-placement="top"
                        data-content="tributum">et ne coemptio exigeretur D evici.</a></a> R <a
                    class="glossed" data-glossed-by="marginalia" data-marginalia-id="8"> Paulinum </a>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top"
                    data-content="dignum consulatum de consulato depositus iniusta accusatione barbari in palatio ne fiducia"
                        ><a class="glossed" data-glossed-by="marginalia" data-marginalia-id="9">O
                        consularem virum. </a></a> cuius <a class="glossed"
                    data-glossed-by="interlinear" data-trigger="focus" data-toggle="popover"
                    data-placement="top" data-content="facultates">opes</a> X <a class="glossed"
                    data-glossed-by="marginalia" data-marginalia-id="10"> Palatinae </a>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="id est canini homines"
                        ><a class="glossed" data-glossed-by="marginalia" data-marginalia-id="11">
                        Hcanes</a></a> iam spe<br/> atque <a class="glossed"
                    data-glossed-by="interlinear" data-trigger="focus" data-toggle="popover"
                    data-placement="top" data-content="superbia">ambitione</a>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="pro devorant"
                    >devorassent</a> ; ab ipsis <a class="glossed" data-glossed-by="interlinear"
                    data-trigger="focus" data-toggle="popover" data-placement="top"
                    data-content="comedentium">hian tium</a> faucibus traxi. <a class="glossed"
                    data-glossed-by="interlinear" data-trigger="focus" data-toggle="popover"
                    data-placement="top" data-content="quare">Ne</a> R <a class="glossed"
                    data-glossed-by="marginalia" data-marginalia-id="12">Albinum.</a> consula<br/>
                rem virum. <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top"
                    data-content="prepropere male iudicate indiscusse">praeiudicatae </a> P <a
                    class="glossed" data-glossed-by="marginalia" data-marginalia-id="13">b
                    accusationis</a> poena<br/>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="scilicet ut moriretur"
                    >corriperet</a>; odiis me cypriani <a class="glossed"
                    data-glossed-by="interlinear" data-trigger="focus" data-toggle="popover"
                    data-placement="top" data-content="accusatoris inmisi">delatoris</a>
                opposui.<br/> Satisne <a class="glossed" data-glossed-by="interlinear"
                    data-trigger="focus" data-toggle="popover" data-placement="top"
                    data-content="contra me">in me</a> magnas <a class="glossed"
                    data-glossed-by="interlinear" data-trigger="focus" data-toggle="popover"
                    data-placement="top" data-content="a te">uideor</a>
                <a class="glossed" data-glossed-by="interlinear" data-trigger="focus"
                    data-toggle="popover" data-placement="top" data-content="accumulasse"
                    >exacervasse</a> discordias.</div>
            <aside class="col-3" id="marginalia">
                <h2>Marginalia</h2>
                <div class="marginalia" data-marginalia-id="1">Romani exceptis grecis ceteras
                    nationes barbaros nominabant;</div>
                <div class="marginalia" data-marginalia-id="2">Provinciales super milites qui a
                    militia liberi sunt. Et nulli quicquam debent. Idem prolitteri dicti quod soli
                    prole faveant;</div>
                <div class="marginalia" data-marginalia-id="3">Pessum dari quasi pedes sursum dars
                    dum aliquis retro cadit;</div>
                <div class="marginalia" data-marginalia-id="4">Quia insolita tributa pendebant
                    aliquando iubente rege gothorum. aliquando eo nesciente. ideo dolebat iste sicut
                    illi que patiebantur;</div>
                <div class="marginalia" data-marginalia-id="5">Quia indicta fuerat ab rege ut ex
                    iussu illius emeret quisquis utile et constituerat quomodo debuisset emi;</div>
                <div class="marginalia" data-marginalia-id="6">Idest venditione tam graviter ab illo
                    praefecto venundaretur qui ex annona precium recipere volebat;</div>
                <div class="marginalia" data-marginalia-id="7">tempore famis dum regis horrea ac
                    principum plena essent regia iubente potentia. indicta est coemptio gravissima .
                    ita ut gravius emerent frumenta regis . quae res dum nimium campaniam affligeret
                    . boeciis periculose opponens ne id fieret evicit;</div>
                <div class="marginalia" data-marginalia-id="8">Hi duo fuerant homines Theodorici
                    ducis quibus enim illo in tempore accidit commisisse necessariam rem apud ipsum
                    ducem Romae urbis quo scientiae eandem rem iussit eos pergere in ex ilium.
                    Venientes se ad ravennam urbem. noluit inde recedere. qui ipso die quo debis
                    factum fuerit hoc accusaverent me eisque factibus suscepta est apud regem;</div>
                <div class="marginalia" data-marginalia-id="9">Post ammissum consulatum consulares
                    appellabantur illi. quia cessabant ab officio barbari;</div>
                <div class="marginalia" data-marginalia-id="10">Palatinos inros qui assiduae
                    palatium incolunt . Palatines canes vocat propter cupiditatem voracitatis;</div>
                <div class="marginalia" data-marginalia-id="11"> Canes dicuntur qui semper in
                    palatio deserviunt quos iste vocat canes contrarios ./ quia sicut canes ita illi
                    inpudenter incidunt. et comedunt opes palatinam;</div>
                <div class="marginalia" data-marginalia-id="12">Hi duo fuerant homines Theodorici
                    ducis quibus enim illo in tempore accidit commisisse necessariam rem apud ipsum
                    ducem Romae urbis quo scientiae eandem rem iussit eos pergere in ex ilium.
                    Venientes se ad ravennam urbem. noluit inde recedere. qui ipso die quo debis
                    factum fuerit hoc accusaverent me eisque factibus suscepta est apud regem;</div>
                <div class="marginalia" data-marginalia-id="13">Quia antequam praesentaretur ut se
                    defenderet regit potestas iussit eum puniri;</div>
            </aside>
        </div>
    </div>
</div>

    <!--<script id="template-note" type="text/x-handlebars-template">
      {{!-\- {{This is a Handlebars template}} -\-}}
      <div class="sidebar-note border border-transparent rounded my-3 p-3" data-note-id="{{id}}">
        <h5>{{type}}</h5>
        {{{content}}}<br/> 
        <p class="text-right"><small>{{author}}</small><br/>
      </div>
    </script>-->
    <script src="libs/handlebars/handlebars-v4.0.11.js"></script>
    <script src="libs/jquery/jquery-3.3.1.min.js"></script>
    <script src="libs/popper/popper.min.js"></script>
    <script src="libs/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
    <script src="js/application.js" charset="utf-8"></script>
  </body>
</html>

