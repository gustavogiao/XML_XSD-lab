<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
  <html>
  <body>
    <h1>List of Orders</h1>
    <hr></hr>

    <h2><xsl:value-of select="orders/customer/name"></xsl:value-of></h2>

    <p><strong>Contact Name: </strong> <xsl:value-of select="orders/customer/contactName"></xsl:value-of></p>
    <p><strong>Phone: </strong> <xsl:value-of select="orders/customer/phone"></xsl:value-of></p>

    <table border="1">
      <tr bgcolor="#9acd32">
        <th>EmployeeID</th>
        <th>OrderDate</th>
        <th>Country</th>
      </tr>
      <xsl:for-each select="orders/customer/ordersList/order">
      <tr>
        <td><xsl:value-of select="employeeID" /></td>
        <td><xsl:value-of select="orderDate" /></td>
        <td><xsl:value-of select="country" /></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
