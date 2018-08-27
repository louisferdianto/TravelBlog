<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="xml" omit-xml-declaration="no" version="1.0" />
  <xsl:param name="_tagString"/>
  <xsl:template match='/'>
    <table style="margin-left:12px">
      <thead>
        <h3>
          Search results for: <xsl:value-of select="$_tagString" />
        </h3>
      </thead>
      <td>
        <xsl:apply-templates select="//Post" />
      </td>
    </table>
  </xsl:template>
  <xsl:template match="Post">
    <xsl:if test="Hashtag/Tag=$_tagString">
      <tr onmouseover="ChangeColor(this, true);"
          onmouseout="ChangeColor(this, false);">
        <xsl:attribute name="onclick">
          javascript:DoNav('<xsl:value-of select="@id" />')
        </xsl:attribute>
        <td>
          <br />
          <b>
            <u>
              <a href="#"><xsl:value-of select="Title" /></a>
            </u>
          </b>
          <br/>
          Posted on
          <xsl:value-of select="Date" /> 
          <br />
          ______________________________________________________________
          <br />
        </td>
      </tr>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>