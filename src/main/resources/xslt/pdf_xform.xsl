<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:Firm58="http://www.firm58.com"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:java="http://xml.apache.org/xslt/java"
                xmlns:pn="http://www.purdynet.com"
                exclude-result-prefixes="java pn Firm58">

    <!-- FORMATTING -->
    <xsl:variable name="dollarAmountFormatString" select="string('$###,##0.00;($###,##0.00)')" />
    <xsl:variable name="rateFormatString" select="string('###,##0.0000;(###,##0.0000)')" />
    <xsl:variable name="volumeFormatString" select="string('###,##0;(###,##0)')" />
    <xsl:variable name="forceBlank">
        <xsl:text>&#x00a0;</xsl:text>
    </xsl:variable>

    <xsl:variable name="littlePadding" select="'1pt'" />
    <xsl:variable name="borderBasic" select="'.5pt solid black'" />
    <xsl:variable name="mainFont">
        <xsl:text>Times</xsl:text>
    </xsl:variable>
    <xsl:variable name="smallFontSize">
        <xsl:text>10</xsl:text>
    </xsl:variable>

    <xsl:attribute-set name="nameBanner">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize*4)" />pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="sectionHeader">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize*1.5)" />pt</xsl:attribute>
        <xsl:attribute name="margin-bottom"><xsl:value-of select="floor($smallFontSize*1.5)" />pt</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="detailText">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize*1.25)" />pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="largeTitle">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize*1.675)" />pt
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="titlePageCell">
        <xsl:attribute name="padding">
            <xsl:value-of select="$littlePadding" />
        </xsl:attribute>
        <xsl:attribute name="text-align">
            <xsl:text>left</xsl:text>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="titlePageRow">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize*1.5)" />pt
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="titlePageRowLarge">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize*1.75)" />pt
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="titlePageTableHeader">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize*1.675)" />pt
        </xsl:attribute>
        <xsl:attribute name="text-decoration">underline</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="tableHeaderCell">
        <xsl:attribute name="background-color">
            <xsl:text>rgb(0,0,102)</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="padding">
            <xsl:value-of select="$littlePadding" />
        </xsl:attribute>
        <xsl:attribute name="border">
            <xsl:value-of select="$borderBasic" />
        </xsl:attribute>
        <xsl:attribute name="text-align">
            <xsl:text>left</xsl:text>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="tableHeader">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">white</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize*1.5)" />pt
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="tableSubHeaderCell">
        <xsl:attribute name="background-color">
            <xsl:text>rgb(108,108,108)</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="padding">
            <xsl:value-of select="$littlePadding" />
        </xsl:attribute>
        <xsl:attribute name="text-align">
            <xsl:text>right</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="display-align">
            <xsl:text>center</xsl:text>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="tableSubHeader">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">white</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize*1.125)" />pt
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="tableSubSubHeaderCell">
        <xsl:attribute name="background-color">
            <xsl:text>rgb(108,108,108)</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="padding">
            <xsl:value-of select="$littlePadding" />
        </xsl:attribute>
        <xsl:attribute name="text-align">
            <xsl:text>right</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="display-align">
            <xsl:text>center</xsl:text>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="tableSubSubHeader">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">white</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize*1.075)" />pt
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="title">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize*1.25)" />pt
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="rowDetailRow">
        <xsl:attribute name="background-color">
            <xsl:choose>
                <xsl:when test="position() mod 2 = 0">
                    <xsl:text>rgb(203,203,203)</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>white</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="rowDetailCell">
        <xsl:attribute name="padding">
            <xsl:value-of select="$littlePadding" />
        </xsl:attribute>
        <xsl:attribute name="text-align">
            <xsl:text>right</xsl:text>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="rowDetail">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize)" />pt
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="totalRowRow">
        <xsl:attribute name="background-color">
            <xsl:text>rgb(170,170,170)</xsl:text>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="totalRowCell">
        <xsl:attribute name="padding">
            <xsl:value-of select="$littlePadding" />
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="totalRow">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$mainFont" />
        </xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size"><xsl:value-of select="floor($smallFontSize*1.25)" />pt
        </xsl:attribute>
        <xsl:attribute name="text-align">right</xsl:attribute>
    </xsl:attribute-set>

    <xsl:template match="/resume">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="allpages" page-height="11in" page-width="8.5in" margin-top=".5in" margin-bottom=".5in" margin-left=".5in" margin-right=".5in">
                    <fo:region-body margin-bottom=".5in" margin-top="1in" />
                    <fo:region-before precedence="true" region-name="xsl-region-before" extent=".95in" />
                    <fo:region-after region-name="xsl-region-after" extent=".5in" />
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="allpages">
                <xsl:call-template name="header" />
                <xsl:call-template name="footer" />

                <!--  all page layout begins -->
                <fo:flow flow-name="xsl-region-body">

                    <xsl:call-template name="skills">
                        <xsl:with-param name="skills" select="skills"/>
                    </xsl:call-template>

                    <fo:block id="lastPage" />
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template name="header">
        <!--  header section with logo and enddate -->
        <fo:static-content flow-name="xsl-region-before">
            <fo:block>
                <fo:table table-layout="fixed" width="100%">
                    <fo:table-column column-width="proportional-column-width(3)" />
                    <fo:table-column column-width="proportional-column-width(1)" />
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell padding="{$littlePadding}">
                                <fo:block xsl:use-attribute-sets="nameBanner">
                                    <xsl:value-of select="contact/name/full"/>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell padding="{$littlePadding}">
                                <fo:block text-align="right"><xsl:value-of select="contact/address/street"/></fo:block>
                                <fo:block text-align="right"><xsl:value-of select="contact/address/city"/>, <xsl:value-of select="contact/address/state"/> <xsl:value-of select="contact/address/zip"/></fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="footer">
        <!--  footer section with page numbering and bottom border -->
        <fo:static-content flow-name="xsl-region-after">
            <fo:block>
            </fo:block>
        </fo:static-content>
        <!-- end of footer section -->
    </xsl:template>

    <xsl:template name="skills">
        <xsl:param name="skills"/>
        <fo:block>
            <fo:block xsl:use-attribute-sets="sectionHeader"><xsl:text>TECHNICAL SKILLS</xsl:text></fo:block>
            <fo:block>
                <fo:table table-layout="fixed" width="100%">
                    <fo:table-column column-width="proportional-column-width(2)" />
                    <fo:table-column column-width="proportional-column-width(5)" />
                    <fo:table-body>
                        <xsl:for-each select="$skills/skillSet">
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block text-align="left" xsl:use-attribute-sets="detailText"><xsl:value-of select="./@type"/>:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block xsl:use-attribute-sets="detailText">
                                        <xsl:value-of select="pn:makeSkillString(.)"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </xsl:for-each>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:function name="pn:makeSkillString">
        <xsl:param name="skillSet"/>
        <xsl:variable name="output">
        <xsl:for-each select="$skillSet/skill">
            <xsl:value-of select="."/><xsl:text>, </xsl:text>
        </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="substring($output,1,string-length($output)-2)"/>
    </xsl:function>
</xsl:stylesheet>
