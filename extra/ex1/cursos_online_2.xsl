<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/platform">

        <statistics>
            <xsl:for-each select="course">
                <course name="{title}">
                        <average>
                            <xsl:value-of select="sum(students/student/grade) div count(students/student)"/>
                        </average>
                </course>
            </xsl:for-each>
        </statistics>

    </xsl:template>

</xsl:stylesheet>