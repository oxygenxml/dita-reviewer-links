<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:editlink="http://oxygenxml.com/xslt/editlink/" exclude-result-prefixes="xs" version="2.0">

    <xsl:import href="link.xsl"/>

    <xsl:param name="editlink.remote.ditamap.url"/>
    <xsl:param name="editlink.web.author.url"/>
    <xsl:param name="editlink.local.ditamap.path"/>
    <xsl:param name="editlink.present.only.path.to.topic"/>
    <xsl:param name="editlink.local.ditaval.path"/>

    <xsl:template match="*[contains(@class, ' topic/topic ')]/*[contains(@class, ' topic/title ')]">
        <xsl:choose>
            <xsl:when test="@xtrf and string-length($editlink.remote.ditamap.url) > 0">
                <xsl:variable name="original">
                    <xsl:next-match/>
                </xsl:variable>
                <xsl:apply-templates select="$original" mode="add-editlink-attr">
                    <xsl:with-param name="xtrf" select="@xtrf"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:next-match/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Add the edit link target attribute to be later styled using CSS. -->
    <xsl:template match="/*" mode="add-editlink-attr">
        <xsl:param name="xtrf"/>
        <xsl:variable name="editlink" select="
                editlink:compute(
                $editlink.remote.ditamap.url,
                $editlink.local.ditamap.path,
                $xtrf,
                $editlink.web.author.url,
                $editlink.local.ditaval.path)"/>
        
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="add-editlink-attr"/>
            <xsl:attribute name="data-editlink" select="$editlink"/>
            <xsl:apply-templates select="node()" mode="add-editlink-attr"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="node() | @*" mode="add-editlink-attr">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="add-editlink-attr"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
