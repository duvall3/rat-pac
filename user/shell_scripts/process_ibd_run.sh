#!/bin/bash
# process_ibd_run -- process ROOT file from IBD run; prepare data & .m files
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #

# !!! NOT READY YET -- NEED TO MODIFY / ADD SHELL SCRIPTS FOR COMPATIBILITY !!! #

FILENAME=$1
NUM_EVENTS=$2

# process IBD information
ROOTFILE="$FILENAME".root
ROOTCOMMAND=$(printf "'IBD_Test.cxx(\"$ROOTFILE\",$NUM_EVENTS)'")
eval "root -q -l -b $ROOTCOMMAND > \"$FILENAME\".ibd.dat"
ibd_dat_to_txt.sh "$FILENAME".ibd.dat | column -t > "$FILENAME".txt
nCapAgents.sh "$FILENAME".ibd.dat
plot_gammas_mfile.sh $FILENAME
n0_dat_to_sc.sh "$FILENAME".ibd.dat

# make output directory & move all the new output files there
mkdir $FILENAME
mv -t $FILENAME $FILENAME.* gam/ plot_gammas.m scatters

# reminder
echo "Reminder: Move output to long-term storage if desired."

# all pau!  )
exit 0
