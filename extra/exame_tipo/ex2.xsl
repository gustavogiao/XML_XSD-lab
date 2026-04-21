<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/liga">
<html>
<body style="text-align:center; font-family:Arial;">

    <!-- Título -->
    <h1>
        <xsl:value-of select="nome"/>
    </h1>

    <!-- Jornada -->
    <h2>
        Jornada <xsl:value-of select="jornada"/>
    </h2>

    <br/>

    <!-- Jogos -->
    <xsl:for-each select="jogos/jogo">

        <!-- Resultado -->
        <h3>
            <xsl:value-of select="equipas/equipa[@side='HOME']/nome"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="equipas/equipa[@side='HOME']/golos"/>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="equipas/equipa[@side='AWAY']/golos"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="equipas/equipa[@side='AWAY']/nome"/>
        </h3>

        <!-- Marcadores -->
        <table style="margin: auto;">
            <tr>

                <!-- Casa -->
                <td style="padding-right:40px;">
                    <xsl:for-each select="equipas/equipa[@side='HOME']/marcadores/marcador">
                        <div>
                            <xsl:value-of select="@nome"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="@minuto"/>
                        </div>
                    </xsl:for-each>
                </td>

                <!-- Fora -->
                <td style="padding-left:40px;">
                    <xsl:for-each select="equipas/equipa[@side='AWAY']/marcadores/marcador">
                        <div>
                            <xsl:value-of select="@nome"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="@minuto"/>
                        </div>
                    </xsl:for-each>
                </td>

            </tr>
        </table>

        <br/><br/>

    </xsl:for-each>

</body>
</html>
</xsl:template>

</xsl:stylesheet>