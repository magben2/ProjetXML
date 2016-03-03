XSLT = xsltproc
LINT = xmllint --noout


all: clean gen dtd xsd web tidy xq java


gen:
	@echo "\nConstruction du fichier de données XML"
	$(XSLT) donnees-to-xml.xsl donnees-master.xml
	
	
dtd:
	@echo "\nValidation avec la DTD"
	$(LINT) --valid  master-gen.xml


xsd:
	@echo "\nValidation avec le schema"
	$(LINT) --schema  master-schema.xsd master-gen.xml
	

web:
	@echo "\nGénération du dossier www/"
	$(XSLT) xsl/master.xsl master-gen.xml
	cp -r css www/css
	cp -r img www/img
	
	
tidy:
	@echo "\nValidation des fichiers www./*.html"
	tidy -ascii -imqe -asxhtml www/*.html
	@echo "\nValidation de la documentation"
	tidy -ascii -imqe -asxhtml documentation.html


xq:
	@echo "\nCréation de la requête XQuery"
	java -cp outils/saxon9he.jar net.sf.saxon.Query !indent=yes xq.txt > www/xq.html


java:
	@echo "\nCréation du fichier DOM"
	javac javadom/CreateDom.java
	java javadom/CreateDom > www/dom.xml
	@echo "\n"


clean:
	@echo "\nSuppression"
	rm -rf master-gen.xml
	rm -rf www/
	rm -rf javadom/*.class