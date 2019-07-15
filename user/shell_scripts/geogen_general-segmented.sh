#!/bin/bash
# geogen_general-segmented -- generate a segmented, rectangular-lattice detector .geo file
# -- this script expects to be run in a directory such as $RATROOT/data/foo-experiment,
#      which is expected to contain a base geometry file (i.e., without cell array)
#      called "foo-experiment_base.geo"
# -- for an example, see https://github.com/duvall3/rat-pac/blob/comparison/data/general-segmented/general-segmented.geo



## check / create filenames
PROJ=$(pwd | sed s_/_\ _g | awk '{print $NF}')
BASEFILE="$PROJ"_base.geo
ARRFILE="$PROJ"_cell-array.geo
OUTFILE="$PROJ".geo
# don't overwrite
if [ -e $ARRFILE ]; then
  echo "ERROR: $ARRFILE already exists; please remove if you are certain you want to define a new experiment geometry." && exit 11
fi
if [ -e $OUTFILE ]; then
  echo "ERROR: $OUTFILE already exists; please remove if you are certain you want to define a new experiment geometry." && exit 12
fi


## check for bc
echo -e "\n\nChecking for bc..."
if [ $(which bc) ]; then
  echo "Success: bc found in $(which bc)"
else
# echo "WARNING: bc not found; calculations will be performed by BASH and all non-integers will lose their decimal part."
  echo -e "ERROR: Program 'bc' is needed to run this script.\n\n" && exit 10
fi

printf "\n\n"
  

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


## INIT

# determine configuration
echo "Enter number of rows: " && read ROWS
echo "Enter number of columns: " && read COLS
echo "Enter number of layers: " && read LYRS
echo

# determine cell dimensions
echo "Enter cell half-length (mm): " && read L
echo "Enter cell half-width (mm): " && read W
echo "Enter cell half-height (mm): " && read H
echo "Enter cell half-spacing (mm): " && read S

## force float format for RAT-PAC
L=$( echo "$L*1.0" | bc -l )
W=$( echo "$W*1.0" | bc -l )
H=$( echo "$H*1.0" | bc -l )
S=$( echo "$S*1.0" | bc -l )


# print config
printf "\n\nRows: %i\nColumns: %i\nLayers: %i\n" $ROWS $COLS $LYRS
printf "\nCell Length: \t%f mm\nCell Width: \t%f mm\nCell Height: \t%f mm\nCell Spacing: \t%f mm\n" $L $W $H $S


## create cell array
# calculate total size
ca_length=$(echo "$ROWS*($L+$S)*1.0" | bc -l)
ca_width=$(echo "$COLS*($W+$S)*1.0" | bc -l)
ca_height=$(echo "$LYRS*($H+$S)*1.0" | bc -l)
# write result
echo -e "\
// -------- GEO[cell_array]
{
name: \"GEO\",
index: \"cell_array\",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: \"world\",
type: \"box\",
size: [$ca_length, $ca_width, $ca_height], // mm
material: \"air\",
invisible: 0,
position: [0.0, 0.0, 0.0] // mm
}\n\n" >> $ARRFILE


## generate cells

for (( k_lr=0; k_lr<$ROWS; k_lr++ )); do

  for (( k_ud=0; k_ud<$COLS; k_ud++ )); do
  
    for (( k_fb=0; k_fb<$LYRS; k_fb++ )); do
  
      # cell names
      index_name_lr=target_cell_$k_lr
      index_name_fb="$index_name_lr"_$k_ud
      index_name="$index_name_fb"_$k_fb

      # cell coordinates
      x=$( echo "2.0*($L+$S)*$k_lr - ($L+$S)*($ROWS-1)" | bc -l )
      y=$( echo "2.0*($W+$S)*$k_ud - ($W+$S)*($COLS-1)" | bc -l )
      z=$( echo "2.0*($H+$S)*$k_fb - ($H+$S)*($LYRS-1)" | bc -l )
      # fix float format just for zero values
      if [ $x = 0 ]; then x="0.0"; fi
      if [ $y = 0 ]; then y="0.0"; fi
      if [ $z = 0 ]; then z="0.0"; fi

      # print results for this cell  
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
material: \"ej254_001li6\",
invisible: 0,
position: [$x, $y, $z] // mm
}\n\n" >> $ARRFILE
      
    done #k_fb
  
  done #k_ud

done #k_lr

printf "\nArray written to %s\n\n" $ARRFILE


## finalize by combining base .geo file with array .geo file
cat $BASEFILE $ARRFILE > $OUTFILE
printf "\n\nRESULT WRITTEN TO: %s\n\n\n\n" $OUTFILE


## all pau!   )
exit 0
