# -*- Makefile -*-

# ------------------------------------------------------------------------
.PHONY: default __force__

default: tactics.html

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
