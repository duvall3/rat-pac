#!/bin/bash
# n0_dat_to_sc -- convert a .n0.dat file (w/ scatter info) to a group of text-only tables
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #


FILENAME=$(basename $1 .n0.dat)

for NUM in {1,5,10,20}; do

  PATTERN="$NUM Scatter"
  
  echo "x0 y0 z0 xf yf zf" > "$FILENAME".sc"$NUM"
  
  paste\
  	<(awk '$0 ~ /Begin/ {print $2"\t"$3"\t"$4}' $1) \
  	<(awk -v pat="$PATTERN" '$0 ~ pat {print $3"\t"$4"\t"$5}' $1) \
  | column -t >> "$FILENAME".sc"$NUM"

done

mkdir scatters
mv -t scatters ./*.sc*

exit 0
