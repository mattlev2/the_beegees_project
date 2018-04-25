<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
        <div class="container-fluid" id="site-wrapper">
            <div class="row py-2">
                <div class="col-4 bg-light" id="ms-image-container">
                    <div class="btn-group" id="image-controls" role="group"
                        aria-label="Basic example">
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
                        <button class="btn btn-light" data-action="show" id="toggle-all-interlinear"
                            >Show all Interlinear Glosses</button>
                    </div>
                    <xsl:element name="div">
                        <xsl:attribute name="id">transcription</xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:element>
                    <xsl:element name="aside">
                        <xsl:attribute name="class">col-3</xsl:attribute>
                        <xsl:attribute name="id">marginalia</xsl:attribute>
                        <h2>Marginalia (more information <i>here</i>)</h2>
                        <xsl:for-each select="//glossed[@where = 'marginal']">
                            <xsl:element name="div">
                                <xsl:attribute name="class">marginalia</xsl:attribute>
                                <xsl:attribute name="data-marginalia-id">
                                    <xsl:value-of
                                        select="count(preceding::glossed[@where = 'marginal']) + 1"
                                    />
                                </xsl:attribute>
                                <xsl:value-of select="@content"/>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </div>
            </div>
        </div>
    </xsl:template>

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
                <xsl:element name="a">
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
                <xsl:element name="a">
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

    <xsl:template match="//lb">
        <br/>
    </xsl:template>

</xsl:stylesheet>
