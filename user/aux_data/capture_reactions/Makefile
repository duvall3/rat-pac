# usage: make clean
#	 make
PROJECT=main
SOURCES=$(*.tex)
TEX=pdflatex
#BIBTEX=bibtex
BUILDTEX=$(TEX) $(PROJECT).tex
RM=/usr/bin/rm

all: $(PROJECT).pdf

$(PROJECT).pdf: $(SOURCES)
#all:
	$(BUILDTEX)
#	$(BIBTEX) $(PROJECT)
	$(BUILDTEX)
	$(BUILDTEX)

clean:
	$(RM) -f *.ps *.dvi *.aux *.log p.ps *backup *~ *.bbl *blg *.pdf *.toc 
	
