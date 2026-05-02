<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/empresa">

<html>
<head>
    <title>Relatório da Empresa</title>
</head>

<body style="font-family: Arial;">

    <h1>
        <xsl:value-of select="info/nome"/>
    </h1>

    <p>
        País: <xsl:value-of select="info/pais"/>
    </p>

    <p>
        Fundada em:
        <xsl:value-of select="info/fundada"/>
        -
        Ano:
        <xsl:value-of select="info/fundada/@ano"/>
    </p>

    <hr/>

    <h2>Departamentos</h2>

    <xsl:for-each select="departamentos/departamento">

        <xsl:sort select="nome"/>

        <div style="border:1px solid black; padding:10px; margin-bottom:20px;">

            <!-- destacar INATIVO -->
            <xsl:if test="@estado = 'INATIVO'">
                <xsl:attribute name="style">
                    border:1px solid black; padding:10px; margin-bottom:20px; background-color:#eeeeee;
                </xsl:attribute>
            </xsl:if>

            <h3>
                <xsl:value-of select="nome"/>
                -
                <xsl:value-of select="@area"/>
            </h3>

            <p>
                Responsável:
                <xsl:value-of select="responsavel"/>
            </p>

            <p>
                Estado:
                <xsl:choose>
                    <xsl:when test="@estado = 'ATIVO'">
                        <strong style="color:green;">ATIVO</strong>
                    </xsl:when>
                    <xsl:otherwise>
                        <strong style="color:red;">INATIVO</strong>
                    </xsl:otherwise>
                </xsl:choose>
            </p>

            <!-- GROUPING POR TIPO -->
            <xsl:for-each select="colaboradores/colaborador
            [not(@tipo = preceding-sibling::colaborador/@tipo)]">

            <h4>Tipo: <xsl:value-of select="@tipo"/></h4>

            <table border="1" width="100%">
                <tr bgcolor="#9acd32">
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Idade</th>
                    <th>Salário</th>
                </tr>

                <xsl:for-each select="../colaborador[@tipo = current()/@tipo]">

                    <tr>
                        <td><xsl:value-of select="@codigo"/></td>
                        <td><xsl:value-of select="nome"/></td>
                        <td><xsl:value-of select="email"/></td>
                        <td><xsl:value-of select="idade"/></td>
                        <td><xsl:value-of select="salario"/></td>
                    </tr>

                </xsl:for-each>

            </table>

            <p>
                Nº colaboradores deste tipo:
                <xsl:value-of select="count(../colaborador[@tipo = current()/@tipo])"/>
            </p>

            <p>
                Soma salários deste tipo:
                <xsl:value-of select="sum(../colaborador[@tipo = current()/@tipo]/salario)"/>
            </p>

        </xsl:for-each>

            <!-- RESUMO DO DEPARTAMENTO -->
            <p>
                Total de colaboradores:
                <xsl:value-of select="count(colaboradores/colaborador)"/>
            </p>

            <p>
                Soma dos salários:
                <xsl:value-of select="sum(colaboradores/colaborador/salario)"/>
            </p>

        </div>

    </xsl:for-each>

    <hr/>

    <!-- RESUMO GLOBAL -->
    <h2>Resumo Geral</h2>

    <p>
        Total de departamentos:
        <xsl:value-of select="count(departamentos/departamento)"/>
    </p>

    <p>
        Total de colaboradores:
        <xsl:value-of select="count(departamentos/departamento/colaboradores/colaborador)"/>
    </p>

    <p>
        Soma total dos salários:
        <xsl:value-of select="sum(departamentos/departamento/colaboradores/colaborador/salario)"/>
    </p>

</body>
</html>

</xsl:template>

</xsl:stylesheet>