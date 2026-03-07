<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/receipt">
        <html>
            <head>
                <title>Order Receipt</title>
            </head>
            <body>
                <h1>Order Receipt</h1>
                <xsl:for-each select="store">
                    <p>
                        Name: <xsl:value-of select="name"/>
                    </p>
                    <p>
                        <xsl:for-each select="location">
                            <ul>
                                <li><xsl:value-of select="city"/></li>
                                <li><xsl:value-of select="country"/></li>
                            </ul>
                        </xsl:for-each>
                    </p>
                    <p>
                        <xsl:value-of select="vat_number"/>
                    </p>
                </xsl:for-each>
                <h1>Order Transaction</h1>
                <xsl:for-each select="transaction">
                    <p>Date:<xsl:value-of select="date"/></p>
                    <p>Time:<xsl:value-of select="time"/></p>
                    <p>Cashier:<xsl:value-of select="cashier"/></p>
                    <xsl:for-each select="items/item">
                        <ul>
                            <li>Name: <xsl:value-of select="name"/></li>
                            <li>Quantity: <xsl:value-of select="quantity"/></li>
                            <li>Price: <xsl:value-of select="price"/></li>
                            <li>Vat Rate: <xsl:value-of select="vat_rate"/></li>
                        </ul>
                    </xsl:for-each>
                    <p>Total Before Vat: <xsl:value-of select="total_before_vat"/></p>
                    <p>Vat Amount: <xsl:value-of select="vat_amount"/></p>
                    <p>Total After Vat: <xsl:value-of select="total_after_vat"/></p>
                </xsl:for-each>
                <h1>Order Buyer Details</h1>
                <xsl:for-each select="buyer">
                    <p><xsl:value-of select="name"/></p>
                    <xsl:for-each select="address">
                        <ul>
                            <li>
                                Street: <xsl:value-of select="street"/>
                            </li>
                            <li>
                                City: <xsl:value-of select="city"/>
                            </li>
                            <li>
                                Postal Code: <xsl:value-of select="postal_code"/>
                            </li>
                            <li>
                                Country: <xsl:value-of select="country"/>
                            </li>
                        </ul>
                    </xsl:for-each>
                    <p>
                        Vat Number: <xsl:value-of select="vat_number"/>
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>