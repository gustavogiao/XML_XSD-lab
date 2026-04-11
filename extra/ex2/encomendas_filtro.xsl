<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes"/>

<xsl:template match="/orders">

    <completedOrders>
        <xsl:for-each select="order[@status = 'completed']">
            <order id="{@id}">
            <customer>
                <xsl:value-of select="customer/name"/>
            </customer>
            <total>
                <xsl:value-of select="sum(items/item/price * items/item/quantity)"/>
            </total>
        </order>
        </xsl:for-each>
    </completedOrders>

</xsl:template>

</xsl:stylesheet>