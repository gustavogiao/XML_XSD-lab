<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h1>Resumo de Encomendas:</h1>
  <p>Total de Encomendas: <xsl:value-of select="count(loja/encomenda)"></xsl:value-of></p>
  <h2>Encomendas</h2>
  <xsl:for-each select="loja/encomenda">
    <p>ID da Encomenda: <xsl:value-of select="@id"/></p>
    <p>Cliente: <xsl:value-of select="cliente/nome"/></p>
    <p>Data: <xsl:value-of select="data"/></p>
    <p>Estado: <xsl:value-of select="@estado"/></p>
    <table border="1">
    <tr bgcolor="#9acd32">
        <xsl:if test="@estado = 'PENDENTE'">
            <xsl:attribute name="style">background-color:red;</xsl:attribute>
        </xsl:if>
        <th>Produto</th>
        <th>Quantidade</th>
        <th>Preço Unitário</th>
        <th>Total por Item</th>
    </tr>
    <xsl:for-each select="itens/item">
    <tr>
        <td><xsl:value-of select="produto"/></td>
        <td><xsl:value-of select="quantidade"/></td>
        <td><xsl:value-of select="precoUnitario"/></td>
        <td><xsl:value-of select="quantidade * precoUnitario"/></td>
    </tr>
    </xsl:for-each>
  </table>
  </xsl:for-each>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>