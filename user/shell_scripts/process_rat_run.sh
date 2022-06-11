#!/bin/bash
# process_rat_run.sh -- prepare and analyze data from a RAT-PAC (IBD) run
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #
# ~ Updated 6/22 ~ #

#Copyright (C) 2021 Mark J. Duvall
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

## usage
if [ $# -lt 2 ]; then
  echo -e "\nUSAGE: process_rat_run.sh <DATARUN_NAME> <NUM_EVENTS> [GRAPHICS_TF]\n" && exit 10
fi

## init
BASENAME=$1
NUM_EVENTS=$2
if [[ -z $3 ]]; then
  if $SEDAQ_GRAPHICS_TF; then
    GRAPHICS_TF=true
  else
    GRAPHICS_TF=false
  fi
else
  GRAPHICS_TF=$3
fi
#if [[ -z $4 ]]; then QUANTIZED_POSITIONS=""; else QUANTIZED_POSITIONS=$4; fi
#if [[ -z $5 ]]; then POSITION_RESOLUTIONS=""; else POSITION_RESOLUTIONS=$5; fi
LOGFILE="$BASENAME".log
ROOTFILE="$BASENAME".root
RTFILE="$BASENAME"_energies.rt

## main
# FIXME: Temporarily adding "NCAP" --> use neutronCaptures.cxx to perform some rudimentary analysis while the main code is undergoing repair
awk '$1 ~ /EVENT/ && ( $6>0 || $8>0 || $10>0 ) {print $2"\t"$4"\t"$6"\t"$8"\t"$10"\t"$12"\t"$14"\t"$16}' $LOGFILE > $RTFILE
ROOTCOMMAND=$(echo -e "'$RATROOT/user/root_macros/duvallAnalyzeFull.cxx(\"$BASENAME\", $GRAPHICS_TF, \"$QUANTIZED_POSITIONS\", \"$POSITION_RESOLUTIONS\")'")
ROOTCOMMAND_NCAP=$(echo -e "'$RATROOT/user/root_macros/util/neutronCaptures.cxx(\"$BASENAME.root\")'")
eval "root -q -l -b $ROOTCOMMAND"
eval "root -q -l -b $ROOTCOMMAND_NCAP"

## tidying up
# make output directory & move all the new output files there
mkdir $BASENAME
mv -t $BASENAME $BASENAME?*
#if [ -f geogen*.log ]; then cp -t $BASENAME geogen*.log; fi
for GEOLOG in geogen*.log; do
  if [ -f $GEOLOG ]; then cp -t $BASENAME "$BASENAME_"$GEOLOG; fi
done

# all pau!  )
exit 0
