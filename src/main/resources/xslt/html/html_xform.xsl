<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="#all">
    <xsl:import href="src/main/resources/xslt/html/contact_html.xsl"/>
    <xsl:import href="src/main/resources/xslt/html/highlights_html.xsl"/>
    <xsl:import href="src/main/resources/xslt/html/skills_html.xsl"/>
    <xsl:import href="src/main/resources/xslt/html/experience_html.xsl"/>
    <xsl:import href="src/main/resources/xslt/html/patents_html.xsl"/>
    <xsl:import href="src/main/resources/xslt/html/education_html.xsl"/>

    <xsl:output indent="yes"/>

    <xsl:attribute-set name="sectionHeader">
        <xsl:attribute name="class">col-xs-10 col-xs-offset-2</xsl:attribute>
    </xsl:attribute-set>

    <xsl:template match="/resume">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <title><xsl:value-of select="contact/name/full"/></title>

                <!-- CSS -->
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
                <!--<link rel="stylesheet" href="css/font-awesome-4.6.3/css/font-awesome.min.css"/>-->
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
                <link href="css/style.css" rel="stylesheet"/>

            </head>
            <body>
                <div class="container">
                    <xsl:call-template name="contact">
                        <xsl:with-param name="contactInfo" select="./contact" />
                    </xsl:call-template>

                    <xsl:call-template name="highlights">
                        <xsl:with-param name="highlightsInfo" select="./highlights" />
                    </xsl:call-template>

                    <hr/>

                    <xsl:call-template name="skills">
                        <xsl:with-param name="skillsInfo" select="./skills" />
                    </xsl:call-template>

                    <hr/>

                    <xsl:call-template name="experience">
                        <xsl:with-param name="experienceInfo" select="./experience" />
                    </xsl:call-template>

                    <hr/>

                    <xsl:call-template name="patents">
                        <xsl:with-param name="patentInfo" select="./patents" />
                    </xsl:call-template>

                    <hr/>

                    <xsl:call-template name="education">
                        <xsl:with-param name="educationInfo" select="./education" />
                    </xsl:call-template>


                </div>
            </body>
        </html>
    </xsl:template>

    <!--
        <xsl:template match="experience">

            <xsl:apply-templates/>

        </xsl:template>
    -->

<!--
    <xsl:template match="jobs">
        <hr/>
        <section>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h2>Experience</h2>
                </div>
            </div>
            <xsl:for-each select="job">
                <div class="row">
                    <h3><a><xsl:attribute name="href" select="company/@web"/> <xsl:value-of select="company/@name"/></a></h3>
                    <xsl:for-each select="positions/position">
                        <xsl:sort select="dates/end" order="descending"/>
                        <div class="row">
                            <div class="col-md-2">
                                <h4><xsl:value-of select="title"/></h4>
                                <h5><xsl:value-of select="format-date(dates/start, '[MNn,3-3] [Y0001]')"/> -
                                    <xsl:choose>
                                        <xsl:when test="normalize-space(dates/end) = 'Present' "><xsl:text>Present</xsl:text></xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="format-date(dates/end, '[MNn,3-3] [Y0001]')"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </h5>
                            </div>
                            <div class="col-md-10">
                                <ul>
                                    <xsl:for-each select="accomplishments/item">
                                        <li><xsl:value-of select="."/></li>
                                    </xsl:for-each>
                                </ul>
                            </div>
                        </div>

                    </xsl:for-each>
                </div>
            </xsl:for-each>
        </section>
    </xsl:template>
-->
</xsl:stylesheet>
