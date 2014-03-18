## GENERAL INFOS

OUTPUT    = cv_en.pdf cv_fr.pdf
PDF_CMD   = pdflatex -interaction nonstopmode
BIB_CMD   = bibtex

CLEAN = '*~' '\#*' '.\#*' '.DS_Store' '*.log' '*.aux' '*.toc' '*.nav' '*.out' '*.snm' '*.vrb' '*.blg' '*.bbl'




## MAIN

all: $(OUTPUT);

clean:
	for f in ${CLEAN} ; do find . -name "$$f" | xargs rm -f ; done
	rm -f ${OUTPUT}

distclean: clean ;



## DEPENDENCIES

cv_fr.pdf: common.tex common.bib common.bst
cv_en.pdf: common.tex common.bib common.bst



## GENERATION

%.aux: %.tex
	$(PDF_CMD) $* > /dev/null

%.bbl: %.aux %.bib
	$(BIB_CMD) $* > /dev/null

%.pdf: %.bbl
	$(PDF_CMD) $* > /dev/null
	$(PDF_CMD) $* > /dev/null



## SPECIALS

.PRECIOUS: %.pdf %.aux %.bbl ;
