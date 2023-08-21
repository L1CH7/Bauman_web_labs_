<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
      <html>
        <head>

        </head>
          <body>
              <h1>Ответ сервера:</h1>
              <table>
                    <tr>
                        <th>НОД</th>
                        <th>НОК</th>
                    </tr>
                    <tr>
                        <th><xsl:value-of select="hash/array/nod"/></th>
                        <th><xsl:value-of select="hash/array/nok"/></th>
                    </tr>
              </table>
          </body>
      </html>
  </xsl:template>
</xsl:stylesheet>