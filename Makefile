## GENERAL INFOS

OUTPUT = resume.pdf
CLEAN  = '*~' '\#*' '.\#*' '.DS_Store' '*.log' '*.aux' '*.toc' '*.nav' '*.out' '*.snm' '*.vrb' '*.blg' '*.bbl'


## MAIN

all: $(OUTPUT);

clean:
	for f in ${CLEAN} ; do find . -name "$$f" | xargs rm -f ; done
	rm -f ${OUTPUT}


## GENERATION

%.pdf: %.tex
	lualatex -interaction nonstopmode $*.tex
	lualatex -interaction nonstopmode $*.tex
	lualatex -interaction nonstopmode $*.tex


## SPECIALS

.PRECIOUS: %.pdf ;
