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
                <link rel="stylesheet" href="../css/screen.css" />
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
        <li><a href="#{concat('mc', @n)}"><xsl:apply-templates /></a></li>
    </xsl:template>
    
    <xsl:template match="tei:div">
        <div class="{@type}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:head[1]">
        <h1 id="{concat('mc', @n)}" class="{@rend}"><xsl:apply-templates /></h1>
    </xsl:template>
    
    <xsl:template match="tei:head[2]">
        <h2 class="{@rend}"><xsl:apply-templates /></h2>
    </xsl:template>
    
    <xsl:template match="tei:lg">
        <div class="linegroup">
            <xsl:apply-templates />
        </div>
    </xsl:template>
    
    <xsl:template match="tei:l">
        <p id="{@n}" class="{@rend}"><xsl:apply-templates /></p>
    </xsl:template>
    
    <xsl:template match="lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <span class="{@rend}"><xsl:apply-templates /></span>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <!-- TODO: handle full apparatus; currently only shows 'winner' -->
        <xsl:apply-templates select="tei:lem"/>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p class="{@rend}"><xsl:apply-templates /></p>
    </xsl:template>
    
    <xsl:template match="tei:quote">
        <blockquote><xsl:apply-templates /></blockquote>
    </xsl:template>
    
    <xsl:template match="tei:epigraph">
        <div class="epigraph"><xsl:apply-templates /></div>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <div class="bibl"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:speaker">
        <div class="speaker"><xsl:apply-templates /></div>
    </xsl:template>
    
    <xsl:template match="tei:dateline">
        <div class="dateline"><xsl:apply-templates /></div>
    </xsl:template>
    
</xsl:stylesheet>