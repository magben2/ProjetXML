<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<!-- TEMPLATE SPECIALITE -->

	<xsl:import href="utils.xsl" />

	<xsl:template name="specialite">
		<div id="main" class="pure-u-1">
	        <div class="email-content">
	            <div class="email-content-header pure-g">
	                <div class="pure-u-1">
	                    <h1 class="email-content-title">
							<xsl:value-of select="nom_spe" />
						</h1>
	                </div>
	            </div>

	            <div class="email-content-body">
					<h3>Responsables de la spécialité</h3>
					<xsl:choose>

						<xsl:when test="resume[ (normalize-space(.) != '') ]">
							<xsl:copy-of select="resume/*" />
						</xsl:when>
						<xsl:otherwise>
							Aucune description disponible pour le moment.
						</xsl:otherwise>
					</xsl:choose>

					<h3>Parcours</h3>
					<ul>
						<xsl:for-each select="ref_parcours">
							<xsl:variable name="parc" select="//parcours[@id = current()]" />
							<li>
								<a href="parcours-{current()}.html">
									<xsl:value-of select="$parc/nom_parc" />
								</a>
							</li>
						</xsl:for-each>
					</ul>

					<h3>Description de la spécialité</h3>
					<div class="">
						<xsl:copy-of select="description/*" />
					</div>

					<h3>Débouchés</h3>
					<div class="">
						<xsl:copy-of select="debouche/*" />
					</div>

					<xsl:if test="finalite[ (normalize-space(.) != '') ]">
						<h3>Finalité:</h3>
						&#160;
						<xsl:if test="finalite='R'">
							Recherche
						</xsl:if>
						<xsl:if test="finalite='P'">
							Professionnelle
						</xsl:if>

					</xsl:if>
	            </div>
	        </div>
	    </div>
	</xsl:template>
</xsl:stylesheet>