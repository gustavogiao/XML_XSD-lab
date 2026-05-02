<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes"/>

<!-- chave para agrupar por categoria -->
<xsl:key name="catKey" match="venda" use="categoria"/>

<xsl:template match="/">

<resumo>

    <!-- selecionar categorias únicas -->
    <xsl:for-each select="vendas/venda[generate-id() = generate-id(key('catKey', categoria)[1])]">
        
        <categoria nome="{categoria}">
            
            <!-- total de vendas -->
            <totalVendas>
                <xsl:value-of select="count(key('catKey', categoria))"/>
            </totalVendas>

            <!-- valor total -->
            <valorTotal>
                <xsl:call-template name="somarCategoria">
                    <xsl:with-param name="nodes" select="key('catKey', categoria)"/>
                </xsl:call-template>
            </valorTotal>

        </categoria>

    </xsl:for-each>

</resumo>

</xsl:template>

<!-- template recursivo para somar -->
<xsl:template name="somarCategoria">
    <xsl:param name="nodes"/>
    <xsl:param name="soma" select="0"/>

    <xsl:choose>
        <xsl:when test="count($nodes) = 0">
            <xsl:value-of select="$soma"/>
        </xsl:when>

        <xsl:otherwise>
            <xsl:call-template name="somarCategoria">
                <xsl:with-param name="nodes" select="$nodes[position() > 1]"/>
                <xsl:with-param name="soma"
                    select="$soma + ($nodes[1]/quantidade * $nodes[1]/preco)"/>
            </xsl:call-template>
        </xsl:otherwise>
    </xsl:choose>

</xsl:template>

</xsl:stylesheet>