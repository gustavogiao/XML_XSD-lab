<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <head>
        <title>Eventos</title>
    </head>
    <body>
        <h1>Lista de Eventos</h1>
        <xsl:for-each select="eventos/evento">
            <h3>Nome do Evento: <xsl:value-of select="nome"/></h3>
            <p>Organizador: <xsl:value-of select="organizador/nome"/></p>
            <p>Localização: <xsl:value-of select="localizacao"/></p>
            <p>Data: <xsl:value-of select="data"/></p>
            <p>Estado do Evento: <xsl:value-of select="estadoEvento"/></p>
            <table border="1">
                <xsl:if test="estadoEvento = 'EM_CURSO'">
                    <xsl:attribute name="style">background-color:yellow;</xsl:attribute>
                </xsl:if>
                <tr bgcolor="#9acd32">
                    <th>Nome do Participante</th>
                    <th>Email</th>
                    <th>Tipo de Participação</th>
                </tr>
                <xsl:for-each select="participantes/participante">
                    <tr>
                    <td><xsl:value-of select="nome"/></td>
                    <td><xsl:value-of select="email"/></td>
                    <td><xsl:value-of select="tipoParticipacao"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </xsl:for-each>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>