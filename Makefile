notes.pdf: notes.md library.bib *.png
	pandoc notes.md --pdf-engine=xelatex --citeproc -o notes.pdf

