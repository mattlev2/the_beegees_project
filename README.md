# The Beegees' Project
Clone of Chris Marks' repo, for the beegees project. The members of the project are Jan DIENTSBIER, Cristina DUSIO, Matthias GILLE LEVENSON and Andrea TONDI during the last DEMM Week (23-28 of april, 2018) in Cambridge. See [here](https://specialcollections-blog.lib.cam.ac.uk/?p=16181) and [here](https://specialcollections-blog.lib.cam.ac.uk/?p=16181) for an overview from the Developers' point of view.   

### Quick presentation of the project
 


### Features of the app


+ **mise en relation des différentes strates de texte** The final prototype represents a single encoded page of the manuscript and the attached search engine. The the main text is accompanied by the zoomable image of the page. The glossed parts of the text are highlighted in the main text. The highlighted words are clickable - they create pop-ups with interlinear glosses (typically lexical explanations) and highlight marginal glosses which are in the scrollable box on the side of the page.

- **recherche relationnelle de chaînes de caractères** :
Above there is a search box, which leads to a search result page. One can navigate through the manuscript using the search box and also get to the dictionaries showing the meanings of the transcribed words (the prototype uses Logeion as a demonstration of its abilities).
 Le moteur de recherche met en relation le contexte (segment du texte principal, glose marginale ou glose interlinéraire) avec les éléments correspondants. Ainsi, si la chaîne recherchée fait partie d'une portion de texte glosée, apparaîtra à la fois le contexte général, la portion de texte glosée et le contenu de la glose. Si la chaîne recherchée est dans une glose marginale, apparaîtra cette glose marginale dans son intégralité et la portion de texte qu'elle commente; de même pour un chaîne contenue dans une glose interlinéaire.   

### How does it work


The prototype is running on eXist-db: to make it work on your computer, create a new collection and drag all the files in it, then run *homepage.xq*. Le prototype fonctionne entièrement avec un seul fichier-source encodé en selon les normes de la XML-TEI; un ODD est encore à venir. Ce fichier source est processé à la fois via des fichiers XSL (pour la page principale) et XQuery (en ce qui concerne la page de recherche). 

### Links

- static version (searching engine won't work): [here](http://perso.ens-lyon.fr/matthias.gille-levenson/BG_html_version/index.html)
- dynamic version: to be added 
