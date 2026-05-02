<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
    <h1>Lista de Cursos</h1>
    <div class="cursos">
        <xsl:for-each select="academia/curso">
            <h2>
                <xsl:if test="estadoCurso = 'ATIVO'">
                    <xsl:attribute name="style">background-color:green;</xsl:attribute>
                </xsl:if>
                Curso: <xsl:value-of select="nome"/></h2>
            <p>Área do Curso: <xsl:value-of select="@area"/></p>
            <p>Duração: <xsl:value-of select="duracao"/></p>
            <p>Estado: <xsl:value-of select="estadoCurso"/></p>
            <h3>Formandos</h3>
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Idade</th>
                </tr>
                <xsl:for-each select="formandos/formando">
                <tr>
                    <xsl:if test="idade &gt; 25">
                        <xsl:attribute name="style">background-color:yellow;</xsl:attribute>
                    </xsl:if>
                    <td><xsl:value-of select="nome" /></td>
                    <td><xsl:value-of select="email" /></td>
                    <td><xsl:value-of select="idade" /></td>
                </tr>
                </xsl:for-each>
            </table>
        </xsl:for-each>
    </div>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
