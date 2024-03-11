#!/bin/sh

echo "Installing required dependencies..."

sudo apt-get -y update || exit 1
sudo apt-get -y upgrade || exit 1
sudo apt-get -y install texlive texlive-latex-base texlive-latex-extra pandoc &>> deps.log || exit 1

echo "Dependencies installed."

echo "Building..."

latexmk -c
latexmk -pdf emrm.tex
latexmk -pdf emrm_us.tex

echo "Built."
