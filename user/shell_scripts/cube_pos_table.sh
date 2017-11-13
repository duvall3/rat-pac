#!/bin/bash
# cube_pos_table -- extract positions of target cubes from nulat .geo file into ASCII table
#   -- FORMAT: target_cube_ROW_COLUMN_SLICE @ position X,Y,Z --> R C S X Y Z
#   -- intended for import into ROOT via: TTree*->ReadFile("$FILENAME.root", "row/I:column/I:slice/I:x/D:y/D:z/D");
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2017 ~ #

INFILE=nulat_15.geo
OUTFILE=nulat_15-cube_pos_table.txt

cat $INFILE \
  | awk -v RS='--------' -F '\n' '$1 ~ /target/ {print $0}' \
  | awk '$1 ~ /index/ {printf $2"\t"}; $1 ~ /position/ {print $2 "\t" $3 "\t" $4}' \
  | tr -d \",[] \
  | tr "_" " " \
  | awk '$1=""; $2=""; {print $0}' \
  | column -t \
  > $OUTFILE

# all pau!   )
exit 0
