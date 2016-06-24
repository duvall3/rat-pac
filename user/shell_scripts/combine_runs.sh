#!/bin/bash
# combine_runs -- script to combine .txt data files into a single file
# -- usage: combine_runs.sh <FILES> > OUTPUTFILE
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ June 2016 ~ #

awk -f combine_runs.awk $@ | column -t

# all pau!
