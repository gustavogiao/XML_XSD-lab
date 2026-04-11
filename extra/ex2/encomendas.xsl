<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes"/>

<xsl:template match="/orders">

    <orderSummary>
        <xsl:for-each select="order">
            <order id="{@id}" status="{@status}">

                <xsl:attribute name="total">
                    <xsl:value-of select="sum(items/item/price * items/item/quantity)"/>
                </xsl:attribute>

                <customer>
                    <xsl:value-of select="customer/name"/>
                </customer>
            </order>
        </xsl:for-each>
    </orderSummary>

</xsl:template>

</xsl:stylesheet>