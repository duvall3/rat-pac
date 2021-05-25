#!/bin/bash
# geogen_santa -- generate a SANTA geometry from a template
# USAGE: geogen_santa.sh [reset]
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ Updated 5/21 ~ //


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

# check / create filenames
PROJ=$(pwd | sed s_/_\ _g | awk '{print $NF}')
BASEFILE="$PROJ"_base.geo
ARRFILE="$PROJ"_cell-array.geo
OUTFILE="$PROJ".geo

# clear command
if [[ $1 = "reset" ]]; then
  if [[ -f $BASEFILE ]]; then
    echo "Resetting experiment to base; clearing detector..."
      if [[ -f $ARRFILE ]]; then rm $ARRFILE; fi
      if [[ -f $OUTFILE ]]; then rm $OUTFILE; fi
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

## check for bc
#echo -e "\n\nChecking for bc..."
#if [ $(which bc) ]; then
#  echo "Success: bc found in $(which bc)"
#else
## echo "WARNING: bc not found; calculations will be performed by BASH and all non-integers will lose their decimal part."
#  echo -e "ERROR: Program 'bc' is needed to run this script.\n\n" && exit 10
#fi


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


## MAIN

echo -e "\nGenerating cells..."

# target bars
for k in {0..39}; do
  bar_id=$(($k+1))
  index_name=target_bar_"$bar_id"
  z=$((-955+($k*51)))
      echo -e "\
// -------- GEO[$index_name]
{
name: \"GEO\",
index: \"$index_name\",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: \"target_plane\",
type: \"box\",
size: [2.5, 1000.0, 25.0] // mm
material: \"ej254_undoped\",
invisible: 0,
position: [0.0, 0.0, $z.0] // mm
}\n\n" >> $ARRFILE
done

# capture bars
for k in {0..39}; do
  bar_id=$(($k+1))
  index_name=capture_bar_"$bar_id"
  z=$((-955+($k*51)))
      echo -e "\
// -------- GEO[$index_name]
{
name: \"GEO\",
index: \"$index_name\",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: \"capture_plane\",
type: \"box\",
size: [30.0, 1000.0, 25.0], // mm
material: \"ej254_5b\",
invisible: 0,
position: [0.0, 0.0, $z.0] // mm
}\n\n" >> $ARRFILE
      
done

echo "Done."
printf "Array written to: %s\n" $ARRFILE


## finalize by combining base .geo file with array .geo file
cat $BASEFILE $ARRFILE > $OUTFILE
printf "\nRAT-PAC .GEO FILE WRITTEN TO: %s\n\n\n" $OUTFILE


## all pau!   )
exit 0
