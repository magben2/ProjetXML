<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:template name="mail">
		<xsl:param name="email" />
		<a href="mailto:{$email}" class="secondary-button pure-button">
			e-mail
		</a>
	</xsl:template>

	<xsl:template name="site">
		<xsl:param name="site" />
		<a href="{$site}" class="secondary-button pure-button">
			site web
		</a>
	</xsl:template>

	<xsl:template name="faire-une-liste">
		<xsl:param name="objets" />
		<xsl:param name="nom_fichier" />
		<xsl:param name="nom_elem" />
		<xsl:param name="nom_elem_opt" />
		<div id="list" class="pure-u-1">
			<xsl:for-each select="$objets">
				<xsl:sort select="current()/*[1]" />
				<!--<xsl:choose>
					<xsl:when test="position()=1">
						<xsl:variable name="selected">
							email-item-selected
						</xsl:variable>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="selected">
						</xsl:variable>
					</xsl:otherwise>
				</xsl:choose>-->
				<a href="{$nom_fichier}-{current()/@id}.html" class="email-item pure-g">
		            <span class="pure-u-1">
		                <span class="email-name">
		                	<xsl:value-of select="current()/*[name()=$nom_elem]" />
							<xsl:if test="normalize-space($nom_elem_opt) != ''">
								&#160;<xsl:value-of select="current()/*[name()=$nom_elem_opt]" />
							</xsl:if>
		                </span>
		                <!--<h4 class="email-subject">Hello from Toronto</h4>
		                <p class="email-desc">
		                    Hey, I just wanted to check in with you from Toronto. I got here earlier today.
		                </p>-->
		            </span>
		        </a>
			</xsl:for-each>
		</div>
	</xsl:template>

</xsl:stylesheet>