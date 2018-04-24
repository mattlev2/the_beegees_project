xquery version "3.0"; (:Courte description de la feuille: :)
import module namespace x101log =
"http://www.exist-db.org/book/namespaces/exist101" at "log-module.xqm";

declare namespace html = "http://www.w3.org/1999/xhtml";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace functx = "http://www.functx.com";

declare option exist:serialize "method=html media-type=text/html"; (:Indiquer que le document produit est du html:)

declare variable $page-title := "Résultats de la recherche";
declare variable $searchphrase := request:get-parameter("searchphrase", ());
declare variable $select_source := request:get-parameter("select_source", ());

declare function local:collection-or-doc($node as xs:string){ (:Mettre intterroger une collection ou un document en fonction de la requete. $node doit donc correspondre
au parametre transmis par la feuille xquery source, ici il sera remplacé par $select_source.:)
    (if (ends-with($node, 'data'))  
    then
        collection($node) (:Si c'est l'ensemble de la bd qui est interrogée, mettre collection:)
    else
        (doc($node))(:Sinon, mettre doc:)
    )
};


<html>
    <head>
        <meta
            HTTP-EQUIV="Content-Type"
            content="text/html; charset=UTF-8"/>
        <title>{$page-title}</title>
    </head>
    <body>
        <h1>{$page-title}</h1>
        <p>Chaîne de caractères recherchée: "{$searchphrase}"</p>
        {(:À faire: créer un vrai moteur de recherche lexical = > en trois étapes. 
        1) créer une variable qui sort tout le texte qui nous intéresse en gardant les informations de chapitres, etc. Permet de se débarrasser des balises inutiles. Voir recherche_page_principale
        2) aller cherche dans cette variable à l'aide de la fonction contain() les chaines de caractère qui nous intéressent
        3) les afficher en mettant du contexte (30 caractères avant / 30 après?), et faire attention aux doublons.
        4) le top du top serait de pouvoir mettre en valeur la chaîne de caractères recherchée:)
            x101log:add-log-message(concat('Une requête a été effectuée. Recherche de la chaîne de caractères "', $searchphrase, '"')),
            let $extrait := local:collection-or-doc($select_source)//tei:seg//text()[not(ancestor::tei:rdg) and not(ancestor::tei:note) and contains(., concat(" ", $searchphrase, " "))] (:règle conditionnelle: si la chaîne est trouvée / si elle ne l'est pas.:)
            return
                if (exists($extrait))
                then
                    (<ul>
                        { (:reste à gérer les doublons + chercher en dehors des segments:)
                            for $extrait in $extrait (:Recherche d'une chaine de caractères. :)
                            let $localisation_extrait := concat($extrait/ancestor::tei:div1/data(@n), ", ", $extrait/ancestor::tei:div2/data(@n), ", ", $extrait/ancestor::tei:div3/data(@n))
                            let $carac_gras := <b>{$extrait//string($searchphrase)}</b> (:comment mettre en gras la chaîne recherchée::)
                            return
                                <li>
                                    De: <b>{string(root($extrait)//tei:title//tei:title)}</b>, {$localisation_extrait}<br/>
                                    <i>{$extrait/ancestor::tei:seg//text()[not(ancestor::tei:rdg) and not(ancestor::tei:note)]}</i>
                                </li>
                        
                        }
                    </ul>)
                else
                    ("La requête ne donne aucun résultat.")
        }
    </body>
</html>