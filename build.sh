#!/bin/sh
(cd lib/katex && yarn install && USE_TTF=false USE_WOFF=false USE_WOFF2=false yarn build)
rm -r staging 2>/dev/null
rm -r web-ext-artifacts 2>/dev/null
for f in LICENSE \
	manifest.json \
	ext/* \
	lib/highlightjs/build/highlight.min.js \
	lib/highlightjs/build/styles/*.min.css \
	lib/markdown-it/dist/markdown-it.min.js \
	lib/markdown-it-checkbox/dist/markdown-it-checkbox.min.js \
	lib/markdown-it-emoji/dist/markdown-it-emoji.min.js \
	lib/markdown-it-footnote/dist/markdown-it-footnote.min.js \
	lib/markdown-it-fancy-lists/markdown-it-fancy-lists.js \
	lib/markdown-it-texmath/texmath.js \
	lib/markdown-it-texmath/css/texmath.css \
	lib/katex/dist/katex.min.js \
	lib/katex/dist/katex.min.css \
	lib/sss/sss.css \
	lib/sss/print.css \
	lib/sss/github.css
do
	mkdir -p `dirname staging/$f`
	cp $f staging/$f
done

web-ext build -s staging
