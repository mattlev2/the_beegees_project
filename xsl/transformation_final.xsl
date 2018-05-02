<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="tei xs " version="2.0">
    <!--<xsl:strip-space elements="*"/>-->
    <xsl:template match="/">
        <html class="no-js" lang="en-GB">
            <head>
                <title>DEMM Hack Prototype - BG's rock !</title>
                <meta charset="utf-8"/>
                <meta http-equiv="x-ua-compatible" content="ie=edge"/>
                <script src="libs/jquery/jquery-3.3.1.min.js"/>
                <meta name="description" content="This is a prototype digital manuscript edition made during the DEMM Hack week at Cambridge University Library."/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" href="libs/bootstrap-4.0.0-dist/css/bootstrap.min.css"/>
                <link rel="stylesheet" href="css/style.css"/>
            </head>
            <body>
                <div id="welcome-splash" class="modal fade" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content pt-5 px-2">
                            <h5>The Beegees' Project</h5>
                            <p>The manuscript Cambridge University Library Kk.3.21 contains
                                Boethius' De consolatione philosophiae. It is an 11th century book
                                probably created in the abbey of Abingdon, England. The manuscript
                                contains extensive contemporary glosses (interlinear and marginal
                                almost in Latin, few of them in Old English) and also some
                                subsequent additions (12th century and later). </p>
                            <p>The majority of glosses are written by a single hand, except for rare
                                later addictions; They are divided in three types:</p>
                            <ol>
                                <li> interlinear glosses, used to to clarify the classical
                                    Latin;</li>
                                <li> marginal glosses, used to explain the main text, i.e. meaning
                                    of single words, sentences and events mentioned in; they are
                                    anchored to the main text by a set of marks (mostly Greek
                                    alphabet).</li>
                                <li> additional glosses written in red capital letters, wich refers
                                    to the rethorical aspects.</li>
                            </ol>
                            <h5>The BGS'Project aims:</h5>
                            <ol>
                                <li>to give a direct access to the text based on interpretative
                                    transcription (i. e. restitution of capital letters, distinction
                                    between <i>u</i> / <i>v</i>, modern words' segmentation) in a
                                    easy way, also for the readers not used to the Latin
                                    paleography</li>
                                <li>to offer the possibility to compare the original layout and the
                                    modern transcription;</li>
                                <li>to give the text transcription of all type of glosses and to
                                    show easily and directly their purpose;</li>
                                <li>to explain the correct order of the marginal glosses;</li>
                                <li>to offer lexical concordances of the entire text and a direct
                                    link to a dictionary i. e. Logeion.</li>
                            </ol>
                            <h5>HOW TO NAVIGATE:</h5>
                            <ol>
                                <li>on the left side of the page you will find the zoomable image of
                                    manuscript; on the centre the interpretative transcription of
                                    the main text;</li>
                                <li>if you want to read the interlinear glosses: move your mouse on
                                    the underlined words, they will appear as a pop-up above the
                                    text;</li>
                                <li>if you want to read the marginal and additional glosses move
                                    your mouse on the the highlighted words, they are in the right
                                    side of the page;</li>
                                <li>if you want to search a single word in the text: write it in the
                                    "search box"; you can select the criteria of research "main
                                    text", "interlinear glosses", "marginal glosses" (in wich are
                                    included the additional ones) or combining them. The
                                    concordances will appear in a second page surrounded by context,
                                    references to the passages and direct link to the text that they
                                    belong.</li>
                            </ol>


                            <div class="modal-footer">
                                <div class="col-auto">
                                    <button type="button" class="btn btn-primary form-control" data-dismiss="modal">Dismiss this message</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <button data-toggle="modal" data-target="#welcome-splash" class="btn btn-small btn-info">Show introduction</button>
                    <div>
                        <form class="form form-inline" method="post" action="search_results.xq">
                            <input type="text" class="form-control form-control-input" name="searchphrase" placeholder="Enter your search term..." size="40"/>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="search-main-text" name="main_text" value="1" checked="checked"/>
                                <label class="form-check-label" for="search-main-text">Main
                                    Text</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="search-marginalia" name="marginalia" value="2" checked="checked"/>
                                <label class="form-check-label" for="search-marginalia">Marginalia</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="search-interlinear" name="interlinear" value="3" checked="checked"/>
                                <label class="form-check-label" for="search-interlinear">Interlinear
                                    Glosses</label>
                            </div>
                            <button type="submit" class="btn btn-success">Search</button>
                        </form>
                    </div>
                </nav>
                <div class="container-fluid" id="site-wrapper">
                    <div class="row py-2">
                        <div class="col-4 bg-light" id="ms-image-container">
                            <!--<div class="btn-group" id="image-controls" role="group"
                                aria-label="Basic example">
                                <button type="button" class="btn btn-secondary"
                                    data-action="zoom-image" data-direction="in">+</button>
                                <button type="button" class="btn btn-secondary"
                                    data-action="zoom-image" data-direction="out">-</button>
                            </div>
                            <img class="ms-image" data-scale="1" src="Photos/kk.3.21-7r.jpg"
                                alt="image of the manuscript">kk.3.21-7r</img>
                            <figure>
                                <img class="ms-image" data-scale="1" src="Photos/kk.3.21-6r.jpg"
                                    alt="image of the manuscript"/>
                                <figcaption>Ms kk.3.21-6v</figcaption>
                            </figure>-->
                            <div class="tiles">
                                <div class="tile" data-scale="1.6" data-image="Photos/kk.3.21-7r.jpg"/>
                            </div>
                        </div>
                        <div class="col-5">
                            <div class="row">
                                <h1 class="col-0">Transcription</h1>
                            </div>
                            <xsl:element name="div">
                                <xsl:attribute name="id">transcription</xsl:attribute>
                                <xsl:apply-templates/>
                            </xsl:element>
                        </div>
                        <xsl:element name="aside">
                            <xsl:attribute name="class">col-3</xsl:attribute>
                            <xsl:attribute name="id">marginalia</xsl:attribute>
                            <h2>Marginalia</h2>
                            <div class="pre-scrollable">
                                <xsl:for-each select="//tei:gloss[@type = 'marginal_gloss']">
                                    <xsl:element name="div">
                                        <xsl:attribute name="class">marginalia</xsl:attribute>
                                        <xsl:attribute name="data-marginalia-id">
                                            <xsl:value-of select="translate(@target, '#margin', '')"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="."/>
                                    </xsl:element>
                                </xsl:for-each>
                            </div>
                        </xsl:element>
                    </div>
                </div>
                <script src="libs/handlebars/handlebars-v4.0.11.js"/>
                <script src="libs/jquery/jquery-3.3.1.min.js"/>
                <script src="libs/popper/popper.min.js"/>
                <script src="libs/bootstrap-4.0.0-dist/js/bootstrap.min.js"/>
                <script src="js/application.js" charset="utf-8"/>
            </body>
        </html>
    </xsl:template>


    <!--
    <xsl:template match="tei:p">
        <xsl:apply-templates/>
    </xsl:template>-->


    <xsl:template match="tei:seg[@type = 'gloss']">
        <xsl:if test="@subtype = 'interlinear_gloss'">
            <xsl:if test="child::tei:seg[@subtype = 'marginal_gloss']">
                <xsl:element name="a">
                    <xsl:attribute name="class">glossed</xsl:attribute>
                    <xsl:attribute name="data-glossed-by">interlinear</xsl:attribute>
                    <xsl:attribute name="data-trigger">focus</xsl:attribute>
                    <xsl:attribute name="data-toggle">popover</xsl:attribute>
                    <xsl:attribute name="data-placement">top</xsl:attribute>
                    <xsl:attribute name="data-content">
                        <xsl:variable name="id" select="@xml:id"/>
                        <xsl:value-of select="ancestor::tei:TEI//tei:additions/tei:gloss[translate(@target, '#', '') = $id]"/>
                    </xsl:attribute>
                    <xsl:element name="span">
                        <xsl:attribute name="class">glossed</xsl:attribute>
                        <xsl:attribute name="data-glossed-by">marginalia</xsl:attribute>
                        <xsl:attribute name="data-marginalia-id">
                            <xsl:value-of select="count(preceding::tei:seg[@subtype = 'marginal_gloss']) + 1"/>
                        </xsl:attribute>
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:element>
            </xsl:if>
            <xsl:if test="not(child::tei:seg[@subtype = 'marginal_gloss'])">
                <xsl:element name="a">
                    <xsl:attribute name="class">glossed</xsl:attribute>
                    <xsl:attribute name="data-glossed-by">interlinear</xsl:attribute>
                    <xsl:attribute name="data-trigger">focus</xsl:attribute>
                    <xsl:attribute name="data-toggle">popover</xsl:attribute>
                    <xsl:attribute name="data-placement">top</xsl:attribute>
                    <xsl:attribute name="data-content">
                        <xsl:variable name="id" select="@xml:id"/>
                        <xsl:value-of select="ancestor::tei:TEI//tei:additions/tei:gloss[translate(@target, '#', '') = $id]"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:if>
        </xsl:if>
        <xsl:if test="@subtype = 'marginal_gloss'">
            <xsl:element name="a">
                <xsl:attribute name="class">glossed</xsl:attribute>
                <xsl:attribute name="data-glossed-by">marginalia</xsl:attribute>
                <xsl:attribute name="data-marginalia-id">
                    <xsl:value-of select="translate(@xml:id, 'margin', '')"/>
                </xsl:attribute>
                <xsl:if test="child::seg[@subtype = 'interlinear_gloss']">
                    <xsl:element name="span">
                        <xsl:attribute name="class">glossed</xsl:attribute>
                        <xsl:attribute name="data-glossed-by">interlinear</xsl:attribute>
                        <xsl:attribute name="data-trigger">focus</xsl:attribute>
                        <xsl:attribute name="data-toggle">popover</xsl:attribute>
                        <xsl:attribute name="data-placement">top</xsl:attribute>
                        <xsl:attribute name="data-content">
                            <xsl:variable name="id2" select="@xml:id"/>
                            <xsl:value-of select="ancestor::tei:TEI//tei:additions/tei:gloss[translate(@target, '#', '') = $id2]"/>
                        </xsl:attribute>
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="not(child::seg[@subtype = 'interlinear_gloss'])">
                    <xsl:value-of select="."/>
                </xsl:if>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>






    <!--

    <xsl:template match="//glossed[@where = 'interlinear']">
        <xsl:element name="a">
            <xsl:attribute name="class">glossed</xsl:attribute>
            <xsl:attribute name="data-glossed-by">interlinear</xsl:attribute>
            <xsl:attribute name="data-trigger">focus</xsl:attribute>
            <xsl:attribute name="data-toggle">popover</xsl:attribute>
            <xsl:attribute name="data-placement">top</xsl:attribute>
            <xsl:attribute name="data-content">
                <xsl:value-of select="@content"/>
            </xsl:attribute>
            <xsl:if test="child::glossed[@where = 'marginal']">
                <xsl:element name="span">
                    <xsl:attribute name="class">glossed</xsl:attribute>
                    <xsl:attribute name="data-glossed-by">marginalia</xsl:attribute>
                    <xsl:attribute name="data-marginalia-id">
                        <xsl:value-of select="count(preceding::glossed[@where = 'marginal']) + 1"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="not(child::glossed[@where = 'marginal'])">
                <xsl:value-of select="."/>
            </xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="//glossed[@where = 'marginal']">
        <xsl:element name="a">
            <xsl:attribute name="class">glossed</xsl:attribute>
            <xsl:attribute name="data-glossed-by">marginalia</xsl:attribute>
            <xsl:attribute name="data-marginalia-id">
                <xsl:value-of select="count(preceding::glossed[@where = 'marginal']) + 1"/>
            </xsl:attribute>
            <xsl:if test="child::glossed[@where = 'interlinear']">
                <xsl:element name="span">
                    <xsl:attribute name="class">glossed</xsl:attribute>
                    <xsl:attribute name="data-glossed-by">interlinear</xsl:attribute>
                    <xsl:attribute name="data-trigger">focus</xsl:attribute>
                    <xsl:attribute name="data-toggle">popover</xsl:attribute>
                    <xsl:attribute name="data-placement">top</xsl:attribute>
                    <xsl:attribute name="data-content">
                        <xsl:value-of select="child::glossed[@where = 'interlinear']/@content"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="not(child::glossed[@where = 'interlinear'])">
                <xsl:value-of select="."/>
            </xsl:if>
        </xsl:element>
    </xsl:template>

    <!-\-<xsl:template match="//lb">
        <br/>
    </xsl:template>-\->

    <xsl:template match="//call">
        <b> [<xsl:value-of select="."/>] </b>
        <xsl:if test="parent::glossed">
            <b> [<xsl:value-of select="text()"/>] </b>
        </xsl:if>
    </xsl:template>-->

</xsl:stylesheet>