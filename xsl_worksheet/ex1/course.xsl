<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Subject Details</title>
            </head>
            <body>
                <h1>Subject Details</h1>

                <xsl:for-each select="subject">
                    <ul>
                        <li>
                            Subject Name: <xsl:value-of select="name"/>
                        </li>
                        <li>
                            Academic Year: <xsl:value-of select="academic_year"/>
                        </li>
                        <li>
                            ECTS: <xsl:value-of select="ects"/>
                        </li>
                    </ul>

                    <h2>Evaluation Methods</h2>

                    <xsl:for-each select="evaluation_methods/evaluation_method">

                        <h4>
                            Method: <xsl:value-of select="@type"/>
                        </h4>

                        <xsl:for-each select="evaluation_element">
                            <li>
                                <xsl:value-of select="name"/>
                                (Weight)<xsl:value-of select="@weight"/>%
                            </li>
                        </xsl:for-each>
                    </xsl:for-each>

                    <h2>Students Grades</h2>

                    <xsl:for-each select="students/student">
                        <li>
                            Number Mec: <xsl:value-of select="number"/> Name: <xsl:value-of select="name"/>
                        </li>
                        <xsl:for-each select="grades/grade">
                            <li>
                                Result: <xsl:value-of select="@element_ref"/> with <xsl:value-of select="@value"/>
                            </li>
                        </xsl:for-each>
                    </xsl:for-each>


                </xsl:for-each>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>