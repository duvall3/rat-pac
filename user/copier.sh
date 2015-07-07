#!/bin/bash
# copier.sh -- duplicate trivial nuebar "event" to test against .dat tracks

if [ ! $1 ]; then echo "Please specify an output filename." && exit 1; fi

if [ ! $2 -gt 1 ]; then echo "Please specify a number of events." && exit 2; fi

echo -e "\nGenerating $2 trivial events into $1...\n"

echo -e "RAT: Libraries loaded.\n\nProcessing ToAscii.cxx..." > $1

for ((k=0; k<$2; k++)); do
  cat triv.dat >> $1
done

exit 0
