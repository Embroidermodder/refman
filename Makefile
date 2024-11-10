TEX = pdflatex -interaction=nonstopmode -file-line-error
BIB = bibtex
IND = makeindex

default: emrm.pdf

all: emrm.pdf emrm_us.pdf

github: deps tables all

deps:
	bash bin/deps.sh

tables:
	python3 bin/thread_tables.py

%.pdf: %.tex
	$(TEX) $<
	$(IND) $(subst .tex,.aux,$<)
	$(BIB) $(subst .tex,.aux,$<)
	$(TEX) $<
	$(TEX) $<

clean:
	rm -f *.aux *.dvi *.log *.bbl *.blg
	rm -f *.ilg *.ind *.idx *.log *.toc *.out
	rm -f tables/*.aux

maintainer-clean: clean
	rm -f *.pdf

.PHONY: all clean deps

