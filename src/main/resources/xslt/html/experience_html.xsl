<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="#all">

    <xsl:template name="experience">
        <xsl:param name="experienceInfo"/>

        <xsl:for-each select="$experienceInfo">
            <section>
                <div class="row">
                    <div xsl:use-attribute-sets="sectionHeader">
                        <h2>Experience</h2>
                    </div>
                </div>
                <xsl:for-each select="jobs/job">
                    <div class="row">
                        <div xsl:use-attribute-sets="wideDetails">
                            <h4><a><xsl:attribute name="href" select="company/@web"/> <xsl:value-of select="company/@name"/></a></h4>
                        </div>
                    </div>
                    <xsl:for-each select="positions/position">
                        <xsl:sort select="dates/start" order="descending"/>
                        <div class="row">
                            <div class="col-md-6">
                                <strong><xsl:value-of select="title"/></strong>
                            </div>
                            <div class="col-md-6 text-right">
                                <strong>
                                    <xsl:value-of select="format-date(dates/start, '[MNn,3-3] [Y0001]')"/> -
                                    <xsl:choose>
                                        <xsl:when test="normalize-space(dates/end) = 'Present' "><xsl:text>Present</xsl:text></xsl:when>
                                        <xsl:when test="normalize-space(dates/end) = '' "><xsl:text>Present</xsl:text></xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="format-date(dates/end, '[MNn,3-3] [Y0001]')"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </strong>
                            </div>
                            <div xsl:use-attribute-sets="wideDetails">
                                <ul>
                                    <xsl:for-each select="accomplishments/item">
                                        <li><xsl:value-of select="."/></li>
                                    </xsl:for-each>
                                </ul>
                            </div>
                        </div>
                    </xsl:for-each>
                </xsl:for-each>
            </section>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
