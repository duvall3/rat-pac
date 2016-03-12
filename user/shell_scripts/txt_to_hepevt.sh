#!/bin/bash
# txt_to_hepevt.sh-- script to convert (Octave/MATLAB-prepared) ASCII block to full HEPEVT format, for use in RAT-PAC
# -- usage: txt_to_hepevt.sh [INPUTFILE]
# -- requires GNU awk (as either awk, gawk, or mawk)
# -- assuming input file has the format as prepared by https://github.com/duvall3/rat-pac/user/backgrounds/neutron_generator.m
# -- 2 methods:
#	1) single event with NHEP=total; simpler & more compact, but requires running in RAT-PAC as "/run/beamOn 1"
#	2) individual events, each with NHEP=1; less efficient, but allows RAT-PAC control over how many to simulate at once
# -- current method: 2
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
#echo $INPUTFILE #debugging
#if [ -z "$2" ]; then
#  OUTPUTFILE=hepevt.dat # default output file
#else
#  OUTPUTFILE=$2
#fi # end if
echo "Converting \"$INPUTFILE\" to \"$OUTPUTFILE\"..."

# get number of events
NUM_EVENTS=$(wc -l $INPUTFILE | awk '{print $1}')
#echo $NUM_EVENTS #debugging

# check for GNU awk programs
if [ $(which awk) ]; then awkprogram=awk
  elif [ $(which gawk) ]; then awkprogram=gawk
  elif [ $(which mawk) ]; then awkprogram=mawk
  else echo "ERROR: No awk program found. Go download awk, gawk, or mawk from your repositories. You'll be glad you did.   )"; exit
fi
#echo $awkprogram #debugging


## main program

# Method 1:
# -- this should create a file with the total number of events on the first line,
#	followed by a single-space-indented block of all the events themselves
#$awkprogram -v num_events=$NUM_EVENTS 'BEGIN {print num_events}; {print " " $0}' $INPUTFILE > $OUTPUTFILE


# Method 2:
# -- this should create a file with the events separated into individual HEPEVT entries
$awkprogram -v num_events=$NUM_EVENTS '{ print "1\n " $0 }' $INPUTFILE > $OUTPUTFILE


# all pau!   )
exit 0
