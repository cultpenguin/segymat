# Make file for validating/converting segymat.xml
#
#
validate:
	date "+%b %d, %Y" > pubdate.xml	
	xmllint --valid --noout segymat.xml

pdf:
	dblatex segymat.xml

pdf_old:
	make validate
	xsltproc  --output segymat.fo \
	--stringparam fop.extensions 1 \
	file:///usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl segymat.xml
	fop  -fo  segymat.fo  -pdf  segymat.pdf


pdf_ldp:
	fop -xml segymat.xml -xsl /usr/share/xml/docbook/stylesheet/ldp/fo/tldp-print.xsl -pdf segymat_ldp.pdf

rtf:
	docbook2rtf segymat.xml

html:
	make validate
	mkdir -p htmldoc
	mkdir -p htmldoc/figures
	cp figures/*.png htmldoc/figures/.
	cp style.css htmldoc/.
	xsltproc -o htmldoc segymat.xsl segymat.xml
	mv *.html htmldoc/.

upload:
	./updateSF


clean:
	rm -f *.htmldoc
	rm -fr htmldoc
	rm -f *.op
	rm -f *.pdf


all:
	make pdf
	make html

help:
	# USAGE
	# make pdf
	# make html
	# make validate
