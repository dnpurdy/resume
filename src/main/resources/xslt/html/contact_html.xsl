<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="#all">

    <xsl:template name="contact">
        <xsl:param name="contactInfo"/>

        <div class="hero">

            <div class="jumbotron me-details">
                <div class="row">
                    <div class="col-md-2">
                        <div class="avatar">
                            <img width="130" height="130" alt="my resume photo">
                                <xsl:attribute name="src" select="concat($contactInfo/github,'.png?size=130')"/>
                            </img>
                        </div>
                    </div><!-- col-md-2 -->
                    <div class="col-md-6">
                        <h1><xsl:value-of select="$contactInfo/name/full"/></h1>
                    </div><!-- col-md-6 -->
                    <div class="col-md-4">
                        <address>
                            <abbr title="Email"><i class="fa fa-envelope-o" aria-hidden="true">&#160;</i>:</abbr>
                            <a>
                                <xsl:attribute name="href" select="concat('mailto:',$contactInfo/email)"/>
                                <xsl:value-of select="$contactInfo/email"/>
                            </a>
                            <br/>
                            <abbr title="Website"><i class="fa fa-external-link" aria-hidden="true">&#160;</i>:</abbr>
                            <a>
                                <xsl:attribute name="href" select="$contactInfo/website"/>
                                <xsl:value-of select="$contactInfo/website"/>
                            </a>
                            <br/>
                            <abbr title="GitHub"><i class="fa fa-github" aria-hidden="true">&#160;</i>:</abbr>
                            <a>
                                <xsl:attribute name="href" select="$contactInfo/github"/>
                                <xsl:value-of select="$contactInfo/github"/>
                            </a>
                            <br/>
                            <a>
                                <xsl:attribute name="href" select="string('resume.pdf')"/>
                                <xsl:attribute name="class" select="string('btn btn-default btn-sm')"/>
                                PDF
                                <i class="fa fa-file-pdf-o" aria-hidden="true">&#160;</i>
                            </a>
                            <a>
                                <xsl:attribute name="href" select="string('resume.rtf')"/>
                                <xsl:attribute name="class" select="string('btn btn-default btn-sm')"/>
                                RTF
                                <i class="fa fa-file-text-o" aria-hidden="true">&#160;</i>
                            </a><br/>
                        </address>
                    </div><!-- col-md-4 -->
                </div><!-- row-fluid -->
            </div> <!-- hero-unit -->
        </div><!-- hero -->
    </xsl:template>
</xsl:stylesheet>
