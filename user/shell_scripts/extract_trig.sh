#!/bin/bash
# extract_trig -- extract trigger data from temporary ASCII SimpleEnergyDAQ (Marc's RAT log version)
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 7/2017 ~ #
# NOTE: Currently requires manual insertion of '###' tag

## init
INPUTFILE=$1
BASENAME=$(basename $1 .log)
OUTPUTFILE=$BASENAME".trg"

## process
awk -v RS='###' 'NR==2 {print $0}' $INPUTFILE | awk -F : '$0 ~ ":" {print $2}' | column -t > $OUTPUTFILE
#echo $INPUTFILE $BASENAME $OUTPUTFILE #debug

## all pau!   )
exit 0
