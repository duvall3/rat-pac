#!/bin/bash
# geogen_johns -- generate .geo entries for John's detector from a template


#### TEMPLATE:
#// -------- GEO[]
#{
#name: "GEO",
#index: "",
#valid_begin: [0, 0],
#valid_end: [0, 0],
#mother: "",
#type: "",
#size: [0.0, 0.0, 0.0], // mm
#material: "",
#invisible: 0,
#position: [0.0, 0.0, 0.0] // mm
#}
#
#


## define arrays for nulat_15
#LR=(0    1    2    3    4    5    6    7    8    9   10   11   12   13   14)
#UD=(0    1    2    3    4    5    6    7    8    9   10   11   12   13   14)
#FB=(0    1    2    3    4    5    6    7    8    9   10   11   12   13   14)
#OFFSET=(-357  -306  -255  -204  -153  -102   -51     0    51   102   153   204   255   306   357)


echo; echo


## INIT

# determine configuration
echo "Enter number of rows: " && read ROWS
echo "Enter number of columns: " && read COLS
echo "Enter number of layers: " && read LRS
echo

# determine cell dimensions
echo "Enter cell half-length (mm): " && read L
echo "Enter cell half-width (mm): " && read W
echo "Enter cell half-height (mm): " && read H
echo "Enter cell half-spacing (mm): " && read S

# name output file
echo; echo "Enter project name: " && read PROJ
OUTFILE="$PROJ"_cell-array.geo

# print config
printf "\n\nRows: %i\nColumns: %i\nLayers: %i\n" $ROWS $COLS $LRS
printf "\nCell Half-Length: \t%f mm\nCell Half-Width: \t%f mm\nCell Half-Height: \t%f mm\nCell Half-Spacing: \t%f mm\n" $L $W $H $S


# initialize arrays
LR=()
UD=()
FB=()



for (( k_lr=0; k_lr<$ROWS; k_lr++ )); do

  for (( k_ud=0; k_ud<$COLS; k_ud++ )); do
  
    for (( k_fb=0; k_fb<$LRS; k_fb++ )); do
  
      index_name_lr=target_cell_$k_lr
      index_name_fb="$index_name_lr"_$k_ud
      index_name="$index_name_fb"_$k_fb
      x=${OFFSET[$k_lr]}
      y=${OFFSET[$k_ud]}
      z=${OFFSET[$k_fb]}
      
      echo -e "\
// -------- GEO[$index_name]
{
name: \"GEO\",
index: \"$index_name\",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: \"cell_array\",
type: \"box\",
size: [$L, $W, $H], // mm
material: \"ej254_015li6\",
invisible: 0,
position: [$x.0, $y.0, $z.0] // mm
}\n\n" >> $OUTFILE
      
    done #k_fb
  
  done #k_ud

done #k_lr


printf "\n\nOutput written to %s\n\n" $OUTFILE

# all pau!   )
exit 0
