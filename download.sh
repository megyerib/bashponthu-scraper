#!/usr/bin/env bash

set -eux

outdir=out/raw

cd $(dirname $0)
mkdir -p $outdir

last_page=$(curl -s http://bash.hu/all | grep -oE "\/all\?lap=[0-9]+" | sort -V | tail -1 | grep -oE "[0-9]+")

for i in $(seq 1 $last_page); do
	wget -O $outdir/$i.html http://bash.hu/all?lap=$i
done 

