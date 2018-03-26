<xsl:template match="table[@class='ou-timeline'] ">
<div class="timeline minor-section">
	<xsl:for-each select="tbody/tr">  
		<div class="event clearfix">			
			<div class="medium-2 columns date">
				<p><xsl:value-of select="td[1]" /></p>
			</div>
			<div class="medium-10 columns description">
				<xsl:apply-templates select="td[2]"/>
			</div>			
		</div>
	</xsl:for-each>
</div>
</xsl:template>