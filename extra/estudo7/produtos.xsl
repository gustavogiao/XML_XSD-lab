<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>A Minha Loja de Produtos</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Nome</th>
      <th>Categoria</th>
      <th>Preço</th>
      <th>Stock</th>
    </tr>
    <xsl:for-each select="loja/produto">
    <xsl:sort select="preco" data-type="number" order="descending"/>
    <tr>
      <xsl:choose>
        <xsl:when test="stock &lt; 5">
          <xsl:attribute name="style">background-color:red;</xsl:attribute>
        </xsl:when>
        <xsl:when test="preco &gt; 100">
          <xsl:attribute name="style">background-color:yellow;</xsl:attribute>
        </xsl:when>
      </xsl:choose>
      <td><xsl:value-of select="nome"/></td>
      <td><xsl:value-of select="@categoria"/></td>
      <td><xsl:value-of select="preco"/></td>
      <td><xsl:value-of select="stock"/></td>
    </tr>
    </xsl:for-each>
  </table>

  <h2>Resumo da Loja</h2>
  <p>Total de Produtos: <xsl:value-of select="count(loja/produto)"></xsl:value-of></p>
  <p>Soma total dos Preços: <xsl:value-of select="sum(loja/produto/preco)"></xsl:value-of></p>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>