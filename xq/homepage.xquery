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
    <script> 
    $(function(){{
      $("#includedContent").load("html_subfile/html_output.html"); 
    }});
    </script> 
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
    <div id="includedContent"></div>
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

