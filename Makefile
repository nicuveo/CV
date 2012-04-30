## GENERAL INFOS

IMG_DIR = ./img/
LIB_DIR = ./lib/

CLEAN = '*~' '\#*' '.\#*' '.DS_Store' '*.log' '*.aux' '*.toc'


## VARS

OUTPUT = cv_en cv_fr
FLAGS  = -q -c -I $(IMG_DIR) -I $(LIB_DIR)



## MAIN

all: $(OUTPUT);

clean:
	for f in ${CLEAN} ; do find . -name "$$f" | xargs rm -f ; done

distclean: clean
	rm -f *.pdf



## DEPENDENCIES

cv_fr.pdf: cv_fr.tex cv_fr.bib common.tex common.bib common.bst
cv_en.pdf: cv_en.tex cv_en.bib common.tex common.bib common.bst



## GENERATION

%.pdf: %.tex
	texi2pdf $(FLAGS) $*.tex

%.pdf:
	@echo "Unable to find $*.tex, aborting."
	@exit 2

%: %.pdf ;



## SPECIALS

.PRECIOUS: %.pdf ;
