<!--
    Pass the following system properties to the transformation (not as parameters)
        - editlink.remote.ditamap.url
        - editlink.web.author.url
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:editlink="http://oxygenxml.com/xslt/editlink/" 
    xmlns:fo="http://www.w3.org/1999/XSL/Format" 
    exclude-result-prefixes="xs" version="2.0">
    <xsl:import href="link.xsl"/>

    <xsl:param name="editlink.remote.ditamap.url"/>
    <xsl:param name="editlink.web.author.url"/>
    <xsl:param name="editlink.local.ditamap.path"/>
    <xsl:param name="editlink.local.ditaval.path"/>

    <xsl:template match="*[contains(@class, ' topic/topic ')]/*[contains(@class, ' topic/title ')]">
        
        <xsl:variable name="content">
            <xsl:next-match/>
        </xsl:variable>
        
        <fo:inline>
            <xsl:value-of select="$content"/>
            <fo:basic-link text-align="right" white-space="nowrap" text-decoration="underline" color="navy" font-size="8pt" font-weight="normal" width="80pt" font-style="normal">
                <xsl:attribute name="external-destination">
                    <xsl:value-of 
                        select="editlink:compute(
                            $editlink.remote.ditamap.url, 
                            $editlink.local.ditamap.path, 
                            @xtrf, 
                            $editlink.web.author.url, 
                            '')"/>
                </xsl:attribute>
                Edit online
            </fo:basic-link>
        </fo:inline>
    </xsl:template>
</xsl:stylesheet>