# $Id$

SOURCE=$2

FILENAME=$(SOURCE)

HOME=/Users/conall


# Apps
M4=m4
M4OPT=$(HOME)/lib/pstricks.m4 $(HOME)/lib/libcct.m4

DPIC=dpic
DPICOPT='-p'

LATEX=latex

DVIPS=dvips
DVIPSOPT='-f'

PS2PDF=ps2pdf


default:


dvi:
	$(LATEX) $(SOURCE)


pdf:
	$(DVIPS) $(DVIPSOPT) $(FILENAME).dvi $(FILENAME).ps &&
	$(PS2PDF) $(FILENAME).ps &&
	echo "$(FILENAME).pdf created"


ps:
	$(DVIPS) -f $(FILENAME).dvi $(FILENAME).ps &&
	echo "$(FILENAME).ps created"

cct:
	$(M4) $(M4OPT) $(SOURCE).m4 > $(SOURCE).pic &&
	$(DPIC) $(DPICOPT) $(SOURCE).pic > $(SOURCE).tex &&
	echo "$(SOURCE) circuit compiled"

allcct:
	for cct in *.m4;
	do
		$(M4) $(M4OPT) $(cct).m4 > $(cct).pic &&
		$(DPIC) $(DPICOPT) $(cct).pic > $(cct).tex &&
		echo "$(cct) circuit compiled"
	end 
	echo "All circuits compiled"

all: allcct dvi ps pdf


clean:
	rm *.aux *.dvi

napalm:
	rm *.aux *.dvi	*.pic
