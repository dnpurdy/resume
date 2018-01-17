<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="#all">

    <xsl:template name="skills">
        <xsl:param name="skillsInfo"/>

        <section>

            <div class="row">
                <div xsl:use-attribute-sets="sectionHeader">
                    <h2>Skills</h2>
                </div>
            </div>

            <div class="row">
                <xsl:for-each select="$skillsInfo/skillSet">
                    <div class="clearfix">
                        <div class="col-md-2 col-md-offset-1 clearfix"><b><xsl:value-of select="@type"/>:</b></div>
                        <div class="col-md-9">
                            <xsl:value-of select="skill" separator=", "/>
                        </div>
                    </div>
                </xsl:for-each>
            </div>

        </section>

    </xsl:template>
</xsl:stylesheet>