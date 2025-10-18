book.pdf: book.md library.bib figures/*
	pandoc book.md --pdf-engine=xelatex --citeproc -o book.pdf

