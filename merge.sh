#!/usr/bin/env bash

set -eu

indir=out/posts
outfile=out/all.html

cd $(dirname $0)
cat $(ls $indir/* | sort -V) > $outfile

