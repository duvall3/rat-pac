#!/bin/bash
# combine_runs -- script to combine .txt data files into a single file
# -- usage: combine_runs.sh <FILES> > OUTPUTFILE
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ June 2016 ~ #

# check for awk program
if [ $(which awk) ]; then awkprogram=awk
  elif [ $(which gawk) ]; then awkprogram=gawk
  elif [ $(which mawk) ]; then awkprogram=mawk
  else echo "ERROR: No awk program found. Go download awk, gawk, or mawk from your repositories. You'll be glad you did.   )"; exit 1
fi

# run awk script
$awkprogram -f $RATROOT/user/shell_scripts/combine_runs.awk $@ | column -t

# all pau!
exit 0
