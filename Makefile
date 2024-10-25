notes.pdf: notes.md library.bib *.png
	pandoc notes.md --pdf-engine=xelatex --citeproc --bibliography library.bib --csl=ieee.csl -o notes.pdf

