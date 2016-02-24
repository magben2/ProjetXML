XSLT = xsltproc
LINT = xmllint --noout


all: clean gen dtd xsd web xq tidy java


gen: ue.xsl ue.xml
	@echo "\nConstruction du fichier de données XML"
	$(XSLT) ue.xsl ue.xml
				
					
dtd: ue.xml ue.dtd
	@echo "\nValidation de la DTD"
	$(LINT) --valid ue.xml


xsd: ue.xml ue.xsd
	@echo "\nValidation du schema"
	$(LINT) --schema ue.xsd ue.xml
				

web: ue.xml ue.xsl
	@echo "\nGénération du dossier www/"
	$(XSLT) ue.xsl ue.xml
				
					
tidy:
	@echo "\nValidation des fichiers www./*.html"
	tidy -ascii -imqe -asxhtml www/*.html
	@echo "\nValidation de la documentation"
	tidy -ascii -imqe -asxhtml documentation.html


xq:
	@echo "\nCréation de la requête XQuery"
	java -cp Outils/saxon9he.jar net.sf.saxon.Query !indent=yes xq.txt > www/xq.html


java:
	@echo "\nCréation du fichier DOM"
	javac CreateDom.java
	java CreateDom > dom.txt
	@echo "\n"


clean:
	@echo "\nSuppression"
	rm -rf master-gen.xml
	rm -rf www/
	rm -rf dom.txt
	rm -rf *.class
