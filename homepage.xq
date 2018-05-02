xquery version "3.0"; (:Fortement inspiré du cours de Erik Siegel & Adam Retter édité par O'Reilly:)
declare namespace html = "http://www.w3.org/1999/xhtml";
declare namespace functx = "http://www.functx.com";
declare option exist:serialize "method=html media-type=text/html"; (:Indiquer que le document produit est du html:)
declare variable $page-title := "DEMM Hack Prototype - BG's rock !";

let $open_transcription_file := doc('/db/apps/the_beegees_project/data/tei-conformant_transcription.xml')
return
    
    transform:transform($open_transcription_file, doc("/db/apps/the_beegees_project/xsl/transformation_final.xsl"), ())