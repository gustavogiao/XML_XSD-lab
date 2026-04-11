<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/orders">
  <html>
  <body>
    <h2>My Orders</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>Order ID</th>
        <th>Nome do Cliente</th>
        <th>Status</th>
        <th>Total da Encomenda</th>
      </tr>
      <xsl:for-each select="order">
        <tr>
            <xsl:if test="@status='pending'">
                <xsl:attribute name="style">background-color: #ffcccc;</xsl:attribute>
            </xsl:if>
            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="customer/name"/></td>
            <td><xsl:value-of select="@status"/></td>
            <td><xsl:value-of select="sum(items/item/price * items/item/quantity)"/></td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>