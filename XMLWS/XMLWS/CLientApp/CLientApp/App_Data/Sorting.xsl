<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" omit-xml-declaration="no" version="1.0" />
  <xsl:template match='/'>
    <AdminPost>
      <xsl:apply-templates select="//Post">
        <xsl:sort select="Date" order="ascending"/>
      </xsl:apply-templates>
    </AdminPost>
  </xsl:template>

  <xsl:template match="Post">
    <xsl:copy-of select="." />
  </xsl:template>

</xsl:stylesheet>