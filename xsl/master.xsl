<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" encoding="iso-8859-1" indent="yes"
		doctype-system="master-dtd.dtd" />

	<xsl:include href="includes.xsl" />

	<xsl:key use="'all'" name="enseignants" match="//intervenant" />
	<xsl:key use="'all'" name="ues" match="//ue" />
	<xsl:key use="'all'" name="specialites" match="//specialite" />
	<xsl:key use="'all'" name="parcours" match="//parcours" />

	<xsl:template match="/">
		<xsl:document href="www/index.html" method="xml"
			encoding="iso-8859-1" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<div id="layout-index" class="content pure-g">
						<xsl:call-template name="menu">
							<xsl:with-param name="title">
								Master Informatique | Aix-Marseille Universit�
							</xsl:with-param>
							<xsl:with-param name="id-nav">-index</xsl:with-param>
						</xsl:call-template>

						<div id="main-index" class="pure-u-1">
					        <div class="email-content">
					            <div class="email-content-header pure-g">
					                <div class="pure-u-1">
					                    <h1 class="email-content-title">
											Bienvenue sur la page du Master Informatique de Aix-Marseille Universit�
										</h1>
					                </div>
					            </div>

					           	<div class="email-content-body">
									<p>
										Vous y trouverez toutes les informations concernant les parcours
										ouverts dans l'universit�
										<br />
										ainsi qu'un d�tail des mati�res qu'il vous faudra suivre.
										<br />
										<br />
										<br />
										Bonne visite!!
									</p>
									<p id="bottom">Cette page a �t� cr��e par Benjamin MAGRON et Nicolas LEOTIER</p>
								</div>
							</div>
						</div>
					</div>
				</body>
			</html>
		</xsl:document>

		<xsl:document href="www/documentation.html" method="xml"
			encoding="iso-8859-1" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<div id="layout-index" class="content pure-g">
						<xsl:call-template name="menu">
							<xsl:with-param name="title">
								Documentation Master Informatique | Aix-Marseille Universit�
							</xsl:with-param>
							<xsl:with-param name="id-nav">-index</xsl:with-param>
						</xsl:call-template>

						<div id="main-index" class="pure-u-1">
					        <div class="email-content">
					            <div class="email-content-header pure-g">
					                <div class="pure-u-1">
					                    <h1 class="email-content-title">
											Documentation du Master Informatique de Aix-Marseille Universit�
										</h1>
					                </div>
					            </div>

					           	<div class="email-content-body">
									<h2>Introduction</h2>
									<p>
										Le but du projet est de construire des pages HTML � partir du contenu
										du site du <a href="http://masterinfo.univ-mrs.fr/">master
											informatique</a>. Pour cela nous utilisons une <a
											href="../donnees-master.xml">base de donn�es</a> sous format XML pour
										construire, � l'aide d'un fichier XSLT, un autre fichier XML
										correspondant � une DTD structur�e afin de simplifier l'organisation
										des donn�es. Une fois ce fichier XML cr��, on utilise un autre fichier
										XSLT pour cr�er une <a href="www/">liste de fichiers HTML</a> et ainsi
										obtenir des pages web.
									</p>
									<h2>Architecture</h2>
									<p>Voici comment sont organis�s nos fichiers:</p>
									<ul>
										<li><a href="../donnees-master.xml"><b>donnees-master.xml</b></a>:
											contient toutes les donn�es du site du Master (intervenants, UEs,
											sp�cialit�s, parcours...). Respecte la dtd suivante:
											donnees-master.dtd</li>
										<li><a href="../complement-donnees.xml"><b>complement-donnees.xml</b></a>:
											ajout de donn�es qui ne se trouvent pas dans le fichier de donn�es.</li>
										<li><b>donnees-to-xml.xsl:</b> XSLT qui permet de cr�er le
											fichier master-gen.xml qui est une version plus simplifi�e du fichier
											de donn�es.</li>
										<li><a href="../master-gen.xml"><b>master-gen.xml</b></a>: contient
											les donn�es qui seront publi�es sur les pages HTML. Respecte la DTD
											suivante: master-dtd.dtd</li>
										<li><b>master-stylesheet.xsl:</b> XSLT qui permet de cr�er tous
											les <a href="/">documents HTML</a> dans le dossier www/ en
											utilisant les templates du dossier /templates. C'est aussi ici qu'on
											trouve les lignes XPath (listes d'UEs et d'enseignants de Luminy)
											demand�es dans les fiches de TP.</li>
										<li><b>master-schema.xsd:</b> schema qui v�rifie master-gen.xml.</li>
										<li><b>CreateDom.java:</b> fichier Java qui r�pond � la question
											pos�e dans le sujet: faire la liste des noms des unit�s.</li>
										<li><b>xq.txt:</b> requ�te XQuery qui r�pond � la question du
											sujet: donner pour chaque enseignant les UEs et parcours dont il est
											responsable.</li>
										<li><b>documentation.html:</b> description du projet et de tous les fichiers pr�sents.</li>
									</ul>
									<p>Les fichiers HTML sont organis�s en plusieurs cat�gories:</p>
									<ul>
										<li><b>index.html:</b> racine du projet. Contient un menu qui
											contient des liens vers tous les autres.</li>
										<li><b>unites.html:</b> contient une liste de liens vers tous les
											fichiers des UEs.</li>
										<li><b>ue-ID.html:</b> contient une liste de liens vers tous les fichiers des UEs et la description de l'UE .</li>
										<li><b>intervenants.html:</b> contient une liste de liens vers
											tous les fichiers des intervenants.</li>
										<li><b>intervenant-ID.html:</b> contient une liste de liens vers
											tous les fichiers des intervenants et la description de l'intervenant.</li>
										<li><b>masters.html:</b> contient une liste de liens vers tous
											les fichiers des sp�cialit�s.</li>
										<li><b>specialite-ID.html:</b> contient une liste de liens vers tous les fichiers des sp�cialit�s et la description de la sp�cialit�.
											Contient des liens vers les parcours.</li>
										<li><b>parcours-ID.html:</b> contient une liste de liens vers tous les fichiers des parcours et la description d'un parcours.</li>
										<li><b>xq.html:</b> contient le r�sultat de la requ�te XQuery qui liste les enseignants avec, pour chacun, les enseignements qu'il assure et les parcours dans lesquels il intervient dans une liste tri�e.</li>
									</ul>


									<h2>Makefile</h2>
									<p>
										Nous avons un Makefile conforme � ce qui �tait demand�.
										Nous avons rajout� la commande <i>gen</i> qui permet de g�n�rer le fichier
										master-gen.xml � partir du fichier de donn�es et du fichier
										donnees-to-xml.xsl.
									</p>
									<ul>
										<li><b>gen: </b>construction du fichier de donn�es XML</li>
										<li><b>dtd: </b>validation de la DTD</li>
										<li><b>xsd: </b>validation du schema</li>
										<li><b>web: </b>g�n�ration du dossier www/</li>
										<li><b>xq: </b>cr�ation de la requ�te XQuery</li>
										<li><b>tidy: </b>validation des fichiers www./*.html. Validation
											de la documentation</li>
										<li><b>java: </b>cr�ation du fichier DOM</li>
										<li><b>clean: </b>suppression de master-gen.xml, www/, dom.txt et
											*.class</li>
									</ul>

									<h2>Utilisation et outils requis</h2>
									<p>
										Il suffit de lancer la commande <i>make</i> dans le r�pertoire
										ProjetXML/ afin de construire toutes les donn�es, ouvrez ensuite
										www/index.html. <br/>
										<br/> Avant toute chose, assurez-vous d'avoir ces outils :
									</p>
									<ul>
										<li><b>tidy: </b> v�rification HTML.</li>
										<li><b><a href="http://saxon.sourceforge.net/#F9.4HE">saxon-HE</a>:
										</b>pour cr�er la requ�te XQuery</li>
										<li><b><a
												href="http://www.dil.univ-mrs.fr/~massat/copie/xml/ress-XSD/">trang</a>:
										</b>pour g�n�rer un sch�ma � partir d'une DTD ou XML.<br/> <i>
												Commande: java -jar trang/trang-20030619/trang.jar master-dtd.dtd
												master-schema.xsd</i></li>
										<li><b>Eclipse-EE</b></li>
									</ul>
									<p>Cette page a �t� cr��e par Benjamin MAGRON et Nicolas LEOTIER</p>
								</div>
							</div>
						</div>
					</div>
				</body>
			</html>
		</xsl:document>

		<xsl:document href="www/intervenants.html" method="xml"
			encoding="iso-8859-1" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Intervenants Master Informatique | Aix-Marseille Universit�
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<div id="layout" class="content pure-g">
						<xsl:call-template name="menu">
							<xsl:with-param name="title">
								Intervenants Master Informatique | Aix-Marseille Universit�
							</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="faire-une-liste">
							<xsl:with-param name="objets" select="key('enseignants','all')" />
							<xsl:with-param name="nom_fichier" select="'intervenant'" />
							<xsl:with-param name="nom_elem" select="'nom_inter'" />
							<xsl:with-param name="nom_elem_opt" select="'prenom_inter'" />
						</xsl:call-template>
					</div>
				</body>
			</html>
		</xsl:document>

		<xsl:for-each select="//intervenant">
			<xsl:document href="www/intervenant-{@id}.html" method="xml"
				encoding="iso-8859-1" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
				doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:call-template name="head">
						<xsl:with-param name="title">
							Intervenants Master Informatique | Aix-Marseille Universit�
						</xsl:with-param>
					</xsl:call-template>
					<body>
						<div id="layout" class="content pure-g">
							<xsl:call-template name="menu">
								<xsl:with-param name="title">
									Intervenants Master Informatique | Aix-Marseille Universit�
								</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="faire-une-liste">
								<xsl:with-param name="objets" select="key('enseignants','all')" />
								<xsl:with-param name="nom_fichier" select="'intervenant'" />
								<xsl:with-param name="nom_elem" select="'nom_inter'" />
								<xsl:with-param name="nom_elem_opt" select="'prenom_inter'" />
							</xsl:call-template>
							<xsl:call-template name="intervenant" />
						</div>
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>

		<xsl:document href="www/unites.html" method="xml"
			encoding="iso-8859-1" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Unit�s Master Informatique | Aix-Marseille
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<div id="layout" class="content pure-g">
						<xsl:call-template name="menu">
							<xsl:with-param name="title">
								Unit�s Master Informatique | Aix-Marseille
							</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="faire-une-liste">
							<xsl:with-param name="objets" select="key('ues','all')" />
							<xsl:with-param name="nom_fichier" select="'ue'" />
							<xsl:with-param name="nom_elem" select="'nom_ue'" />
						</xsl:call-template>
					</div>
				</body>
			</html>
		</xsl:document>

		<xsl:for-each select="//ue">
			<xsl:document href="www/ue-{@id}.html" method="xml"
				encoding="iso-8859-1" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
				doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:call-template name="head">
						<xsl:with-param name="title">
							Unit�s Master Informatique | Aix-Marseille Universit�
						</xsl:with-param>
					</xsl:call-template>
					<body>
						<div id="layout" class="content pure-g">
							<xsl:call-template name="menu">
								<xsl:with-param name="title">
									Unit�s Master Informatique | Aix-Marseille Universit�
								</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="faire-une-liste">
							<xsl:with-param name="objets" select="key('ues','all')" />
							<xsl:with-param name="nom_fichier" select="'ue'" />
							<xsl:with-param name="nom_elem" select="'nom_ue'" />
						</xsl:call-template>
							<xsl:call-template name="ue" />
						</div>
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>

		<xsl:document href="www/masters.html" method="xml"
			encoding="iso-8859-1" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Masters Informatique | Aix-Marseille
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<div id="layout" class="content pure-g">
						<xsl:call-template name="menu">
							<xsl:with-param name="title">
								Masters Informatique | Aix-Marseille
							</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="faire-une-liste">
							<xsl:with-param name="objets" select="key('specialites','all')" />
							<xsl:with-param name="nom_fichier" select="'specialite'" />
							<xsl:with-param name="nom_elem" select="'nom_spe'" />
						</xsl:call-template>
					</div>
				</body>
			</html>
		</xsl:document>

		<xsl:for-each select="//specialite">
			<xsl:document href="www/specialite-{@id}.html" method="xml"
				encoding="iso-8859-1" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
				doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:call-template name="head">
						<xsl:with-param name="title">
							Sp�cialit�s Master Informatique | Aix-Marseille Universit�
						</xsl:with-param>
					</xsl:call-template>
					<body>
						<div id="layout" class="content pure-g">
							<xsl:call-template name="menu">
								<xsl:with-param name="title">
									Sp�cialit�s Master Informatique | Aix-Marseille Universit�
								</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="faire-une-liste">
								<xsl:with-param name="objets" select="key('specialites','all')" />
								<xsl:with-param name="nom_fichier" select="'specialite'" />
								<xsl:with-param name="nom_elem" select="'nom_spe'" />
							</xsl:call-template>
							<xsl:call-template name="specialite" />
						</div>
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>

		<xsl:for-each select="//parcours">
			<xsl:document href="www/parcours-{@id}.html" method="xml"
				encoding="iso-8859-1" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
				doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:call-template name="head">
						<xsl:with-param name="title">
							Parcours Master Informatique | Aix-Marseille Universit�
						</xsl:with-param>
					</xsl:call-template>
					<body>
						<div id="layout" class="content pure-g">
							<xsl:call-template name="menu">
								<xsl:with-param name="title">
									Parcours Master Informatique | Aix-Marseille Universit�
								</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="faire-une-liste">
								<xsl:with-param name="objets" select="key('parcours','all')" />
								<xsl:with-param name="nom_fichier" select="'parcours'" />
								<xsl:with-param name="nom_elem" select="'nom_parc'" />
							</xsl:call-template>
							<xsl:call-template name="parcours" />
						</div>
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>

		<xsl:document href="www/ue3crluminy.html" method="xml"
			encoding="iso-8859-1" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Unit�s � 3 cr�dits Masters Informatique | Aix-Marseille
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<div id="layout" class="content pure-g">
						<xsl:call-template name="menu">
							<xsl:with-param name="title">
								Unit�s � 3 cr�dits Masters Informatique | Aix-Marseille
							</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="faire-une-liste">
							<xsl:with-param name="objets"
								select="//ue[nb_credits = '3'][@id = //ref_ue[./ancestor::parcours/lieu_parc[@site = 'Luminy']]]" />
							<xsl:with-param name="nom_fichier" select="'ue'" />
							<xsl:with-param name="nom_elem" select="'nom_ue'" />
						</xsl:call-template>
					</div>
				</body>
			</html>
		</xsl:document>

		<xsl:document href="www/interluminy.html" method="xml"
			encoding="iso-8859-1" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Enseignant Luminy Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<div id="layout" class="content pure-g">
						<xsl:call-template name="menu">
							<xsl:with-param name="title">
								Master Informatique - Luminy
							</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="faire-une-liste">
							<xsl:with-param name="objets"
								select="//ue[nb_credits = '3'][@id = //ref_ue[./ancestor::parcours/lieu_parc[@site = 'Luminy']]]" />
							<xsl:with-param name="nom_fichier" select="'ue'" />
							<xsl:with-param name="nom_elem" select="'nom_ue'" />
						</xsl:call-template>
					</div>
				</body>
			</html>
		</xsl:document>
	</xsl:template>

</xsl:stylesheet>