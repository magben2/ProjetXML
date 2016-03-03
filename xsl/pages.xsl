<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="head">
		<xsl:param name="title" />
		<head>
			<title>
				<xsl:value-of select="$title" />
			</title>
			<link rel="stylesheet" type="text/css" href="css/pure-min.css" />
			<link rel="stylesheet" type="text/css" href="css/style.css" />
		</head>
	</xsl:template>

	<xsl:template name="menu">
		<xsl:param name="title" />
		<div id="nav" class="pure-u">
	        <a href="#" class="nav-menu-button">Menu</a>

	        <div class="nav-inner">
	            <a href="documentation.html" class="primary-button pure-button">Documentation</a>

	            <div class="pure-menu">
	                <ul class="pure-menu-list">
	                    <li class="pure-menu-item">
	                    	<a href="intervenants.html" class="pure-menu-link">Intervenants</a>
	                    </li>
	                    <li class="pure-menu-item">
	                    	<a href="unites.html" class="pure-menu-link">Unités</a>
	                    </li>
	                    <li class="pure-menu-item">
	                    	<a href="masters.html" class="pure-menu-link">Masters</a>
	                    </li>
	                    <li class="pure-menu-heading">Autres</li>
	                    <li class="pure-menu-item">
	                    	<a href="xq.html" class="pure-menu-link">Question XQuery</a>
	                    </li>
	                    <li class="pure-menu-item">
	                    	<a href="dom.html" class="pure-menu-link">Question Java arbre DOM</a>
	                    </li>
	                    <li class="pure-menu-item">
	                    	<a href="ue3crluiny.html" class="pure-menu-link">UEs à 3 crédits sur Luminy</a>
	                    </li>
	                    <li class="pure-menu-item">
	                    	<a href="interluminy.html" class="pure-menu-link">Enseignants de Luminy</a>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</xsl:template>
</xsl:stylesheet>