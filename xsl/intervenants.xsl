<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="utils.xsl" />

	<!-- TEMPLATE INTERVENANT -->

	<xsl:template name="intervenant">
		<div id="main" class="pure-u-1">
	        <div class="email-content">
	            <div class="email-content-header pure-g">
	                <div class="pure-u-1-2">
	                    <h1 class="email-content-title">
							<xsl:value-of select="nom_inter" />
							&#160;
							<xsl:value-of select="prenom_inter" />
						</h1>
	                </div>

	                <div class="email-content-controls pure-u-1-2">
	                	<xsl:if test="mail[ (normalize-space(.) != '') ]">
							<xsl:call-template name="mail">
								<xsl:with-param name="email" select="./mail" />
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="site[ (normalize-space(.) != '') ]">
							<xsl:call-template name="site">
								<xsl:with-param name="site" select="./site" />
							</xsl:call-template>
						</xsl:if>
	                </div>
	            </div>

	            <div class="email-content-body">
					<xsl:if test="//ue[ref_intervenant = current()/@id]">
						<h3>UEs enseignées</h3>
						<ul>
							<xsl:for-each select="key('ues','all')[ref_intervenant = current()/@id]">
								<li>
									<a href="ue-{@id}.html">
										<xsl:value-of select="nom_ue" />
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</xsl:if>
					<xsl:if test="key('parcours','all')[responsable/@ref = current()/@id]">
						<h3>Responsable des parcours</h3>
						<ul>
							<xsl:for-each select="key('parcours','all')[responsable/@ref = current()/@id]">
								<li>
									<a href="parcours-{@id}.html">
										<xsl:value-of select="nom_parc" />
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</xsl:if>
	            </div>
	        </div>
	    </div>
	</xsl:template>
</xsl:stylesheet>