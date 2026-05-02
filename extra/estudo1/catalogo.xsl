<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
    <h1>Catálogo de Produtos</h1>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>Nome do Produto</th>
        <th>Categoria</th>
        <th>Preço</th>
        <th>Stock</th>
      </tr>
      <xsl:for-each select="catalogo/produto">
      <tr>
        <xsl:if test="stock &lt; 5">
            <xsl:attribute name="style">background-color:red;</xsl:attribute>
        </xsl:if>
        <td><xsl:value-of select="nome" /></td>
        <td><xsl:value-of select="@categoria" /></td>
        <td><xsl:value-of select="preco" /></td>
        <td><xsl:value-of select="stock" /></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
