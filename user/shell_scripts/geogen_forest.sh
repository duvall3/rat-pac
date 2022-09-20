#!/bin/bash
# geogen_forest -- generate a segmented, rectangular-lattice detector .geo file
# -- this script expects to be run in a directory such as $RATROOT/data/foo-experiment,
#      which is expected to contain a base geometry file (i.e., without cell array)
#      called "foo-experiment_base.geo"
# -- for an example, see https://github.com/duvall3/rat-pac/blob/comparison/data/forest/forest_base.geo
#
# USAGE: geogen_forest.sh [reset]
#
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ Updated 6/22 ~ #


##Copyright (C) 2022 Mark J. Duvall
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <http://www.gnu.org/licenses/>.


## init

# check / create filenames
PROJ=$(basename $PWD)
BASEFILE="$PROJ"_base.geo
ARRFILE="$PROJ"_cell-array.geo
OUTFILE="$PROJ".geo
LOGFILE=geogen_"$PROJ".log

# reset command
if [[ $1 = "reset" ]]; then
  if [[ -f $BASEFILE ]]; then
    echo "Resetting experiment to base; clearing detector..."
      if [[ -f $ARRFILE ]]; then /usr/bin/rm $ARRFILE; fi
      if [[ -f $OUTFILE ]]; then /usr/bin/rm $OUTFILE; fi
#     if [[ -f $OUTFILE"~" ]]; then rm $OUTFILE"~"; fi
    echo "Detector geometry cleared." && exit 0
  else
    echo "ERROR: Base file is missing; cannot reset to base geometry." && exit 15
  fi
fi

# don't overwrite
if [ -e $ARRFILE ]; then
  echo "ERROR: $ARRFILE already exists; please remove if you are certain you want to define a new experiment geometry." && exit 11
fi
if [ -e $OUTFILE ]; then
  echo "ERROR: $OUTFILE already exists; please remove if you are certain you want to define a new experiment geometry." && exit 12
fi

# check for bc
echo -e "\n\nChecking for bc..."
if [ $(which bc) ]; then
  echo "Success: bc found in $(which bc)"
else
  echo -e "ERROR: Program 'bc' is needed to run this script.\n\n" && exit 10
fi


printf "\n\n"
  

## template

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


## configure geometry

# determine configuration
echo "Enter number of rows: " && read ROWS
echo "Enter number of columns: " && read COLS
# # echo "Enter number of layers: " && read LYRS
LYRS=1 # forest is a 2D array
echo

# determine dimensions
echo "Enter inner radius of container tube (mm): " && read RS
echo "Enter outer radius of container tube (mm): " && read RG
echo "Enter half-height of container tube (mm): " && read H
echo "Enter spacing between tube centers (mm) (default: 3 * r_tube_outer): " && read S
S=${S:-$(echo "3*$RG" | bc -l)}
echo

# DEBUG
# ROWS=5
# COLS=4
# RG=30
# RS=25
# H=50
# S=$((3*RG))

# prompt for materials
echo "Enter material for target cells (default: ej254_015li6 -- PVT @ 1.5%wt. Li-6): " && read TARGET_CELL_MATERIAL
echo "Enter material for array / matrix (default: air): " && read ARRAY_MATERIAL
echo "Enter material for tubes (default: glass): " && read TUBE_MATERIAL
# defaults
TARGET_CELL_MATERIAL=${TARGET_CELL_MATERIAL:-"ej254_015li6"}
ARRAY_MATERIAL=${ARRAY_MATERIAL:-"air"}
TUBE_MATERIAL=${TUBE_MATERIAL:-"glass"}

# # extend tube 1mm past scintillator
# RG=$( printf "%f" $RG+1 )

# force float format for RAT-PAC
RG=$( printf "%f" $RG )
RS=$( printf "%f" $RS )
H=$( printf "%f" $H )
S=$( printf "%f" $S )

# calculate dimensions
# individual tube-replica entry, aka 'row' (replication is along 'x')
row_length=$(echo "($COLS*$S + 2*$RG) / 2.0 * 1.005" | bc -l)
row_width=$(echo "$RG * 1.005" | bc -l)
row_height=$(echo "$H * 1.005" | bc -l)
# array half-sizes
array_length=$(echo "($row_length + $S/2) * 1.01" | bc -l) # offset adjustment
array_width=$(echo "($ROWS*$S*sqrt(3)/2 + 2*$RG) / 2 * 1.01" | bc -l)
array_height=$(echo "$row_height * 1.01" | bc -l)
# array full-sizes
array_Flength=$(echo "$array_length*2.0" | bc -l)
array_Fwidth=$(echo "$array_width*2.0" | bc -l)
array_Fheight=$(echo "$array_height*2.0" | bc -l)

# print config
printf "\n\nGeometry Summary:\n" | tee $LOGFILE
printf "\nRows: %i\nColumns: %i\nTotal: %i\n" $ROWS $COLS $((ROWS*COLS)) | tee -a $LOGFILE
# printf "\nR_glass_outer = %f\tR_scintillator = %f\tH = %f\tSpacing = %f\n" $RG $RS $H $S | tee -a $LOGFILE
printf "\nR_tube_inner = %f\tR_tube_outer = %f\tH = %f\tSpacing = %f\n" $RG $RS $H $S | tee -a $LOGFILE
printf "\nArray Length = %f\tArray Width = %f\tArray Height = %f\n" $array_Flength $array_Fwidth $array_Fheight | tee -a $LOGFILE
printf "\nMaterials:\n\tTarget:\t\t\t%s\n\tTube:\t\t\t%s\n\tInter-segment Medium:\t%s\n" $TARGET_CELL_MATERIAL $TUBE_MATERIAL $ARRAY_MATERIAL | tee -a $LOGFILE

# write array
echo -e "\
// -------- GEO[target_cell_array]
{
name: \"GEO\",
index: \"target_cell_array\",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: \"cave\",
type: \"box\",
size: [$array_length, $array_width, $array_height], // mm
material: \"$ARRAY_MATERIAL\",
invisible: 0,
position: [0.0, 0.0, 0.0], // mm
color: [0.8 0.8 0.1],
}\n\n" >> $ARRFILE


## MAIN

# generate cells
echo -e "\nGenerating cells..." | tee -a $LOGFILE

# array start
x_offset=$(echo "-$S*($COLS-1)/2.0" | bc -l)
y=$(echo "-(sqrt(3)/2)*$S*($ROWS-1)/2" | bc -l)

for (( k_row=0; k_row<$ROWS; k_row++ )); do

  for (( k_col=0; k_col<$COLS; k_col++ )); do

    # row coordinates
    # x=$(echo "($k_row % 2) * ($S*0.5) - ($S*0.25) + $S*$k_col + $x_offset" | bc -l)
    x_no_shift=$(echo "$S*$k_col - ($S*0.25) + $x_offset" | bc -l)
    x_shifted=$(echo "$x_no_shift + $(($k_row % 2)) * ($S*0.5)" | bc -l)
    # x=$(printf "%f" $x) # force float format
    x=$(printf "%f" $x_shifted) # force float format
    # echo -e "$x\t$y" #debug

#     # print row array
#     row_name=target_row_inner_$k_row
#     echo -e "\
# // -------- GEO[$row_name]
# {
# name: \"GEO\",
# index: \"$row_name\",
# valid_begin: [0, 0],
# valid_end: [0, 0],
# mother: \"target_cell_array\",
# type: \"box\",
# size: [$row_length, $row_width, $row_height],
# position: [$x, $y, 0.0],
# material: \"$TARGET_CELL_MATERIAL\",
# invisible: 0,
# color: [0.3 0.8 0.3],
# }\n\n" >> $ARRFILE

    # print glass tubes
    index_name=target_tube_$k_row
    index_name="$index_name"_$k_col
    echo -e "\
// -------- GEO[$index_name]
{
name: \"GEO\",
index: \"$index_name\",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: \"$row_name\",
mother: \"target_cell_array\",
type: \"tube\",
r_max: $RG,
size_z: $H,
position: [$x, $y, 0.0],
material: \"$TARGET_CELL_MATERIAL\",
invisible: 0,
color: [0.6 0.6 0.8],
}\n\n" >> $ARRFILE

    # print scintillator cells
    index_name=target_cell_$k_row
    index_name="$index_name"_$k_col
    echo -e "\
// -------- GEO[$index_name]
{
name: \"GEO\",
index: \"$index_name\",
valid_begin: [0, 0],
valid_end: [0, 0],
//mother: \"$row_name\",
mother: \"target_cell_array\",
type: \"tube\",
r_max: $RS,
size_z: $H,
position: [$x, $y, 0.0],
material: \"$TARGET_CELL_MATERIAL\",
invisible: 0,
color: [0.5 0.1 0.8],
}\n\n" >> $ARRFILE

  done #k_col

  y=$(echo "$y+($S*sqrt(3)/2)" | bc -l)

done #k_row

echo "Done." | tee -a $LOGFILE
printf "Array written to: %s\n" $ARRFILE | tee -a $LOGFILE


## finalize by combining base .geo file with array .geo file
cat $BASEFILE $ARRFILE > $OUTFILE
printf "\nRAT-PAC .GEO FILE WRITTEN TO: %s\n\n\n" $OUTFILE | tee -a $LOGFILE


## all pau!   )
exit 0
