<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	
	<xsl:output 
        method="html"
        encoding="UTF-8"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
        indent="yes" />
	
	<xsl:template match="/">
		<xsl:document href="index.html">
				<html>
					<head>
						<title>
							Master
						</title>
					</head>
					<body>
						<h1>Table des unités</h1>
						<xsl:call-template name="table-des-unites" />
						<h1>Table des intervenants</h1>
						<xsl:call-template name="table-des-intervenants" />
					</body>
				</html>
		</xsl:document>
		<xsl:call-template name="liste-des-intervenants" />
		<xsl:call-template name="liste-des-unites" />
		<xsl:call-template name="liste-des-parcours" />
	</xsl:template>
	
	
	<!-- ***** TABLES ***** -->
	
	<xsl:template name="table-des-unites">
		<ul>
			<xsl:for-each select="master/unite">
			    <xsl:variable name="id" select="@id" />
			    <li><a href="unites/unite-{$id}.html"><xsl:value-of select="nom"/></a></li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	
	<xsl:template name="table-des-intervenants">
		<ul>
			<xsl:for-each select="master/intervenant">
			    <xsl:variable name="id" select="@id" />
			    <li><a href="intervenants/intervenant-{$id}.html"><xsl:value-of select="nom"/></a></li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	
	
	<!-- ***** LISTES ***** -->

	<xsl:template name="liste-des-unites">
		<xsl:for-each select="master/unite">
	        <xsl:call-template name="afficherUnite" />
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="liste-des-intervenants">
		<xsl:for-each select="master/intervenant">
	        <xsl:call-template name="afficherIntervenant" />
	    </xsl:for-each>	
	</xsl:template>
	
	<xsl:template name="liste-des-parcours">
		<xsl:for-each select="master/parcours">
	        <xsl:call-template name="afficherParcours" />
	    </xsl:for-each>	
	</xsl:template>
	
	
	<!-- ***** AFFICHAGES ***** -->
	
	<xsl:template name="afficherUnite">
		<xsl:variable name="id" select="@id" />
		<xsl:document href="unites/unite-{$id}.html">
			<html>
				<head>
					<title>
						<xsl:value-of select="nom"/>
					</title>
				</head>
				<body>
					<p>
						<h1>Unité : <xsl:value-of select="nom"/></h1>
						id : <xsl:value-of select="@id"/>
						<br />
						Nombre de crédit : <xsl:value-of select="nbCredit"/>
						<br />
						Résumé : <xsl:value-of select="string(resume)"/>
						<!-- ne pas oublier d'enlever le "string" du select -->
						<br />
						Lieu : <xsl:value-of select="lieu"/>
						<ul>
							<xsl:for-each select="ref-intervenant">
								<xsl:call-template name="afficherRefIntervenant"/>
							</xsl:for-each>
						</ul>
					</p>
					</body>
			</html>
		</xsl:document>
	</xsl:template>
	
	<xsl:template name="afficherIntervenant">
		<xsl:variable name="id" select="@id" />
		<xsl:document href="intervenants/intervenant-{$id}.html">
			<html>
				<head>
					<title>
						<xsl:value-of select="nom"/>
					</title>
				</head>
				<body>
					<h1>Intervenant : <xsl:value-of select="nom"/></h1>
					<p>
						<h2><xsl:value-of select="nom"/></h2>
						id : <xsl:value-of select="@id"/>
						<br />
						Mail : <xsl:value-of select="mail"/>
					</p>
				</body>
			</html>
		</xsl:document>
	</xsl:template>
	
	<xsl:template name="afficherParcours">
		<xsl:variable name="id" select="@id" />
		<xsl:document href="parcours/parcours-{$id}.html">
			<html>
				<head>
					<title>
						<xsl:value-of select="nom"/>
					</title>
				</head>
				<body>
					<h1>Parcours : <xsl:value-of select="nom"/></h1>
					<p>
						<xsl:call-template name="afficherRefResponsable"/>
						<br /><br />
						Description : <xsl:value-of select="description"/>
						
						<ul>
							<xsl:for-each select="debouche">
								<li><xsl:value-of select="."/></li>
							</xsl:for-each>
						</ul>
						
						<xsl:for-each select="semestre">
							<h2>Semestre <xsl:value-of select="translate(@id, translate(@id, '0123456789', ''), '')"/></h2>
							<xsl:for-each select="bloc-unite">
								<xsl:value-of select="nom"/>
								<xsl:for-each select="ref-unite">
									<xsl:call-template name="afficherRefUnite"/>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</p>
				</body>
			</html>
		</xsl:document>
	</xsl:template>

	<xsl:template name="afficherRefResponsable">
		<xsl:variable name="ref" select="ref-responsable/@ref" />
		<xsl:variable name="intervenant" select="//intervenant[@id=$ref]" />
		Responsable : <a href="../intervenants/intervenant-{$ref}.html"><xsl:value-of select="$intervenant/nom"/></a>
	</xsl:template>

	<xsl:template name="afficherRefIntervenant">
		<xsl:variable name="ref" select="@ref" />
		<xsl:variable name="intervenant" select="//intervenant[@id=$ref]" />
		<li><a href="../intervenants/intervenant-{$ref}.html"><xsl:value-of select="$intervenant/nom"/></a></li>
	</xsl:template>
	
	<xsl:template name="afficherRefUnite">
		<xsl:variable name="ref" select="@ref" />
		<xsl:variable name="unite" select="//unite[@id=$ref]" />
		<li><a href="../unites/unite-{$ref}.html"><xsl:value-of select="$unite/nom"/></a></li>
	</xsl:template>
</xsl:stylesheet>
