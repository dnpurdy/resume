<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="#all">

    <xsl:template name="education">
        <xsl:param name="educationInfo"/>

        <xsl:for-each select="$educationInfo">
            <div class="row">
                <div xsl:use-attribute-sets="sectionHeader">
                    <h2>Education</h2>
                </div>
            </div>
            <xsl:for-each select="degree">
                <section>
                    <div class="row">
                        <div xsl:use-attribute-sets="wideDetails">
                            <h4><xsl:value-of select="@title"/></h4>
                            <h5><xsl:value-of select="school/@name"/> - <xsl:value-of select="format-date(@grantDate, '[MNn,3-3] [Y0001]')"/></h5>
                            <ul>
                                <li><xsl:value-of select="comments"/></li>
                            </ul>
                        </div>
                    </div>
                </section>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
