<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h1>Lista de Produtos</h1>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Nome</th>
      <th>Categoria</th>
      <th>Preço</th>
    </tr>
    <xsl:for-each select="loja/produto">
    <tr>
      <xsl:if test="preco &gt; 50">
        <xsl:attribute name="style">background-color:orange;</xsl:attribute>
      </xsl:if>
      <td><xsl:value-of select="nome"/></td>
      <td><xsl:value-of select="@categoria"/></td>
      <td><xsl:value-of select="preco"/></td>
    </tr>
    </xsl:for-each>
  </table>
  <h2>Resumo das Compras:</h2>
  <p>Número Total de produtos: <xsl:value-of select="count(loja/produto)"/></p>
  <p>Preço Total dos Produtos: <xsl:value-of select="sum(loja/produto/preco)"/></p>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>