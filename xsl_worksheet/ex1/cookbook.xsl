<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">

        <html>
            <head>
                <title>Cookbook</title>

                <style>
                    body{
                    font-family: Arial;
                    background-color:#f5f5f5;
                    }

                    h1{
                    color:#333;
                    }

                    .recipe{
                    border:1px solid #ccc;
                    padding:15px;
                    margin:20px;
                    background:white;
                    }

                    table{
                    border-collapse:collapse;
                    width:50%;
                    }

                    th, td{
                    border:1px solid #aaa;
                    padding:6px;
                    }

                    th{
                    background:#ddd;
                    }
                </style>

            </head>

            <body>

                <h1>Cookbook Recipes</h1>

                <xsl:for-each select="cookbook/recipe">

                    <div class="recipe">

                        <h2>
                            <xsl:value-of select="title"/>
                        </h2>

                        <p>
                            <b>Author:</b>
                            <xsl:value-of select="author"/>
                        </p>

                        <h3>Ingredients</h3>

                        <table>
                            <tr>
                                <th>Name</th>
                                <th>Quantity</th>
                                <th>Unit</th>
                            </tr>

                            <xsl:for-each select="ingredients/ingredient">
                                <tr>
                                    <td><xsl:value-of select="name"/></td>
                                    <td><xsl:value-of select="quantity"/></td>
                                    <td><xsl:value-of select="unit"/></td>
                                </tr>
                            </xsl:for-each>

                        </table>

                        <p>
                            <b>Description:</b>
                            <xsl:value-of select="description"/>
                        </p>

                        <p>
                            <b>Calories:</b>
                            <xsl:value-of select="calories"/>
                        </p>

                    </div>

                </xsl:for-each>

            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>