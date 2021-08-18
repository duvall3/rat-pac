#!/bin/bash
# process_rat_run -- process .log file from RAT-PAC run into ROOT file for analysis
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #
# ~ Updated 5/21 ~ #

## usage
if [ $# -lt 2 ]; then
  echo -e "\nUSAGE: process_rat_run <DATARUN_NAME> <NUM_EVENTS>\n" && exit 10
fi

## init
BASENAME=$1
NUM_EVENTS=$2
LOGFILE="$BASENAME".log
ROOTFILE="$BASENAME".root
RTFILE="$BASENAME"_energies.rt

## main
awk '$1 ~ /EVENT/ && ( $6>0 || $8>0 || $10>0 ) {print $2"\t"$4"\t"$6"\t"$8"\t"$10"\t"$12"\t"$14"\t"$16}' $LOGFILE > $RTFILE
ROOTCOMMAND=$(printf "'$RATROOT/user/root_macros/duvallAnalyze.cxx(\"$BASENAME\")'")
eval "root -q -l -b $ROOTCOMMAND"

## tidying up
# make output directory & move all the new output files there
mkdir $BASENAME
mv -t $BASENAME $BASENAME?*

# all pau!  )
exit 0
