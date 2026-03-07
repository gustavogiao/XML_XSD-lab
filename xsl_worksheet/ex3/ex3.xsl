<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Publisher Catalog</title>
            </head>
            <body>
                <h1>Publisher Catalog</h1>
                <xsl:for-each select="publisher/books/book">
                    Book ID: <xsl:value-of select="@id"/>
                    <h2>Book Main Details</h2>
                    <p>
                        Title: <xsl:value-of select="title"/>
                    </p>
                    <p>
                        Subtitle: <xsl:value-of select="subtitle"/>
                    </p>
                    <p>
                        Year: <xsl:value-of select="year"/>
                    </p>
                    <xsl:for-each select="authors">
                        Author: <xsl:value-of select="author"/>
                    </xsl:for-each>
                    <xsl:for-each select="index/chapter">
                        <p>
                            Chapter: <xsl:value-of select="title"/>
                        </p>
                        <p>
                            Page: <xsl:value-of select="page"/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>