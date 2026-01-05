<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <head>
    <style>
      body { font-family: 'Segoe UI', sans-serif; margin: 30px; background-color: #f8f9fa; }
      .container { max-width: 1000px; margin: auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
      h2 { color: #2c3e50; border-bottom: 3px solid #3498db; padding-bottom: 10px; }
      table { border-collapse: collapse; width: 100%; margin-top: 20px; }
      th, td { border: 1px solid #dee2e6; padding: 12px; text-align: left; }
      th { background-color: #3498db; color: white; }
      
      /* List Styling */
      .list-ordered { list-style-type: decimal; }
      .list-unordered { list-style-type: disc; }
      .tag-name { font-weight: bold; color: #2980b9; background-color: #ebf5fb; width: 30%; }
    </style>
  </head>
  <body>
    <div class="container">
      <h2>Journal Content View</h2>
      <table>
  <tr>
    <th>Field Name</th>
    <th>Content</th>
  </tr>
  <xsl:for-each select="//*[not(*)]">
    <tr>
      <td class="tag-name"><xsl:value-of select="local-name()"/></td>
      <td>
        <xsl:choose>
          <xsl:when test="local-name() = 'numberingStyle'">
            <xsl:choose>
              <xsl:when test=". = '1'">Numbered</xsl:when>
              <xsl:when test=". = '0'">Unnumbered</xsl:when>
              <xsl:when test=". = '2'">Numbered</xsl:when>
              <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          
          <xsl:otherwise>
            <xsl:value-of select="."/>
          </xsl:otherwise>
        </xsl:choose>
      </td>
    </tr>
  </xsl:for-each>
</table>
    </div>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>