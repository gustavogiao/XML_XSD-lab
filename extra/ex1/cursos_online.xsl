<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/platform">

        <courseSummary>
            <xsl:for-each select="course">

                <course name="{title}" level="{@level}">
                    <xsl:for-each select="students/student">

                        <student name="{name}">
                        <xsl:attribute name="result">

                        <xsl:choose>
                            <xsl:when test="grade &gt;= 10">approved</xsl:when>
                            <xsl:otherwise>failed</xsl:otherwise>
                        </xsl:choose>
                        </xsl:attribute>

                        </student>

                    </xsl:for-each>
                </course>

            </xsl:for-each>
        </courseSummary>

    </xsl:template>

</xsl:stylesheet>