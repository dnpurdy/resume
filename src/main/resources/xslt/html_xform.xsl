<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="#all">
    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <title><xsl:value-of select="resume/contact/name/full"/></title>

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
                            <!--
                            <xsl:value-of select="address/street"/><br/>
                            <xsl:value-of select="address/city"/>,<xsl:value-of select="address/state"/> <xsl:value-of select="address/zip"/><br/>
                            <abbr title="Phone">P:</abbr> <xsl:value-of select="phone"/> <br/>
                            -->
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

    <xsl:template match="education">
        <hr/>
        <div class="row">
            <div class="col-md-8 col-md-offset-4">
                <h2>Education</h2>
            </div><!-- col-md-8 -->
        </div>

        <xsl:apply-templates/>

    </xsl:template>

    <xsl:template match="highlights">
        <!--
        :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        ::::: Highlights
        :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        -->
        <hr/>
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
    </xsl:template>

    <xsl:template match="jobs">
        <hr/>
        <section>
            <div class="row">
                <div class="col-md-8 col-md-offset-4">
                    <h2>Experience</h2>
                </div><!-- col-md-8 -->
            </div>    <xsl:for-each select="job">
                <div class="row">
                    <div class="col-md-4">

                        <h3><xsl:value-of select="company/@name"/></h3>
                        <xsl:for-each select="positions/position">
                            <h4><xsl:value-of select="title"/></h4>
                            <h5><xsl:value-of select="format-date(dates/start, '[MNn,3-3] [Y0001]')"/> -
                                <xsl:choose>
                                    <xsl:when test="normalize-space(dates/end) = 'Present' "><xsl:text>Present</xsl:text></xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="format-date(dates/end, '[MNn,3-3] [Y0001]')"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                </h5>
                        </xsl:for-each>
                    </div><!-- col-md-4 -->
                    <div class="col-md-8">
                        <ul>
                            <xsl:for-each select="accomplishments/item">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                    </div><!-- col-md-8 -->
                </div><!-- row -->
            </xsl:for-each>
        </section>
    </xsl:template>

    <xsl:template match="degree">
        <section>
            <div class="row">
                <div class="col-md-4">
                    <h3><xsl:value-of select="@title"/></h3>
                    <h4><xsl:value-of select="school/@name"/></h4>
                    <h5><xsl:value-of select="format-date(@grantDate, '[MNn,3-3] [Y0001]')"/></h5>
                </div><!-- col-md-4 -->
                <div class="col-md-8">
                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. </p>
                </div><!-- col-md-8 -->
            </div>

        </section>
    </xsl:template>

</xsl:stylesheet>