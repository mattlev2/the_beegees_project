
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="tei xs " version="2.0">


    <xsl:output method="xml" encoding="utf-8" indent="yes"/>

    <!-- Identity template : copy all text nodes, elements and attributes -->
    <xsl:template match="@* | node()">
        <xsl:copy copy-namespaces="no" exclude-result-prefixes="#all">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
<!--
    <xsl:template match="//tei:lb">
        <xsl:element name="lb"/>
    </xsl:template>
-->
    <xsl:template match="//tei:seg[@type = 'region']/tei:seg">
        <xsl:if test="descendant::tei:seg[@type = 'marginal_gloss']">
            <xsl:element name="seg">
                <xsl:attribute name="type">
                    <xsl:value-of select="@type"/>
                </xsl:attribute>
                <xsl:element name="seg">
                    <xsl:attribute name="type">
                        <xsl:value-of select="tei:seg/@type"/>
                    </xsl:attribute>
                    <xsl:element name="hi">
                        <xsl:value-of select="tei:seg/tei:hi"/>
                    </xsl:element>
                    <xsl:value-of select="tei:seg/text()"/>
                    <xsl:element name="gloss">
                        <xsl:attribute name="type">
                            <xsl:value-of select="@type"/>
                        </xsl:attribute>
                        <xsl:value-of select="@content"/>
                    </xsl:element>
                    <xsl:element name="gloss">
                        <xsl:attribute name="type">
                            <xsl:value-of select="tei:seg/@type"/>
                        </xsl:attribute>
                        <xsl:value-of select="tei:seg/@content"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:if>

        <xsl:if test="descendant::tei:seg[@type = 'interlinear_gloss']">
            <xsl:element name="seg">
                <xsl:attribute name="type">
                    <xsl:value-of select="@type"/>
                </xsl:attribute>
                <xsl:element name="seg">
                    <xsl:attribute name="type">
                        <xsl:value-of select="tei:seg/@type"/>
                    </xsl:attribute>
                    <xsl:element name="gloss">
                        <xsl:attribute name="type">
                            <xsl:value-of select="@type"/>
                        </xsl:attribute>
                        <xsl:value-of select="@content"/>
                    </xsl:element>
                    <xsl:element name="gloss">
                        <xsl:attribute name="type">
                            <xsl:value-of select="tei:seg/@type"/>
                        </xsl:attribute>
                        <xsl:value-of select="@content"/>
                    </xsl:element>
                    <xsl:element name="hi">
                        <xsl:value-of select="tei:seg/tei:hi"/>
                    </xsl:element>
                    <xsl:value-of select="tei:seg/text()"/>
                </xsl:element>
            </xsl:element>
        </xsl:if>

        <xsl:if test="not(child::tei:seg)">
            <xsl:element name="seg">
                <xsl:attribute name="type">
                    <xsl:value-of select="@type"/>
                </xsl:attribute>
                <xsl:element name="gloss">
                    <xsl:attribute name="type">
                        <xsl:value-of select="@type"/>
                    </xsl:attribute>
                    <xsl:value-of select="@content"/>
                </xsl:element>
                <xsl:if test="tei:hi">
                    <hi>
                        <xsl:value-of select="tei:hi"/>
                    </hi>
                </xsl:if>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:if>
    </xsl:template>



</xsl:stylesheet>
