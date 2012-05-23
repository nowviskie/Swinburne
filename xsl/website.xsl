<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei"
    version="2.0">
    
    <xsl:output method="html" encoding="UTF-8" indent="no"/>
    
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html></xsl:text>
        <html>
            <head>
                <link href='http://fonts.googleapis.com/css?family=Prata' rel='stylesheet' type='text/css'/>
                <link rel="stylesheet" href="css/style.css"/>
            </head>
            <body></body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>