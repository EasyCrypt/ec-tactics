# -*- Makefile -*-

# ------------------------------------------------------------------------
.PHONY: default tactics pages __force__

default: tactics

tactics: tactics.html

pages: tactics __force__
	rm -rf _pages && mkdir _pages
	cp tactics.html _pages/index.html
	mkdir _pages/css
	cp css/styling.css css/main.css _pages/css
	mkdir _pages/replay
	cp replay/replay.bundle.js _pages/replay

%.html: %.md __force__
	pandoc \
	  --standalone \
	  --css=css/main.css \
	  --filter filters/easycrypt-filter \
	  --mathjax \
	  -f markdown+yaml_metadata_block \
	  -t html5 \
	  -o $@ \
	  $<
