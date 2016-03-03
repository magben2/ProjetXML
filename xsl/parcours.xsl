<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<!-- TEMPLATE PARCOURS -->

	<xsl:import href="utils.xsl" />
	<xsl:import href="semestres.xsl" />

	<xsl:template name="parcours">
		<div id="main" class="pure-u-1">
	        <div class="email-content">
	            <div class="email-content-header pure-g">
	                <div class="pure-u-1">
	                    <h1 class="email-content-title">
							<xsl:value-of select="nom_parc" />
						</h1>
	                </div>
	            </div>

	            <div class="email-content-body">
					<xsl:for-each select="semestre">
						<xsl:call-template name="semestre" />
					</xsl:for-each>

					<xsl:variable name="respons">
						<xsl:for-each select="current()/responsable/@ref">
							<li>
								<a href="intervenant-{current()}.html">
									<xsl:value-of select="//intervenant[@id=current()]/nom_inter" />
								</a>
							</li>
						</xsl:for-each>
					</xsl:variable>

					<xsl:if test="$respons != '' ">
						<h3>Responsables du parcours</h3>
						<ul>
							<xsl:copy-of select="$respons" />
						</ul>
					</xsl:if>

					<xsl:variable name="inter">
						<xsl:for-each select="semestre/bloc_ue">
							<xsl:for-each select="current()/ref_ue">
								<xsl:for-each select="//ue[@id=current()]">
									<xsl:for-each select="current()/ref_intervenant">
										<li>
											<a href="intervenant-{current()}.html">
												<xsl:value-of select="//intervenant[@id=current()]/nom_inter" />
											</a>
										</li>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:variable>

					<xsl:if test="$inter != '' ">
						<h3>Intervenants</h3>
						<ul>
							<xsl:copy-of select="$inter" />
						</ul>
					</xsl:if>

					<h3>Lieu d'enseignement:</h3>
					<xsl:value-of select="translate(lieu_parc, '_', ' ')" />
	            </div>
	        </div>
	    </div>
	</xsl:template>
</xsl:stylesheet>