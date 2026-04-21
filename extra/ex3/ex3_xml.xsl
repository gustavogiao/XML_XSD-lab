<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/company">

<companySummary>
    <xsl:for-each select="departments/department">
        <department name="{name}" type="{@type}">
            <xsl:for-each select="employees/employee">
                <employee id="{@id}" salary="{salary}"/>
            </xsl:for-each>
        </department>
    </xsl:for-each>
</companySummary>
    
</xsl:template>

</xsl:stylesheet>