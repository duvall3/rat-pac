#!/bin/bash
# process_ibd_run -- process ROOT file from IBD run; prepare data & .m files
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #

# APPROACHING READINESS! #

FILENAME=$1
NUM_EVENTS=$2

# process IBD information
ROOTFILE="$FILENAME".root
ROOTCOMMAND=$(printf "'IBD.cxx(\"$ROOTFILE\",$NUM_EVENTS)'")
eval "root -q -l -b $ROOTCOMMAND > \"$FILENAME\".ibd.dat"
ibd_dat_to_txt.sh "$FILENAME".ibd.dat | column -t > "$FILENAME".txt
#nCapAgents.sh "$FILENAME".ibd.dat
#plot_gammas_mfile.sh $FILENAME

# make output directory & move all the new output files there
mkdir $FILENAME
mv -t $FILENAME $FILENAME.* gam/ plot_gammas.m scatters


# all pau!  )
exit 0
