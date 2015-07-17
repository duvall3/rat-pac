#!/bin/bash
# nCapLocs -- parse track output to get n0 capture locations

cat $1 | awkprep.sh | gawk '$0 ~ /nCapture/ {print $1}' | tr -d '.'
