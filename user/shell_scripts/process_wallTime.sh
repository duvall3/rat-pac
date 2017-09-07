#!/bin/bash
# process_wallTime -- see doc in $RATROOT/user/root_macros/SimpleEnergyDAQ2.cxx
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 8/17 ~ #

BASENAME=$(basename $(ls -tr1 ./*.tee | head -1) .tee)
INFILE="$BASENAME".tee
OUTFILE="$BASENAME".rt
awk '$1 ~ /EVENT/ {print $2"\t"$4"\t"$6"\t"$8"\t"$10}' $INFILE > $OUTFILE
exit 0 # all pau!
