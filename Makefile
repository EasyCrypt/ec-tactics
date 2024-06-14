# -*- Makefile -*-

# ------------------------------------------------------------------------
.PHONY: default tactics pages __force__

default: tactics

tactics: tactics.html

pages: tactics __force__
	rm -rf _pages && mkdir _pages _pages/css
	cp tactics.html _pages/index.html
	cp css/styling.css _pages/css

%.html: %.md __force__
	pandoc \
	  --standalone \
	  --css=css/styling.css \
	  --filter filters/easycrypt-filter \
	  --syntax-definition filters/easycrypt.xml \
	  --mathjax \
	  -f markdown+yaml_metadata_block \
	  -t html5 \
	  -o $@ \
	  $<
