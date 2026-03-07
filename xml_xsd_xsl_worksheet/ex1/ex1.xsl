<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/receipt">

        {
        "receipt": {

        "store": {
        "name": "<xsl:value-of select="store/name"/>",
        "location": {
        "city": "<xsl:value-of select="store/location/city"/>",
        "country": "<xsl:value-of select="store/location/country"/>"
        },
        "contact": {
        "phone": "<xsl:value-of select="store/contact/phone"/>",
        "email": "<xsl:value-of select="store/contact/email"/>"
        },
        "vat_number": "<xsl:value-of select="store/vat_number"/>"
        },

        "transaction": {

        "date": "<xsl:value-of select="transaction/date"/>",
        "time": "<xsl:value-of select="transaction/time"/>",
        "cashier": "<xsl:value-of select="transaction/cashier"/>",

        "items": [

        <xsl:for-each select="transaction/items/item">

            {
            "name": "<xsl:value-of select="name"/>",
            "quantity": <xsl:value-of select="quantity"/>,
            "price": <xsl:value-of select="price"/>,
            "vat_rate": <xsl:value-of select="vat_rate"/>
            }

            <xsl:if test="position()!=last()">,</xsl:if>

        </xsl:for-each>

        ],

        "total_before_vat": <xsl:value-of select="transaction/total_before_vat"/>,
        "vat_amount": <xsl:value-of select="transaction/vat_amount"/>,
        "total_after_vat": <xsl:value-of select="transaction/total_after_vat"/>

        },

        "buyer": {

        "name": "<xsl:value-of select="buyer/name"/>",

        "address": {
        "street": "<xsl:value-of select="buyer/address/street"/>",
        "city": "<xsl:value-of select="buyer/address/city"/>",
        "postal_code": "<xsl:value-of select="buyer/address/postal_code"/>",
        "country": "<xsl:value-of select="buyer/address/country"/>"
        },

        "vat_number": "<xsl:value-of select="buyer/vat_number"/>"

        }

        }

        }

    </xsl:template>

</xsl:stylesheet>