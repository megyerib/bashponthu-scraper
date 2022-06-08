#!/usr/bin/env bash

set -eu

cd $(dirname $0)
cat $(ls out/* | sort -V) > all.html

