<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">

<html>
<body>

<h1>Company: <xsl:value-of select="company/info/name"/></h1>
<p>Founded: <xsl:value-of select="company/info/founded"/></p>
<p>Active: <xsl:value-of select="company/info/active"/></p>

<h2>Departments:</h2>

<xsl:for-each select="company/departments/department">

<h3>
<xsl:value-of select="name"/>
 (Type: <xsl:value-of select="@type"/>)
</h3>

<table border="1">

<tr bgcolor="#9acd32">
<th>Name</th>
<th>Age</th>
<th>Salary</th>
<th>Skills</th>
</tr>

<xsl:for-each select="employees/employee">

<tr>

<td><xsl:value-of select="name"/></td>
<td><xsl:value-of select="age"/></td>

<td>
<xsl:value-of select="salary"/>
<xsl:text> </xsl:text>
<xsl:value-of select="salary/@currency"/>
</td>

<td>
<xsl:for-each select="skills/skill">
<xsl:value-of select="."/>
<xsl:if test="position()!=last()">, </xsl:if>
</xsl:for-each>
</td>

</tr>

</xsl:for-each>

</table>

</xsl:for-each>

</body>
</html>

</xsl:template>

</xsl:stylesheet>