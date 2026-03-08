<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/missionLog">
        <missionSummary date="{date}" astronaut="{astronaut}">

            <completedTasks>
                <xsl:for-each select="tasks/task[@status='completed']">
                    <task>
                        <title>
                            <xsl:value-of select="title"/>
                        </title>
                        <timeSpent>
                            <xsl:value-of select="timeSpent"/>
                        </timeSpent>
                    </task>
                </xsl:for-each>
                <totalTime>
                    <xsl:value-of select="sum(tasks/task[@status='completed']/timeSpent)"/>
                </totalTime>
            </completedTasks>

            <pendingTasks>
                <xsl:for-each select="tasks/task[@status='pending']">
                    <task>
                        <title>
                            <xsl:value-of select="title"/>
                        </title>
                        <timeSpent>
                            <xsl:value-of select="timeSpent"/>
                        </timeSpent>
                    </task>
                </xsl:for-each>
            </pendingTasks>
        </missionSummary>
    </xsl:template>
</xsl:stylesheet>