<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<!-- TEMPLATE SEMESTRE -->

	<xsl:template name="semestre">
		<h3>
			<xsl:value-of select="nom_sem" />
		</h3>
		<xsl:for-each select="bloc_ue">
			<h4>
				<xsl:value-of select="nom_bloc_ue" />
			</h4>
			<ul>
				<xsl:for-each select="ref_ue">
					<xsl:variable name="ue" select="//ue[@id = current()]" />
					<li>
						<a href="ue-{.}.html">
							<xsl:value-of select="$ue/nom_ue" />
						</a>
						&#160;
						(
						<xsl:value-of select="$ue/nb_credits" />
						crédits )
					</li>
				</xsl:for-each>
			</ul>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>