#!/bin/bash
# avg_progress -- progress check for parallel instances of RAT-PAC
# -- more documentation details upcoming
# -- meanwhile, see github-->duvall3-->rat-pac-->collab-->user-->shell_scripts
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ #

# arg check
if [ $# -lt 1 ]; then
  echo -e "\nUsage: avg_progress.sh <EVENTS_PER_JOB>\n"
  exit 2
fi

# init
EVENTS_PER_JOB=$1
k=0
total=0
increment=0

# main
for DIR in */; do
  NAME=$(basename $DIR /)
  k=$((k+1))
  increment=$(tail -qn 4 $NAME/"$NAME".log | awk '$1 ~ /EVENT/ {print $2}')
  total=$((total + increment))
done
echo $(echo "$total / ($k*$EVENTS_PER_JOB) * 100" | bc -l | cut -c1-3)" %"

# all pau!   )
exit 0
