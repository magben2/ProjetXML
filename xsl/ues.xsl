<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="utils.xsl" />

	<xsl:template name="ue">
		<div id="main" class="pure-u-1">
	        <div class="email-content">
	            <div class="email-content-header pure-g">
	                <div class="pure-u-1">
	                    <h1 class="email-content-title">
							<xsl:value-of select="nom_ue" />
						</h1>
						<p class="email-content-subtitle">
	                   		Crédits : <span><xsl:value-of select="nb_credits" /></span>
	                	</p>
	                </div>
	            </div>

	            <div class="email-content-body">
					<xsl:if test="ref_intervenant">
						<h3>Intervenants</h3>
						<ul>
							<xsl:for-each select="ref_intervenant">
								<xsl:variable name="inter" select="//intervenant[@id = current()]" />
								<li>
									<a href="intervenant-{current()}.html">
										<xsl:value-of select="$inter/nom_inter" />
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</xsl:if>

					<h3>Description</h3>
					<xsl:choose>

						<xsl:when test="resume[ (normalize-space(.) != '') ]">
							<xsl:copy-of select="resume/*" />
						</xsl:when>
						<xsl:otherwise>
							Aucune description disponible pour le moment.
						</xsl:otherwise>
					</xsl:choose>

					<xsl:if
						test="vol_cm[ (normalize-space(.) != '') ]|vol_td[ (normalize-space(.) != '') ]|vol_tp[ (normalize-space(.) != '') ]|vol_total[ (normalize-space(.) != '') ]">
						<h3>Organisation de l'UE</h3>
						<table summary="Valeur en heure">
							<caption>Valeurs en heure</caption>
							<tr>
								<xsl:if test="vol_cm[ (normalize-space(.) != '') ]">
									<td>CM</td>
								</xsl:if>
								<xsl:if test="vol_td[ (normalize-space(.) != '') ]">
									<td>TD</td>
								</xsl:if>
								<xsl:if test="vol_tp[ (normalize-space(.) != '') ]">
									<td>TP</td>
								</xsl:if>
								<xsl:if test="vol_total[ (normalize-space(.) != '') ]">
									<td>Total</td>
								</xsl:if>
							</tr>
							<tr>
								<xsl:if test="vol_cm[ (normalize-space(.) != '') ]">
									<td>
										<xsl:value-of select="vol_cm" />
									</td>
								</xsl:if>
								<xsl:if test="vol_td[ (normalize-space(.) != '') ]">
									<td>
										<xsl:value-of select="vol_td" />
									</td>
								</xsl:if>
								<xsl:if test="vol_tp[ (normalize-space(.) != '') ]">
									<td>
										<xsl:value-of select="vol_tp" />
									</td>
								</xsl:if>
								<xsl:if test="vol_total[ (normalize-space(.) != '') ]">
									<td>
										<xsl:value-of select="vol_total" />
									</td>
								</xsl:if>
							</tr>
						</table>
						<xsl:value-of select="plan" />
					</xsl:if>

					<h3>Enseigné dans les parcours suivants</h3>
					<ul>
						<xsl:for-each select="//ref_ue[. = current()/@id]">
							<li>
								<a href="parcours-{ancestor::parcours/@id}.html">
									<xsl:value-of select="ancestor::parcours/nom_parc" />
								</a>
							</li>
						</xsl:for-each>
					</ul>
	            </div>
	        </div>
	    </div>
	</xsl:template>
</xsl:stylesheet>