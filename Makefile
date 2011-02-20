
parti = NotesonProjectsPartI
partii = NotesonProjectsPartII
partiii = NotesonProjectsPartIII
main = parti partii partiii
partidependency = NotesonProjectsPartI-Znotation.tex
partiidependency = NotesonProjectsPartII-Znotation.tex
partiiidependency = NotesonProjectsPartIII-Znotation.tex
partifigures = Fig/Src/InvertedPendulum.tikz
partiifigures = 
partiiifigures = 

.PHONY: all show clean parti partii partiii

all: $(parti).pdf $(partii).pdf $(partiii).pdf

parti: $(parti).pdf
	open -a Skim.app $<
	osascript -e 'tell application "Skim" to revert item 1 of (every window whose name contains "'$<'")'

partii: $(partii).pdf
	open -a Skim.app $<
	osascript -e 'tell application "Skim" to revert item 1 of (every window whose name contains "'$<'")'

partiii: $(partiii).pdf
	open -a Skim.app $<
	osascript -e 'tell application "Skim" to revert item 1 of (every window whose name contains "'$<'")'

$(parti).pdf: $(parti).tex $(dependency) $(partifigures)
	pdflatex -shell-escape -file-line-error $(parti); \
	make -f $(parti).makefile -B; \
	makeglossaries $(parti); \
	pdflatex -shell-escape -file-line-error $(parti); \
	makeglossaries $(parti); \
	pdflatex -shell-escape -file-line-error $(parti); \
	pdflatex -shell-escape -file-line-error $(parti)

$(partii).pdf: $(partii).tex $(dependency) $(partiifigures)
	pdflatex -shell-escape -file-line-error $(partii); \
	make -f $(partii).makefile -B; \
	makeglossaries $(partii); \
	pdflatex -shell-escape -file-line-error $(partii); \
	makeglossaries $(partii); \
	pdflatex -shell-escape -file-line-error $(partii); \
	pdflatex -shell-escape -file-line-error $(partii)

$(partiii).pdf: $(partiii).tex $(dependency) $(partiiifigures)
	pdflatex -shell-escape -file-line-error $(partiii); \
	make -f $(partiii).makefile -B; \
	makeglossaries $(partiii); \
	pdflatex -shell-escape -file-line-error $(partiii); \
	makeglossaries $(partiii); \
	pdflatex -shell-escape -file-line-error $(partiii); \
	pdflatex -shell-escape -file-line-error $(partiii)

clean:
	-rm -f *.pdf *.log *.aux *.bbl *.bcf *.blg \
		*.figlist *.glo *.gls *.lof *.lot *.xml *.gz *.toc \
		*.acn *.acr *.alg *.glg *.ilg *.ist