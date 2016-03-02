#!/bin/bash
# txt_to_hepevt.sh-- script to convert (Octave/MATLAB-prepared) ASCII block to full HEPEVT format, for use in RAT-PAC
# -- requires GNU awk (as either awk, gawk, or mawk)
# -- assuming input file has the format as prepared by https://github.com/duvall3/rat-pac/user/backgrounds/neutron_generator.m
# -- 2 methods:
#	1) single event with NHEP=total; simpler & more compact, but requires running in RAT-PAC as "/run/beamOn 1"
#	2) individual events, each with NHEP=1; less efficient, but allows RAT-PAC control over how many to simulate at once
# -- current method: 1 (above)
# ~ by Mark J. Duvall ~ mjduvall@hawaii.edu ~ February 2016 ~


## init
if [ -z "$1" ] ; then
  INPUTFILE=hepevt.txt # default input file
else
  INPUTFILE=$1
fi # end if
echo $INPUTFILE #debugging
NUM_EVENTS=$(wc -l $INPUTFILE)
# check for GNU awk programs
if [ $(which awk) ]; then awkprogram=awk
  elif [ $(which gawk) ]; then awkprogram=gawk
  elif [ $(which mawk) ]; then awkprogram=mawk
  else echo "ERROR: No awk program found. Go download awk, gawk, or mawk from your repositories. You'll be glad you did.   )"; exit
fi


# Method 1:




# Method 2:




# all pau!   )
exit 0
