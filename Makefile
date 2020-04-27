PDFLATEX = pdflatex -synctex=-1

DATE = "$(shell date +'%Y-%m-%d--%H-%M')"

NAME = main

all: $(NAME).tex
	rm -f $(NAME).log
	$(MAKE) once
	-$(PDFLATEX) -halt-on-error $<
	-$(PDFLATEX) -halt-on-error $<

once:  $(NAME).tex
	$(PDFLATEX) -halt-on-error $<
	-bibtex $(NAME)
	cat $(NAME).pdf > temp.pdf

submodule-update:
	git submodule update --init --recursive

clean:
	@ rm -rf temp *.aux *.log $(NAME).pdf temp.pdf 
	@ rm -rf *~ *.log *.out *.bbl *.blg *.brf *.synctex* *.toc
	@ rm -rf comment.cut

.PHONY : all once clean submodule-update
