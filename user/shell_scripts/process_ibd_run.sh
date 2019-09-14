#!/bin/bash
# process_ibd_run -- process ROOT file from IBD run; prepare data & .m files
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #

# APPROACHING READINESS! #

## usage
if [ $# -lt 2 ]; then
  echo -e "USAGE: process_ibd_run <DATARUN_NAME> <NUM_EVENTS>\n"
fi

FILENAME=$1
NUM_EVENTS=$2

## process IBD information
# ROOT stuff
ROOTFILE="$FILENAME".root
RTFILE="$FILENAME".rt
#cd $FILENAME
# SimpleEnergyDAQ
awk '$1 ~ /EVENT/ && ( $6>0 || $8>0 || $10>0 ) {print $2"\t"$4"\t"$6"\t"$8"\t"$10"\t"$12"\t"$14"\t"$16}' "$FILENAME".log > "$FILENAME".rt
RTCOMMAND=$(printf "'$RATROOT/user/root_macros/rt_to_root.cxx(\"$RTFILE\")'")
# other stuff
eval "root -q -l -b $RTCOMMAND"
#cd ..


# old ROOT processing
#ROOTCOMMAND=$(printf "'$RATROOT/user/root_macros/IBD.cxx(\"$ROOTFILE\",$NUM_EVENTS)'")
#eval "root -q -l -b $ROOTCOMMAND > \"$FILENAME\".ibd.dat"
#ibd_dat_to_txt.sh "$FILENAME".ibd.dat | column -t > "$FILENAME".txt
#nCapAgents_ibd.sh "$FILENAME".ibd.dat
#ibd_term_vols.sh "$FILENAME".ibd.dat
#plot_gammas_mfile.sh $FILENAME

## make output directory & move all the new output files there
#if [ ! -d $FILENAME ]; then
#  mkdir $FILENAME
#fi
##mv -t $FILENAME $FILENAME?* # gam/ plot_gammas.m scatters


# all pau!  )
exit 0
