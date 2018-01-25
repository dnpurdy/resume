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
                            <b><xsl:value-of select="title"/></b>
                        </div>
                        <div xsl:use-attribute-sets="insetDetails">
                            Application Number: <xsl:value-of select="applicationNumber"/>,
                            Co-Inventor: <xsl:value-of select="firstNamedInventor"/>
                        </div>
                    </div>
                </xsl:for-each>
            </section>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>