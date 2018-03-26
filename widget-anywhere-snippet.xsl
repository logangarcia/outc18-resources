<!-- Snippet -->

<xsl:template match="table[@class='ou-widget-anywhere']">
	<xsl:variable name="file-location" select="replace(tbody/tr/td, '.pcf', '.htm')" />
	<xsl:call-template name="includeWidget">
		<xsl:with-param name="fullpath" select="$file-location"/>
	</xsl:call-template>
</xsl:template>


<!-- includeWidget Template -->

<xsl:template name="includeWidget">
	<!-- directory name + file name -->
	<xsl:param name="fullpath" />
	<!-- on publish, it will output the proper SSI code, but on staging we require the omni div tag -->

	<!-- remove domain if it exists from a dependency tag -->
	<xsl:variable name="widgetpath" select="replace($fullpath, $ou:httproot, '/')" />

	<xsl:choose>
		<xsl:when test="$ou:action = 'pub'">
			<xsl:comment>#include virtual="<xsl:value-of select="$widgetpath" />" </xsl:comment>
			<!--<xsl:processing-instruction name="php"> include($_SERVER['DOCUMENT_ROOT'] . "<xsl:value-of select="$fullpath" />"); ?</xsl:processing-instruction>-->
		</xsl:when>
		<xsl:otherwise>
			<xsl:if test="unparsed-text-available(concat($domain, $widgetpath),'utf-8')">
				<xsl:value-of select="unparsed-text(concat($domain, $widgetpath),'utf-8')" disable-output-escaping="yes"/>
			</xsl:if>
		</xsl:otherwise>
</xsl:choose>
</xsl:template>