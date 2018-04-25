# SOURCES=Hannes_M.jpg HM_style.css bib_1.jpg bib_2.jpg pdf_1.jpg pdf_2.jpg talk_1.jpg talk_2.jpg doi_1.jpg doi_2.jpg moser.jpg index.html $(shell ls *.pdf) $(shell ls *.bib)
# Mos05a.pdf DFG_SPP_1126_Jahreskolloquium_2006_presentation_moser.pdf regular-subgraphs-ACID06.pdf
# DESTSERVER=webmaster@hmoser.info
# DESTDIR=/var/www/html/publications

# public: index.html
#	rsync --progress $(SOURCES) $(DESTSERVER):$(DESTDIR)
#	ssh $(DESTSERVER) "(cd $(DESTDIR) && chmod a+r $(SOURCES))"

index.html: clean 
	(cd autohp; ./autohp.sh) | tidy -i > $@; if [ $$? == 1 ]; then exit 0; fi

clean:
	rm -f index.html
