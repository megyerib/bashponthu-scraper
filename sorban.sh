#!/usr/bin/env bash

set -eu

indir=out/posts
outfile=out/sorban.html

cd $(dirname $0)
cat $(ls $indir/* | sort -V) | ./htmlgen.sh > $outfile

