#!/bin/bash
# process_n0_run -- this script duplicates the post-run processing of ratrun.sh
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #

# process neutron-capture information
ROOTFILE="$FILENAME".root
ROOTCOMMAND=$(printf "'NeutronCaptures.cxx(\"$ROOTFILE\",$NUM_EVENTS)'")
eval "root -q -l -b $ROOTCOMMAND > \"$FILENAME\".n0.dat"
n0_dat_to_txt.sh "$FILENAME".n0.dat | column -t > "$FILENAME".txt
nCapAgents.sh "$FILENAME".n0.dat
plot_gammas_mfile.sh $FILENAME
n0_dat_to_sc.sh "$FILENAME".n0.dat

# make output directory & move all the new output files there
mkdir $FILENAME
mv -t $FILENAME $FILENAME.* gam/ plot_gammas.m scatters

# reminder
echo "Reminder: Move output to long-term storage if desired."

# all pau!  )
exit 0
