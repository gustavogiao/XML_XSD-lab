<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h1>Produtos da Minha Loja</h1>
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
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="preco &gt; 200">
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
  <h1>Resumo da Loja</h1>
  <p>Número de Produtos: <xsl:value-of select="count(loja/produto)"></xsl:value-of></p>
  <p>Soma dos Produtos: <xsl:value-of select="sum(loja/produto/preco)"></xsl:value-of></p>
  <p>Média dos Preços: <xsl:value-of select="sum(loja/produto/preco) div count(loja/produto)"></xsl:value-of></p>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>