<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- Construit le fichier master-gen.xml � partir des fichiers donnees-master.xml 
		et complement-donnees.xml -->

	<xsl:variable name="objets" select="//objet" />

	<xsl:variable name="intervenants" select="$objets[@type = 'personne']" />
	<xsl:variable name="unites" select="$objets[@type = 'enseignement']" />
	<xsl:variable name="parcours" select="$objets[@type = 'programme']" />
	<xsl:variable name="specialites" select="$objets[@type = 'specialite']" />
	<xsl:variable name="semestres" select="$objets[@type = 'semestre']" />
	<xsl:variable name="groupes" select="$objets[@type = 'groupe']" />
	<xsl:variable name="options" select="$objets[@type = 'option']" />

	<xsl:variable name="complement"
		select="document('complement-donnees.xml')/elements" />


	<xsl:template match="/">
		<xsl:document href="master-gen.xml" method="xml"
			encoding="iso-8859-1" indent="yes" doctype-public="//W3C//DTD XHTML 1.0 Strict//EN"
			doctype-system="master-dtd.dtd">
			<master_info>

				<!-- Liste des intervenants -->
				<intervenants>
					<xsl:for-each select="$intervenants">
						<intervenant>
							<xsl:attribute name="id">
								<xsl:value-of select="./@id" />
							</xsl:attribute>
							<nom_inter>
								<xsl:value-of select="info[@nom='nom']/@value" />
							</nom_inter>
							<prenom_inter>
								<xsl:value-of select="info[@nom='prenom']/@value" />
							</prenom_inter>
							<mail>
								<xsl:value-of select="info[@nom='mail']/@value" />
							</mail>
							<xsl:if
								test="$complement//element[@ref=current()/@id and @type='site']">
								<site>
									<xsl:copy-of
										select="$complement//element[@ref=current()/@id and @type='site']/text()" />
								</site>

							</xsl:if>
						</intervenant>
					</xsl:for-each>
				</intervenants>

				<!-- Master -->
				<master>

					<!-- Construit la liste des sp�cialit�s -->
					<xsl:for-each select="$specialites">
						<specialite>
							<xsl:attribute name="id">
									<xsl:value-of select="./@id" />
								</xsl:attribute>
							<nom_spe>
								<xsl:value-of select="info[@nom='nom-court']/@value" />
							</nom_spe>

							<xsl:for-each select="info[@nom = 'responsables']">
								<responsable>
									<xsl:attribute name="ref">
								<xsl:value-of select="./@value" />
							</xsl:attribute>
									<xsl:value-of
										select="$intervenants[@id = current()/@value]/info[@nom = 'nom']/@value" />
								</responsable>
							</xsl:for-each>

							<xsl:for-each select="info[@nom = 'structure']">
								<ref_parcours>
									<xsl:value-of select="current()/@value" />
								</ref_parcours>
							</xsl:for-each>
							<description>
								<xsl:call-template name="text_zone">
									<xsl:with-param name="text"
										select="info[@nom = 'connaissances']" />
								</xsl:call-template>
							</description>
							<debouche>
								<xsl:call-template name="text_zone">
									<xsl:with-param name="text" select="info[@nom = 'debouches']" />
								</xsl:call-template>
							</debouche>
							<finalite>
								<xsl:value-of select="info[@nom = 'finalite']/@value" />
							</finalite>
						</specialite>
					</xsl:for-each>

					<!-- Construit la liste des parcours -->
					<xsl:for-each select="$parcours">
						<parcours>
							<xsl:attribute name="id">
								<xsl:value-of select="./@id" /> 
							</xsl:attribute>
							<nom_parc>
								<xsl:value-of select="info[@nom='nom']/@value" />
							</nom_parc>
							<xsl:for-each select="info[@nom='structure']">
								<semestre>
									<nom_sem>
										<xsl:value-of
											select="$semestres[@id=current()/@value]/info[@nom='nom']/@value" />
									</nom_sem>
									<xsl:variable name="sem"
										select="$semestres[@id = current()/@value]" />

									<!-- Cas des UEs normales -->
									<bloc_ue>
										<nom_bloc_ue>Unit�s obligatoires</nom_bloc_ue>
										<xsl:for-each select="$sem/info[@nom='structure']">
											<xsl:if test="$unites[@id = current()/@value]">
												<ref_ue>
													<xsl:value-of select="./@value" />
												</ref_ue>
											</xsl:if>
										</xsl:for-each>
									</bloc_ue>

									<!-- Cas des r�f�rences vers des semestres "groupe" -->
									<xsl:for-each select="$sem/info[@nom = 'structure']">
										<xsl:if test="$groupes[@id=current()/@value]">
											<xsl:variable name="gr"
												select="$groupes[@id = current()/@value]" />
											<bloc_ue>
												<nom_bloc_ue>
													<xsl:value-of select="$gr/info[@nom='nom']/@value" />
												</nom_bloc_ue>
												<xsl:for-each select="$gr/info[@nom='structure']">
													<ref_ue>
														<xsl:value-of select="current()/@value" />
													</ref_ue>
												</xsl:for-each>
											</bloc_ue>
										</xsl:if>

										<!-- Cas des r�f�rences vers des semestres "option" -->
										<xsl:if test="$options[@id = current()/@value]">
											<xsl:variable name="op"
												select="$options[@id = current()/@value]" />
											<bloc_ue>
												<nom_bloc_ue>
													<xsl:value-of select="$op/info[@nom='nom']/@value" />
												</nom_bloc_ue>
												<xsl:for-each select="$op/info[@nom='structure']">
													<ref_ue>
														<xsl:value-of select="current()/@value" />
													</ref_ue>
												</xsl:for-each>
											</bloc_ue>
										</xsl:if>
									</xsl:for-each>
								</semestre>
							</xsl:for-each>
							<xsl:for-each select="info[@nom = 'responsables']">
								<responsable>
									<xsl:attribute name="ref"> 
										<xsl:value-of select="./@value" />
									</xsl:attribute>
									<xsl:value-of
										select="$intervenants[@id = current()/@value]/info[@nom = 'nom']/@value" />
								</responsable>
							</xsl:for-each>
							<description>
								<xsl:call-template name="text_zone">
									<xsl:with-param name="text"
										select="current()/info[@nom='competences']" />
								</xsl:call-template>

							</description>
							<objectifs>
								<xsl:call-template name="text_zone">
									<xsl:with-param name="text"
										select="current()/info[@nom='objectifs']" />
								</xsl:call-template>
							</objectifs>
							<lieu_parc>
								<xsl:attribute name="site"> 
										<xsl:value-of
									select="$complement//element[@ref=current()/@id and @type='lieu_parc']/text()" />
									</xsl:attribute>
								<xsl:copy-of
									select="$complement//element[@ref=current()/@id and @type='lieu_parc']/text()" />
							</lieu_parc>
						</parcours>
					</xsl:for-each>
				</master>

				<!-- Liste des unit�s -->
				<unites>
					<xsl:for-each select="$unites">
						<ue>
							<xsl:attribute name="id">
								<xsl:value-of select="./@id" />
							</xsl:attribute>
							<nom_ue>
								<xsl:value-of select="info[@nom='nom']/@value" />
							</nom_ue>
							<nom_identificateur>
								<xsl:value-of select="info[@nom='identificateur']/@value" />
							</nom_identificateur>
							<nb_credits>
								<xsl:value-of select="info[@nom='nb_credits']/@value" />
							</nb_credits>
							<xsl:for-each select="info[@nom='responsables']">
								<ref_intervenant>
									<xsl:value-of select="./@value" />
								</ref_intervenant>
							</xsl:for-each>
							<resume>
								<xsl:call-template name="text_zone">
									<xsl:with-param name="text" select="info[@nom='contenu']" />
								</xsl:call-template>
							</resume>
							<vol_cm>
								<xsl:value-of select="info[@nom='vol_cm']/@value" />
							</vol_cm>
							<vol_td>
								<xsl:value-of select="info[@nom='vol_td']/@value" />
							</vol_td>
							<vol_tp>
								<xsl:value-of select="info[@nom='vol_tp']/@value" />
							</vol_tp>
							<vol_total>
								<xsl:value-of select="info[@nom='vol_global']/@value" />
							</vol_total>
						</ue>
					</xsl:for-each>
				</unites>
			</master_info>
		</xsl:document>
	</xsl:template>


	<!-- Pour copier un texte et sa mise en forme -->
	<xsl:template name="text_zone">
		<xsl:param name="text" />
		<xsl:apply-templates select="$text/*" />

	</xsl:template>

	<xsl:template match="p">
		<p>
			<xsl:apply-templates select="./*" />
		</p>

	</xsl:template>
	<xsl:template match="b">
		<b>
			<xsl:value-of select="." />
		</b>

	</xsl:template>
	<xsl:template match="i">
		<i>
			<xsl:value-of select="." />
		</i>

	</xsl:template>
	<xsl:template match="u">
		<u>
			<xsl:value-of select="." />
		</u>

	</xsl:template>
	<xsl:template match="ol">
		<ol>
			<xsl:apply-templates select="./*" />
		</ol>

	</xsl:template>
	<xsl:template match="ul">
		<ul>
			<xsl:apply-templates select="./*" />
		</ul>

	</xsl:template>
	<xsl:template match="li">
		<li>
			<xsl:value-of select="./*" />
		</li>

	</xsl:template>

	<!-- permet de supprimer la balise <t> non reconnue par en HTML -->
	<xsl:template match="t">
		<xsl:value-of select="." />
	</xsl:template>

</xsl:stylesheet>