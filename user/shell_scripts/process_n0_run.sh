#!/bin/bash
# process_n0_run -- this script duplicates the post-run processing of ratrun.sh
# -- Usage: process_n0_run <FILENAME> <NUMBER_OF_EVENTS>
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #


## init

FILENAME=$(basename $1 .root)
NUM_EVENTS=$2

# whether to run the ROOT part
if [ $3 ]; then
  ROOT_TF=$3
else
  ROOT_TF=true # default to true
fi


## process neutron-capture information
# ROOT processing
if [ $ROOT_TF = true ]; then
  ROOTFILE="$FILENAME".root
  ROOTCOMMAND=$(printf "'NeutronCaptures.cxx(\"$ROOTFILE\",$NUM_EVENTS)'")
  eval "root -q -l -b $ROOTCOMMAND > \"$FILENAME\".n0.dat"
elif [ $ROOT_TF = false ]; then : # do nothing
else
  echo "Invalid parameter; ROOT_TF (3rd argument) should be either \"true\" or \"false\"."; exit 1
fi
# post-ROOT text processing
n0_dat_to_txt.sh "$FILENAME".n0.dat | column -t > "$FILENAME".txt
nCapAgents.sh "$FILENAME".n0.dat
#plot_gammas_mfile.sh $FILENAME
#n0_dat_to_sc.sh "$FILENAME".n0.dat
n0_term_vols.sh "$FILENAME".n0.dat #"$FILENAME"


## tidying up
# make output directory & move all the new output files there
mkdir $FILENAME
mv -t $FILENAME $FILENAME.* gam/ #plot_gammas.m scatters


## all pau!  )
exit 0
