<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
  

  <xsl:template match='*'>
    <xsl:copy>
      <xsl:for-each select='@*|*[not(* or @*)]'>
        <xsl:attribute name='{name(.)}'>
          <xsl:value-of select='.'/>
        </xsl:attribute>
      </xsl:for-each>
     
      <xsl:apply-templates select='*[* or @*]|text()'/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>