<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/platform">

        <html>
            <body>

                <h2>My Online Courses</h2>

                <table border="1">

                    <tr bgcolor="#9acd32">
                        <th>Course</th>
                        <th>Student</th>
                        <th>Grade</th>
                    </tr>

                    <xsl:for-each select="course">

                        <!-- guardar nome do curso -->
                        <xsl:variable name="courseTitle" select="title"/>

                        <xsl:for-each select="students/student">

                            <tr>
                                <td><xsl:value-of select="$courseTitle"/></td>
                                <td><xsl:value-of select="name"/></td>
                                <td><xsl:value-of select="grade"/></td>
                            </tr>

                        </xsl:for-each>

                    </xsl:for-each>

                </table>

            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>