#!/bin/bash
# geogen_spacecube -- generate a *spacecubeed* segmented, rectangular-lattice detector .geo file
#
# -- this script expects to be run in a directory such as $RATROOT/data/foo-experiment,
#      which is expected to contain a base geometry file (i.e., without cube array)
#      called "foo-experiment_base.geo"
#
# -- for an example base file, see:
#      https://github.com/duvall3/rat-pac/blob/comparison/data/general-segmented/general-segmented_base.geo
#
# USAGES: geogen_general-segmented.sh [INERT_CUBE_VISIBLE]
#         geogen_general-segmented.sh <COMMAND>
#           where:
#           INERT_CUBE_VISIBLE = true | false
#           COMMAND = reset | inert_vis_on | inert_vis_off
#
# -- the optional Boolean argument INERT_CUBE_VISIBLE determines the default visibility
#      of the inert cubes during geometry generation
#    -- if omitted, defaults to "true"
#    -- reminder: in BASH, 0 is "true" and nonzero is "false"
#
# -- the "reset" command will clear the cube array and the main .geo file,
#      leaving only the "_base.geo" file, in preparation for generating a new detector
#  *!!!* WARNING: THIS DELETES THE DETECTOR GEOMETRY *!!!*
#
# -- the "inert_vis" commands modify the main .geo file (after generation)
#      to set the inert-cube visibility on or of


##Copyright (C) 2021 Mark J. Duvall
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

# prepare $CMD
if [[ $1 ]]; then
  CMD=$(echo $1 | tr [:upper:] [:lower:])
fi

# check / create filenames
PROJ=$(pwd | sed s_/_\ _g | awk '{print $NF}')
BASEFILE="$PROJ"_base.geo
ARRFILE="$PROJ"_cube-array.geo
OUTFILE="$PROJ".geo

# reset command
if [[ $CMD = "reset" ]]; then
  if [[ -f $BASEFILE ]]; then
    echo "Resetting experiment to base; clearing detector..."
      if [[ -f $ARRFILE ]]; then /usr/bin/rm $ARRFILE; fi
      if [[ -f $OUTFILE ]]; then /usr/bin/rm $OUTFILE; fi
    echo "Detector geometry cleared." && exit 0
  else
    echo "ERROR: Base file is missing; cannot reset to base geometry." && exit 15
  fi
fi

## inert-visibility switching commands
#if [[ $CMD = "inert_vis_on" ]]; then
#  echo "Setting inert-cube visibility on..."
#  cp $OUTFILE "$OUTFILE"_tmp
#  cat "$OUTFILE"_tmp | sed s/'invisible: 1, \/\/ inert cube'/'invisible: 0, \/\/ inert cube'/ > $OUTFILE
#  /usr/bin/rm "$OUTFILE"_tmp
#  echo "Done." && exit 0
#elif [[ $CMD = "inert_vis_off" ]]; then
#  echo "Setting inert-cube visibility off..."
#  cp $OUTFILE "$OUTFILE"_tmp
#  cat "$OUTFILE"_tmp | sed s/'invisible: 0, \/\/ inert cube'/'invisible: 1, \/\/ inert cube'/ > $OUTFILE
#  /usr/bin/rm "$OUTFILE"_tmp
#  echo "Done." && exit 0
#fi

## inert alpha setting
#if [[ $CMD = "inert_alpha" ]]; then
#  INERT_ALPHA=${2:-1.0}
#  echo "Setting inert alpha to $INERT_ALPHA..."
#  cp $OUTFILE "$OUTFILE"_tmp
#  cat "$OUTFILE"_tmp | awk -v A=$INERT_ALPHA '$0 ~ /^color:.*inert/ {$5=A"],"}; {print}' > $OUTFILE
#  /usr/bin/rm "$OUTFILE"_tmp
#  echo "Done." && exit 0
#fi

## inert cube visibility during generation
#if [[ $CMD ]]; then
#  INERT_CUBE_VISIBLE=$CMD
#else
#  INERT_CUBE_VISIBLE=true
#fi
#if $INERT_CUBE_VISIBLE; then
#  INERT_CUBE_INVISIBLE="0"
#else
#  INERT_CUBE_INVISIBLE="1"
#fi

# don't overwrite
if [ -e $ARRFILE ]; then
  echo "ERROR: $ARRFILE already exists; please remove if you are certain you want to define a new experiment geometry." && exit 11
fi
if [ -e $OUTFILE ]; then
  echo "ERROR: $OUTFILE already exists; please remove if you are certain you want to define a new experiment geometry." && exit 12
fi

# proceed
echo -e "\n### Starting spacecube geometry generator ###\n"

# check for bc
echo "Checking for bc..."
if [ $(which bc) ]; then
  echo -e "Success: bc found in $(which bc)\n"
else
  echo -e "ERROR: Program 'bc' is needed to run this script.\n\n"
  exit 10
fi

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

# prompt for configuration
echo "Enter number of rows: " && read ROWS
echo "Enter number of columns: " && read COLS
echo "Enter number of layers: " && read LYRS
echo

# prompt for cube dimensions
echo "Enter cube half-length (mm): " && read L
echo "Enter cube half-width (mm): " && read W
echo "Enter cube half-height (mm): " && read H
echo "Enter cube half-spacing (mm): " && read S
echo

# prompt for materials
echo "Enter material for active cubes (default: ej254_015li6 -- PVT @ 1.5%wt. Li-6): " && read ACTIVE_CUBE_MATERIAL
echo "Enter material for inactive cubes (default: glass -- SiO2): " && read ACTIVE_CUBE_MATERIAL
echo
# defaults
if [[ -z $ACTIVE_CUBE_MATERIAL ]]; then ACTIVE_CUBE_MATERIAL="ej254_015li6"; fi
if [[ -z $INERT_CUBE_MATERIAL ]]; then INERT_CUBE_MATERIAL="glass"; fi

# force float format for RAT-PAC
L=$( echo "$L*1.0" | bc -l )
W=$( echo "$W*1.0" | bc -l )
H=$( echo "$H*1.0" | bc -l )
S=$( echo "$S*1.0" | bc -l )

# double cube half-dimensions for summary
FL=$( echo "$L*2.0" | bc -l )
FW=$( echo "$W*2.0" | bc -l )
FH=$( echo "$H*2.0" | bc -l )
FS=$( echo "$S*2.0" | bc -l )

# print config
printf "\n\nRows: %i\nColumns: %i\nLayers: %i\n" $ROWS $COLS $LYRS
printf "\ncube Length: \t%f mm\ncube Width: \t%f mm\ncube Height: \t%f mm\ncube Spacing: \t%f mm\n" $FL $FW $FH $FS


## create cube array
# calculate total size
ca_length=$(echo "$ROWS*($L+$S)*1.0" | bc -l)
ca_width=$(echo "$COLS*($W+$S)*1.0" | bc -l)
ca_height=$(echo "$LYRS*($H+$S)*1.0" | bc -l)
# write result
echo -e "\
// -------- GEO[target_cube_array]
{
name: \"GEO\",
index: \"target_cube_array\",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: \"cave\",
type: \"box\",
size: [$ca_length, $ca_width, $ca_height], // mm
//material: \"air\",
material: \"glass\",
invisible: 0,
color: [0.8, 0.8, 0.8, 0.2],
position: [0.0, 0.0, 0.0] // mm
}\n\n" >> $ARRFILE


## MAIN

# generate cubes

echo -e "\nGenerating cubes..."

for (( k_lr=0; k_lr<$ROWS; k_lr++ )); do

  for (( k_ud=0; k_ud<$COLS; k_ud++ )); do
  
    for (( k_fb=0; k_fb<$LYRS; k_fb++ )); do
  
      # cube names
      index_name_lr=target_cube_$k_lr
      index_name_fb="$index_name_lr"_$k_ud
      index_name="$index_name_fb"_$k_fb

      # cube coordinates
      x=$( echo "2.0*($L+$S)*$k_lr - ($L+$S)*($ROWS-1)" | bc -l )
      y=$( echo "2.0*($W+$S)*$k_ud - ($W+$S)*($COLS-1)" | bc -l )
      z=$( echo "2.0*($H+$S)*$k_fb - ($H+$S)*($LYRS-1)" | bc -l )
      # fix float format just for zero values
      if [ $x = 0 ]; then x="0.0"; fi
      if [ $y = 0 ]; then y="0.0"; fi
      if [ $z = 0 ]; then z="0.0"; fi

      # spacecubeing test
      ROW_EVEN=$((k_lr % 2))
      COL_EVEN=$((k_ud % 2))
      LYR_EVEN=$((k_fb % 2))
      if [[ ($ROW_EVEN -eq 0) && ($COL_EVEN -eq 0) && ($LYR_EVEN -eq 0) ]]; then
        # ACTIVE CUBE
        MATERIAL=$ACTIVE_CUBE_MATERIAL
	COLOR_LINE="color: [0.0, 1.0, 1.0, 1.0], // active cube"
	INVISIBLE_LINE="invisible: 0, // active cube"
#     else
#       # INERT CUBE
#       MATERIAL=$INERT_CUBE_MATERIAL
#       COLOR_LINE="color: [0.9, 0.9, 0.9, 1.0], // inert cube"
#       INVISIBLE_LINE="invisible: $INERT_CUBE_INVISIBLE, // inert cube"
#     fi

	# print results for this cube  
	echo -e "\
// -------- GEO[$index_name]
{
name: \"GEO\",
index: \"$index_name\",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: \"target_cube_array\",
type: \"box\",
size: [$L, $W, $H], // mm  // for sphere, change size to single-value r_max
material: \"$MATERIAL\",
$INVISIBLE_LINE
$COLOR_LINE
position: [$x, $y, $z] // mm
}\n\n" >> $ARRFILE

      fi # end if -- active cube
      
    done #k_fb
  
  done #k_ud

done #k_lr

echo "Done."
printf "Array written to: %s\n" $ARRFILE


## finalize by combining base .geo file with array .geo file
cat $BASEFILE $ARRFILE > $OUTFILE
printf "\nRAT-PAC .GEO FILE WRITTEN TO: %s\n\n" $OUTFILE


## all pau!   )
echo -e "### spacecube geometry generator finished. ###\n\n\n"
exit 0
