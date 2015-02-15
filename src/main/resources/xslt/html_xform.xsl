<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
                exclude-result-prefixes="#all">
    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <title>Resume Template</title>

                <!-- CSS -->
                <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
                <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen"/>
                <link href="css/style.css" rel="stylesheet"/>

            </head>
            <body>
                <div class="container">
                    <xsl:apply-templates/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="contact">
        <!--
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::: Hero information, where it displays profile picture and personal information
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-->
        <div class="hero">

            <div class="jumbotron me-details">
                <div class="row">
                    <div class="col-md-2">
                        <div class="avatar">
                            <img width="130" height="151" src="images/photo.jpg" alt="my resume photo"/>
                        </div>
                    </div><!-- col-md-2 -->
                    <div class="col-md-6">
                        <h1><xsl:value-of select="name/full"/></h1>
                    </div><!-- col-md-6 -->
                    <div class="col-md-4">
                        <address>
                            <xsl:value-of select="address/street"/><br/>
                            <xsl:value-of select="address/city"/>,<xsl:value-of select="address/state"/> <xsl:value-of select="address/zip"/><br/>
                            <abbr title="Phone">P:</abbr> <xsl:value-of select="phone"/> <br/>
                            <abbr title="Email">E:</abbr>
                            <a>
                                <xsl:attribute name="href" select="concat('mailto:',email)"/>
                                <xsl:value-of select="email"/>
                            </a><br/>
                            <abbr title="Website">W:</abbr>
                            <a>
                                <xsl:attribute name="href" select="website"/>
                                <xsl:value-of select="website"/>
                            </a><br/>
                        </address>
                    </div><!-- col-md-4 -->
                </div><!-- row-fluid -->
            </div> <!-- hero-unit -->
        </div><!-- hero -->
    </xsl:template>

    <xsl:template match="skills">
        <section>
            <div class="row">
                <div class="col-md-8 col-md-offset-4">
                    <!--<a name="highlights" class="division"/>-->
                    <h2>Skills</h2>
                </div><!-- col-md-8 -->
            </div>
            <div class="row">
            <xsl:apply-templates/>
            </div>
        </section>
    </xsl:template>

    <xsl:template match="skillSet">

            <div class="col-md-4"><xsl:value-of select="@type"/>:</div>
            <div class="col-md-8">
                <xsl:for-each select="skill"><xsl:value-of select="."/>,</xsl:for-each>
            </div>

    </xsl:template>

    <xsl:template match="experience">

        <xsl:apply-templates/>

    </xsl:template>

    <xsl:template match="highlights">
        <!--
        :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        ::::: Highlights
        :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        -->
        <section>
            <div class="row">
                <div class="col-md-8 col-md-offset-4">
                    <!--<a name="highlights" class="division"/>-->
                    <h2>Highlights</h2>
                </div><!-- col-md-8 -->
                <div class="col-md-8 col-md-offset-2">
                    <xsl:value-of select="."/>
                </div><!-- col-md-8 -->
            </div><!-- row -->
        </section>

        <hr/>
    </xsl:template>

</xsl:stylesheet>