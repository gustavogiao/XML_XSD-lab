<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">

        <bank_transactions>

            <xsl:for-each select="bank_transactions/transaction[destination_account/bank != 'BPI']">

                <transaction id="{@id}">

                    <date>
                        <xsl:value-of select="date"/>
                    </date>

                    <source_account>
                        <bank>
                            <xsl:value-of select="source_account/bank"/>
                        </bank>
                        <account_number>
                            <xsl:value-of select="source_account/account_number"/>
                        </account_number>
                    </source_account>

                    <destination_account>
                        <bank>
                            <xsl:value-of select="destination_account/bank"/>
                        </bank>
                        <account_number>
                            <xsl:value-of select="destination_account/account_number"/>
                        </account_number>
                    </destination_account>

                    <amount currency="{amount/@currency}">
                        <xsl:value-of select="amount"/>
                    </amount>

                    <description>
                        <xsl:value-of select="description"/>
                    </description>

                </transaction>

            </xsl:for-each>

        </bank_transactions>

    </xsl:template>

</xsl:stylesheet>