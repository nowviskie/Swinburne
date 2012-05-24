<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei"
    version="2.0">
    
    <xsl:output method="html" encoding="UTF-8" indent="no"/>
    
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html></xsl:text>
        <!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
        <!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
        <!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
        <!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
            <head>
                <meta charset="utf-8"/>
                <title><!-- TODO --></title>
                <meta name="description" content="TODO"/>
                <meta name="author" content="TODO"/>
                
                <meta name="viewport" content="width=device-width" />
                
                <link href="css/screen.css" media="screen, projection" rel="stylesheet" type="text/css" />
                <link href="css/print.css" media="print" rel="stylesheet" type="text/css" />
                <!--[if IE]>
                    <link href="css/ie.css" media="screen, projection" rel="stylesheet" type="text/css" />
                <![endif]-->
                <script src="javascripts/libs/modernizr-2.5.3.min.js" />
            </head>
            <body>
                
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
                <script src="javascripts/swinburne-1.0.min.js"></script>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>