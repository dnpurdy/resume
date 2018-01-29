<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="#all">

    <xsl:template name="skills">
        <xsl:param name="skillsInfo"/>

        <xsl:for-each select="$skillsInfo">
            <section>
                <div class="row">
                    <div xsl:use-attribute-sets="sectionHeader">
                        <h2>Skills</h2>
                    </div>
                </div>
                <div class="row">
                    <xsl:for-each select="skillSet">
                        <div xsl:use-attribute-sets="skillLeft">
                            <strong><xsl:value-of select="@type"/>:</strong>
                        </div>
                        <div xsl:use-attribute-sets="skillRight">
                            <xsl:value-of select="skill" separator=", "/>
                        </div>
                    </xsl:for-each>
                </div>
            </section>
        </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>