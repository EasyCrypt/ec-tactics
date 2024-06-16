# -*- Makefile -*-

# ------------------------------------------------------------------------
.PHONY: default bundle setup-npm install-npm

default: bundle

bundle:
	node_modules/.bin/rollup -c rollup.config.mjs

setup-npm:
	npm i codemirror @codemirror/language @codemirror/state @codemirror/legacy-modes
	npm i rollup @rollup/plugin-node-resolve

install-npm:
	npm install
