<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:html="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei"
    version="2.0">
    
    <xsl:output method="html" indent="yes" name="html" />
    
    <xsl:template match="/tei:TEI">
        <html>
            <head>
                <meta charset="utf-8" />
                <title><xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" /></title>
                <meta name="description" content="" />
                <meta name="viewport" content="width=device-width" />
            </head>
            <body>
                <div id="container">
                    <div class="toc">
                        <ol><xsl:apply-templates select="tei:text/tei:body/tei:div[@type = 'opening']" mode="toc"/></ol>
                    </div>
                    
                    <div class="content">
                         <xsl:apply-templates select="tei:text/tei:body/tei:div" />    
                    </div>
                </div>
            </body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'opening']" mode="toc">
        <xsl:apply-templates select="child::node()/tei:head[1]" mode="toc"/>
    </xsl:template>
    
    <xsl:template match="tei:head" mode="toc">
        <li><xsl:apply-templates />(<xsl:value-of select="generate-id()"/>)</li>
    </xsl:template>
    
    <xsl:template match="tei:div">
        <div class="{@type}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:lg">
        <div class="linegroup">
            <xsl:apply-templates />
        </div>
    </xsl:template>
    
</xsl:stylesheet>