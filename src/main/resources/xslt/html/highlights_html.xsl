<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="#all">

    <xsl:template name="highlights">
        <xsl:param name="highlightsInfo"/>

        <xsl:for-each select="$highlightsInfo">
            <section>
                <div class="row">
                    <div xsl:use-attribute-sets="sectionHeader">
                        <!--<a name="highlights" class="division"/>-->
                        <h2>Highlights</h2>
                    </div><!-- col-md-8 -->
                    <div class="col-md-11 col-md-offset-1">
                        <xsl:value-of select="."/>
                    </div><!-- col-md-8 -->
                </div><!-- row -->
            </section>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>