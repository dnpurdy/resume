<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="#all">

    <xsl:template name="patents">
        <xsl:param name="patentInfo"/>

        <xsl:for-each select="$patentInfo">
            <section>
                <div class="row">
                    <div xsl:use-attribute-sets="sectionHeader">
                        <h2>Patents</h2>
                    </div>
                </div>
                <xsl:for-each select="patent">
                    <div class="row">
                        <div xsl:use-attribute-sets="wideDetails">
                            <strong>
                                <xsl:choose>
                                    <xsl:when test="link">
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="link"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="number"/>:
                                        </xsl:element>
                                        <xsl:value-of select="title"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="title"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </strong>
                        </div>

                        <xsl:choose>
                            <xsl:when test="not(number)">
                                <div xsl:use-attribute-sets="wideDetails">
                                    <div class="bump">Application Number:
                                        <xsl:value-of select="applicationNumber"/>
                                    </div>
                                </div>
                            </xsl:when>
                        </xsl:choose>

                        <div xsl:use-attribute-sets="wideDetails">
                            <div class="bump">Co-Inventor:
                                <xsl:value-of select="firstNamedInventor"/>
                            </div>
                        </div>

                    </div>
                </xsl:for-each>
            </section>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>