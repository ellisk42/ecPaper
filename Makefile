THIS_FILE := $(lastword $(MAKEFILE_LIST))

TEX := pdflatex -shell-escape -interaction=nonstopmode -file-line-error

PRE := $(wildcard ./*.tex)
OBJ := $(PRE:%.tex=%.pdf)

all: $(OBJ)

%.pdf: %.tex
	-$(TEX) $^
	# all our tex files use bibtex
	-bibtex $(^:.tex=)
	-$(TEX) $^
	-$(TEX) $^

clean:
	$(RM) *.aux *.log *.out *.bbl *.blg

cleanall: clean
	$(RM) $(OBJ)
