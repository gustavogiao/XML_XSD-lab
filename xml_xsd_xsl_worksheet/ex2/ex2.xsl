<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/timeCapsule">

        <futureTimeCapsule year="2125">

            <xsl:for-each select="artifacts/artifact">

                <item category="{@type}" year="{year}">

                    <title>
                        <xsl:value-of select="title"/>
                    </title>

                    <creator>
                        <xsl:choose>
                            <xsl:when test="author">
                                <xsl:value-of select="author"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="director"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </creator>

                    <description>
                        <xsl:value-of select="description"/>
                    </description>

                </item>

            </xsl:for-each>

        </futureTimeCapsule>

    </xsl:template>

</xsl:stylesheet>