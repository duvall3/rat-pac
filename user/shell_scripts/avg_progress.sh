#!/bin/bash
# avg_progress -- progress check
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ #


if [ $# -lt 1 ]; then
  echo -e "\nUsage: avg_progress.sh <EVENTS_PER_JOB> [DATFILE_TF]\n"
  exit 2
fi

if [ $2 ]; then
  DATFILE_TF=$2
else
  DATFILE_TF=false
fi

EVENTS_PER_JOB=$1
k=0
total=0
increment=0

if [ $DATFILE_TF = false ]; then
  for FILE in *.log; do
    k=$((k+1))
    increment=$(tail -qn 4 $FILE | awk '$1 ~ /EVENT/ {print $2}')
    total=$((total + increment))
  done
else
  for FILE in *.dat; do
    k=$((k+1))
    increment=$(tail -qn 25 $FILE | awk '$1 ~ /Event:/ {print $2}')
    total=$((total + increment))
  done
fi

echo $(echo "$total / ($k*$EVENTS_PER_JOB)" | bc -l | cut -c1-5)

# all pau!   )
exit 0
