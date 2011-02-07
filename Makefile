
main = NotesonProjectsPartI
dependency = NotesonProjectsPartI-Znotation.tex
figures = Fig/Src/InvertedPendulum.tikz

.PHONY: show clean

show: $(main).pdf
	open -a Skim.app $<
	osascript -e 'tell application "Skim" to revert item 1 of (every window whose name contains "'$<'")'

$(main).pdf: $(main).tex $(dependency) $(figures)
	pdflatex -shell-escape -file-line-error $(main); \
	make -f $(main).makefile -B; \
	makeglossaries $(main); \
	pdflatex -shell-escape -file-line-error $(main); \
	makeglossaries $(main); \
	pdflatex -shell-escape -file-line-error $(main); \
	pdflatex -shell-escape -file-line-error $(main)

clean:
	-rm -f *.pdf *.log *.aux *.bbl *.bcf *.blg \
		*.figlist *.glo *.gls *.lof *.lot *.xml *.gz *.toc \
		*.acn *.acr *.alg *.glg *.ilg *.ist