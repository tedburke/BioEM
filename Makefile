notes.pdf: notes.md *.png
	pandoc notes.md --pdf-engine=xelatex -o notes.pdf

