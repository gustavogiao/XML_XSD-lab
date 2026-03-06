<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>BPI Transactions</title>
            </head>
            <body>
                <h1>BPI Transactions</h1>
                <xsl:for-each select="bank_transactions/transaction">
                    Transaction ID: <xsl:value-of select="@id"/>
                    <h2> Source Account </h2>
                    <p>
                        Bank: <xsl:value-of select="source_account/bank"/>
                        Account Number: <xsl:value-of select="source_account/account_number"/>
                    </p>
                    <h2> Destination Account </h2>
                    <p>
                        Bank: <xsl:value-of select="destination_account/bank"/>
                        Account Number: <xsl:value-of select="destination_account/account_number"/>
                    </p>
                    <h3>Details of Transaction</h3>
                    <p>
                        Amount:
                        <xsl:value-of select="amount"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="amount/@currency"/>
                    </p>
                    <p>
                        Description: <xsl:value-of select="description"/>
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>