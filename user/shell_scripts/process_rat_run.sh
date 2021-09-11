#!/bin/bash
# process_rat_run.sh -- prepare and analyze data from a RAT-PAC (IBD) run
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #
# ~ Updated 9/21 ~ #

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
awk '$1 ~ /EVENT/ && ( $6>0 || $8>0 || $10>0 ) {print $2"\t"$4"\t"$6"\t"$8"\t"$10"\t"$12"\t"$14"\t"$16}' $LOGFILE > $RTFILE
ROOTCOMMAND=$(echo -e "'$RATROOT/user/root_macros/duvallAnalyzeFull.cxx(\"$BASENAME\", $GRAPHICS_TF, \"$QUANTIZED_POSITIONS\", \"$POSITION_RESOLUTIONS\")'")
eval "root -q -l -b $ROOTCOMMAND"

## tidying up
# make output directory & move all the new output files there
mkdir $BASENAME
mv -t $BASENAME $BASENAME?*

# all pau!  )
exit 0
