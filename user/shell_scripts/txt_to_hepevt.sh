#!/bin/bash
# txt_to_hepevt.sh-- script to convert (Octave/MATLAB-prepared) ASCII block to full HEPEVT format, for use in RAT-PAC
# -- usage: txt_to_hepevt.sh [INPUTFILE]
# -- requires GNU awk (as either awk, gawk, or mawk)
# -- assuming input file has the format as prepared by https://github.com/duvall3/rat-pac/user/backgrounds/neutron_generator.m
# -- individual events, each with NHEP=1
# ~ by Mark J. Duvall ~ mjduvall@hawaii.edu ~ February 2016 ~


## init

# input
if [ -z "$1" ]; then
  INPUTFILE=hepevt.txt # default input file
  OUTPUTFILE=hepevt.dat # default output file
else
  INPUTFILE=$1
  BASENAME=$(basename -s .txt $1)
  OUTPUTFILE="$BASENAME".dat
fi # end if
echo "Converting \"$INPUTFILE\" to \"$OUTPUTFILE\"..."

# check for GNU awk programs
if [ $(which awk) ]; then awkprogram=awk
  elif [ $(which gawk) ]; then awkprogram=gawk
  elif [ $(which mawk) ]; then awkprogram=mawk
  else echo "ERROR: No awk program found. Go download awk, gawk, or mawk from your repositories. You'll be glad you did.   )"; exit
fi
#echo $awkprogram #debugging

# get number of events
NUM_EVENTS=$(wc -l $INPUTFILE | awk '{print $1}')


## main program
# -- this should create a file with the events separated into individual HEPEVT entries
$awkprogram -v num_events=$NUM_EVENTS '{ print "1\n " $0 }' $INPUTFILE > $OUTPUTFILE


# all pau!   )
exit 0
