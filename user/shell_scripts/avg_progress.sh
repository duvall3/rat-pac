#!/bin/bash
# avg_progress -- progress check
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ #


if [ $# -lt 1 ]; then
  echo -e "\nUsage: avg_progress.sh <EVENTS_PER_JOB>\n"
  exit 2
fi

EVENTS_PER_JOB=$1
k=0
total=0
for FILE in *.log; do
  k=$((k+1))
  total=$((total+$(tail -n 1 $FILE | awk '{print $2}')))
done

echo $(echo "$total / ($k*$EVENTS_PER_JOB)" | bc -l | cut -c1-5)

# all pau!   )
exit 0
