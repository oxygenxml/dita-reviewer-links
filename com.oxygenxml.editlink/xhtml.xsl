<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:editlink="http://oxygenxml.com/xslt/editlink/"
    exclude-result-prefixes="xs editlink"
    version="2.0">
  
  <xsl:import href="link.xsl"/>
  
  <xsl:param name="editlink.remote.ditamap.url"/>
  <xsl:param name="editlink.web.author.url"/>
  <xsl:param name="editlink.local.ditamap.path"/>
  
<!-- NESTED TOPIC TITLES (sensitive to nesting depth, but are still processed for contained markup) -->
<!-- 1st level - topic/title -->
<!-- Condensed topic title into single template without priorities; use $headinglevel to set heading.
     If desired, somebody could pass in the value to manually set the heading level -->
<xsl:template match="*[contains(@class, ' topic/topic ')]/*[contains(@class, ' topic/title ')]" 
  use-when="system-property('editlink.remote.ditamap.url') != '${editlink.remote.ditamap.url}'">
  
  <xsl:param name="headinglevel" as="xs:integer">
      <xsl:choose>
          <xsl:when test="count(ancestor::*[contains(@class, ' topic/topic ')]) > 6">6</xsl:when>
          <xsl:otherwise><xsl:sequence select="count(ancestor::*[contains(@class, ' topic/topic ')])"/></xsl:otherwise>
      </xsl:choose>
  </xsl:param>
  <xsl:element name="h{$headinglevel}">
    <xsl:attribute name="style">display:table; width:100%;</xsl:attribute>
    <xsl:attribute name="class">topictitle<xsl:value-of select="$headinglevel"/></xsl:attribute>
    <xsl:call-template name="commonattributes">
      <xsl:with-param name="default-output-class">topictitle<xsl:value-of select="$headinglevel"/></xsl:with-param>
    </xsl:call-template>
    <xsl:attribute name="id"><xsl:apply-templates select="." mode="return-aria-label-id"/></xsl:attribute>
    
    <div class="edit-link-container" style="display: table-cell; margin-top: 0;">
      <xsl:apply-templates/>
    </div>

    <!-- The edit link -->
    <span class="edit-link" style="font-size: 12px; opacity: 0.6; display: table-cell; text-align: right; vertical-align: middle"> 
      <a target="_blank">
        <xsl:attribute name="href">
          <xsl:value-of select="editlink:compute($editlink.remote.ditamap.url, $editlink.local.ditamap.path, @xtrf, $editlink.web.author.url)"/>
        </xsl:attribute>Edit online</a>
    </span>
    <!-- Done with the edit link -->
  </xsl:element>      
  
  <xsl:value-of select="$newline"/>
</xsl:template>

</xsl:stylesheet>
