#!/bin/bash
# process_ibd_run -- process ROOT file from IBD run; prepare data & .m files
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #
# ~ last updated 11/2019 ~ #

## usage
if [ $# -lt 2 ]; then
  echo -e "USAGE: process_ibd_run <DATARUN_NAME> <NUM_EVENTS>\n" && exit 10
fi

FILENAME=$1
NUM_EVENTS=$2

## process IBD information

# setup
ROOTFILE="$FILENAME".root
RTFILE="$FILENAME".rt
awk '$1 ~ /EVENT/ && ( $6>0 || $8>0 || $10>0 ) {print $2"\t"$4"\t"$6"\t"$8"\t"$10"\t"$12"\t"$14"\t"$16}' "$FILENAME".log > "$FILENAME".rt
RTCOMMAND=$(printf "'$RATROOT/user/root_macros/rt_to_root.cxx(\"$RTFILE\")'")

## main
eval "root -q -l -b $RTCOMMAND"

## tidying up
# make output directory & move all the new output files there
mkdir $FILENAME
mv -t $FILENAME $FILENAME?*

# all pau!  )
exit 0
