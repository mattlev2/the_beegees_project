<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
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
                        <xsl:value-of select="count(preceding::glossed[@where = 'marginal']) + 1"/>
                    </xsl:attribute>
                    <xsl:value-of select="@content"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <xsl:template match="glossed[@where = 'interlinear']">
        <xsl:element name="a">
            <xsl:attribute name="class">glossed</xsl:attribute>
            <xsl:attribute name="data-glossed-by">interlinear</xsl:attribute>
            <xsl:attribute name="data-trigger">focus</xsl:attribute>
            <xsl:attribute name="data-toggle">popover</xsl:attribute>
            <xsl:attribute name="data-placement">top</xsl:attribute>
            <xsl:attribute name="data-content">
                <xsl:value-of select="@content"/>
            </xsl:attribute>
            <xsl:attribute name="data-marginalia-id">
                <xsl:value-of select="count(preceding::glossed[@where = 'marginal']) + 1"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="glossed[@where = 'marginal']">
        <xsl:element name="a">
            <xsl:attribute name="class">glossed</xsl:attribute>
            <xsl:attribute name="data-glossed-by">marginalia</xsl:attribute>
            <xsl:attribute name="data-marginalia-id">
                <xsl:value-of select="count(preceding::glossed[@where = 'marginal']) + 1"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
