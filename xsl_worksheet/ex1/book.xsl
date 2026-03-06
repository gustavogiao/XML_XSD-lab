<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Book Catalog</title>
            </head>

            <body>
                <h1>Book Details</h1>
                <xsl:for-each select="catalog/book">
                    <div id="book">
                        <h2>
                            <xsl:value-of select="title"/>
                        </h2>
                        <xsl:for-each select="authors">
                            <p>
                                Author: <xsl:value-of select="author"/>
                            </p>
                        </xsl:for-each>
                        <p>
                            Publisher: <xsl:value-of select="publisher"/>
                        </p>
                        <p>
                            Year: <xsl:value-of select="year"/>
                        </p>
                        <h3>Index</h3>
                        <xsl:for-each select="index/chapter">
                            <li>
                                <xsl:value-of select="title"/> , Page: <xsl:value-of select="page"/>
                            </li>
                        </xsl:for-each>
                        <h3>Characteristics</h3>
                        <xsl:for-each select="characteristics">
                            <li>
                                Cover: <xsl:value-of select="cover"/>
                            </li>
                            <li>
                                Number of Pages: <xsl:value-of select="number_of_pages"/>
                            </li>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </body>

        </html>
    </xsl:template>
</xsl:stylesheet>