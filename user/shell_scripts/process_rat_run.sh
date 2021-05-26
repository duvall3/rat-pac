#!/bin/bash
# process_rat_run -- process .log file from RAT-PAC run into ROOT file for analysis
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #
# ~ Updated 5/21 ~ #

## usage
if [ $# -lt 2 ]; then
  echo -e "USAGE: process_rat_run <DATARUN_NAME> <NUM_EVENTS>\n" && exit 10
fi

## init
FILENAME=$1
NUM_EVENTS=$2
ROOTFILE="$FILENAME".root
RTFILE="$FILENAME".rt

## main
awk '$1 ~ /EVENT/ && ( $6>0 || $8>0 || $10>0 ) {print $2"\t"$4"\t"$6"\t"$8"\t"$10"\t"$12"\t"$14"\t"$16}' "$FILENAME".log > "$FILENAME".rt
RTCOMMAND=$(printf "'$RATROOT/user/root_macros/rt_to_root.cxx(\"$RTFILE\")'")
eval "root -q -l -b $RTCOMMAND"

## tidying up
# make output directory & move all the new output files there
mkdir $FILENAME
mv -t $FILENAME $FILENAME?*

# all pau!  )
exit 0
