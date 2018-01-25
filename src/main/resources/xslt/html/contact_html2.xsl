<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="#all">

    <xsl:template name="contact">
        <xsl:param name="contactInfo"/>

        <div class="jumbotron">

            <div class="row">
                <div xsl:use-attribute-sets="leftColumn">
                    <img class="img-fluid float-left hidden-xs-small d-print-none" alt="my resume photo">
                        <xsl:attribute name="src" select="concat($contactInfo/github,'.png?size=150')"/>
                    </img>

                </div>
                <div xsl:use-attribute-sets="centerColumn">
                    <h1 class="display-4"><xsl:value-of select="$contactInfo/name/full"/></h1>
                </div>
                <div xsl:use-attribute-sets="rightColumn">
                    <address>
                        <abbr title="Email"><i class="fa fa-envelope-o" aria-hidden="true">&#160;</i></abbr>:
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
                        </a>
                        <a>
                            <xsl:attribute name="href" select="string('resume.txt')"/>
                            <xsl:attribute name="class" select="string('btn btn-default btn-sm')"/>
                            TXT
                            <i class="fa fa-file-text-o" aria-hidden="true">&#160;</i>
                        </a><br/>
                    </address>
                </div>

            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
