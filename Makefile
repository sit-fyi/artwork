FRAGMENTS = logo-color logo-white logo-black
FRAGMENTS_PNG = $(patsubst %,%.png,$(FRAGMENTS))
FRAGMENTS_PNG_600 = $(patsubst %,%-600.png,$(FRAGMENTS))
FRAGMENTS_SVG = $(patsubst %,%.svg,$(FRAGMENTS))

all: $(FRAGMENTS_PNG) $(FRAGMENTS_PNG_600) $(FRAGMENTS_SVG) brandbook.png

brandbook.png: Makefile brandbook.svg
	inkscape -z brandbook.svg --export-png=brandbook.png

$(FRAGMENTS_PNG): Makefile brandbook.svg
	inkscape -z brandbook.svg -i $(patsubst %.png,%,$@) --export-png=$@

$(FRAGMENTS_PNG_600): Makefile brandbook.svg
	inkscape -z brandbook.svg -i $(patsubst %-600.png,%,$@) -d 600 --export-png=$@


$(FRAGMENTS_SVG): Makefile brandbook.svg 
	inkscape -z brandbook.svg -i $(patsubst %.svg,%,$@) -j --export-plain-svg=$@
	
clean:
	rm $(FRAGMENTS_PNG) $(FRAGMENTS_SVG) brandbook.png
