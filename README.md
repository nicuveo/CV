## CV

This is a small \LaTeX{} project that is used to make a nice and clean CV.
I first got this template from Didier Verna (http://www.didierverna.com/),
but I modified it heavily ever since.

Furthermore, you can have my CV by just building this project. :)



## Build

`make`



## How to make your own

All common code is made inside common* files.
Translations and language-specific data is in cv_* files.

- *common.tex* describes the structure of the CV.
- *common.bst* describes how the content is displayed.
- *cv_$LANG.bib* contains the content of the CV.



## Dark magic

Most of the formatting choices were the result of "shotgun approximation" with
magic constants. If you're a LaTeX guru and spot horrible mistakes, feel free
to send me a quick email. :)
