#!/usr/bin/env bash

set -eu

indir=out/posts
outfile=out/top.html

cd $(dirname $0)
cat $(ls $indir/* | sort -V) \
	| grep '<div class="qline">' \
	| grep -oE "[0-9]+ -&gt; \(-?[0-9]+\)" \
	| sed -E "s|([0-9]+) -&gt; \((-?[0-9]+)\)|\2 \1|" \
	| sort -rg \
	| sed -E "s|-?[0-9]+ ([0-9]+)|$indir/\1.html|" \
	| xargs -i cat {} \
	| ./htmlgen.sh \
	> $outfile

