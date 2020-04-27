.PHONY: all clean submodule-update

all: main.pdf

main.pdf: main.tex
	pdflatex main.tex

clean:
	rm -f main.pdf

submodule-update:
	git submodule update --init --recursive
