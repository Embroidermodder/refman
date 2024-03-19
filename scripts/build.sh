#!/bin/bash

python3 scripts/thread_tables.py || exit 1

pdflatex emrm.tex || exit 1
makeindex emrm || exit 1
bibtex emrm.aux || exit 1
pdflatex emrm.tex || exit 1
pdflatex emrm.tex || exit 1
pdflatex emrm.tex || exit 1
