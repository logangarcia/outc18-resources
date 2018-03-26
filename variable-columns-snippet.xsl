<xsl:template match="table[@class='ou-variable-columns']">
	<div class="row" data-equalizer="true">
		<xsl:for-each select="tbody/tr">
			<div class="{td[@class='class']} columns">
				<xsl:apply-templates select="td[@class='content']/node()"/>
			</div>
		</xsl:for-each>
	</div> 
</xsl:template>