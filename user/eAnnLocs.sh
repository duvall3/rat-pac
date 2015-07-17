#!/bin/bash
# eAnnLocs -- parse track output to get e+ annihilation locations

#cat $1 | tr ',' ' ' | gawk '$0 ~ /nCapture/ {print $2" "$3" "$4}' | tr -d "(" | tr -d ")"
#cat $1 | tr ',' ' ' | tr -d "()" | gawk '$0 ~ /annihil/ {print $2" "$3" "$4}'
cat $1 | awkprep.sh | gawk '$0 ~ /annihil/ {print $2" "$3" "$4}'
