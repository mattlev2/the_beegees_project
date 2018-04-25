xquery version "3.0"; (:Fortement inspiré du cours de Erik Siegel & Adam Retter édité par O'Reilly:)
declare namespace html = "http://www.w3.org/1999/xhtml";
declare namespace functx = "http://www.functx.com";
declare option exist:serialize "method=html media-type=text/html"; (:Indiquer que le document produit est du html:)
declare variable $page-title := "DEMM Hack Prototype";

let $open_transcription_file := doc('/db/apps/the_beegees_project/data/transcription.xml')
return
<html class="no-js" lang="en-GB">
  <head>
    <title>{$page-title}</title>
    <link rel="stylesheet" href="libs/bootstrap-4.0.0-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
  </head>
  <body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div>
          <form class="form form-inline" method="POST" action="search_results.xq">
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
          <img class="ms-image" src="Photos/kk.3.21-6v.jpg" alt="image of the manuscript"/>
        </div>
        <div class="col-5">
          <div class="row">
          <h1 class="col-0">Transcription</h1>
          <button class="btn btn-light" data-action="show" id="toggle-all-interlinear">Show all Interlinear Glosses</button>
          </div>
          <div id="transcription">

            tonis ore sanxisti beatas fore <a class="glossed" data-glossed-by="marginalia" data-marginalia-id="1">res publicas.<br/>
              si eas vel studiosi</a> sapientiae regerent. vel<br/>
            totiusque vitae rationem.  ad caelestis ordinis exempla<br/>
            formares. <a class="glossed" data-glossed-by="interlinear" data-trigger="focus" data-toggle="popover" data-placement="top" data-content="this is the text of the interlinear gloss">Haecene</a> praemia referimus tibi<br/>
            obsequentes; Atqui tu hanc sententiam Pla <br/>



            totiusque vitae rationem. A ad caelestis ordinis exempla<br/>. 
            Haecine praemia referimus tibi<br/>
               obsequentes; Atqui tu hanc sententiam Pla <br/>
               tonis ore sanxisti beatas fore res publicas.<br/>
               si eas vel <span class="interlinear-a">studiosi</span> sapientiae regerent. vel<br/>
               earum rectores studere sapientiae contigisset.<br/>
               Tu eiusdem viri ore hanc sapientibus capessendae<br/>
               rei .p(ublicae). <span class="interlinear-b">necessariam</span> causam esse monuisti;<br/>
               ne improbis flagitiosisque civibus urbium relicta<br/>
               gubernacula. pestem bonis ac perniciem<br/>
               ferrent. Hanc igitur auctoritatem secutus.<br/>
               quod a te inter secreta otia didiceram. trans<br/>
               ferre in actum publicae administrationis optavi;<br/>
               Tu mihi et qui te sapientium mentibus inseruit<br/>
               deus conscii nullum me ad magistratum nisi<br/>
               commune omnium bonorum studium de<br/>
               tulisse. Inde cum improbis graves inexorabi<br/>
               lesque discordiae et quod conscientiae liber<br/>
               tas habet. pro tuendo iure spreta potentiorum<br/>
               semper offensio. Quotiens ego conigastum.<br/>
               inimbecillis cuiusque fortunas impetum fa<br/>
               cientem. obvius excepi. quotiens trigguillam <br/>
          </div>
        </div>
        <aside class="col-3" id="marginalia">
          <h2>Marginalia (more information <i>here</i>)</h2>
          <div class="marginalia" data-marginalia-id="1">alkjsdlkjlasdj</div>
          <div class="marginalia" data-marginalia-id="2">alkjsdlkjlasdj</div>

        </aside>
      </div>
    </div>
    <script src="libs/handlebars/handlebars-v4.0.11.js"></script>
    <script src="libs/jquery/jquery-3.3.1.min.js"></script>
    <script src="libs/popper/popper.min.js"></script>
    <script src="libs/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
    <script src="js/application.js" charset="utf-8"></script>
  </body>
</html>
