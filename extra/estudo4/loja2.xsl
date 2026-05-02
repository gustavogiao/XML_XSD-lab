<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
    <resumo>
        <totalEncomendas>
            <xsl:value-of select="count(loja/encomenda)"></xsl:value-of>
        </totalEncomendas>
        <totalItens>
            <xsl:value-of select="count(loja/encomenda/itens/item)"></xsl:value-of>
        </totalItens>
        <valorTotal>
            <xsl:value-of select="sum(loja/encomenda/itens/item/precoUnitario)"/>
        </valorTotal>
    </resumo>
</xsl:template>

</xsl:stylesheet>