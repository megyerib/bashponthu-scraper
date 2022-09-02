#!/usr/bin/env bash

set -eu

indir=out/posts
outfile=out/all_posts.html

cd $(dirname $0)
cat $(ls $indir/* | sort -V) | sed "s|\*|\&ast;|" | ./htmlgen.sh > $outfile

