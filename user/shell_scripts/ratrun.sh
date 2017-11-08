#!/bin/bash
# ratrun -- master script to configure & execute macros for a RAT-PAC run (incl. data extraction from ROOT tree)
# usage:  ratrun [FILENAME] [NUM_EVENTS]
#	-- FILENAME is the *base* name (i.e., no extension) for the output folder/files
#	-- NUM_EVENTS is the number of events to be run (i.e., passed to the '/run/beamOn' command)
#	-- if either is unspecified, the user will be prompted, so make sure to specify these on the command line
#		if you want to run in batch mode
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #


# run types available
RUN_TYPE_LIST=("neutron" "ibd" "EXIT")

# argument check / get info:
if [ $# -lt 1 ]; then
  echo -e "\nUsage: ratrun.sh <FILENAME> [NUM_EVENTS] [RUN_TYPE] [SEDAQ_GRAPHICS_TF]\n"
  exit 100
fi
echo
printf "\n### RAT RUN ###\n\n"
FILENAME=$1
if [ $2 ]; then
  NUM_EVENTS=$2
  else
    printf "\nEnter number of events: "
    read NUM_EVENTS
fi
if [ $3 ]; then
  RUN_TYPE=$3
  else
    printf "Choose run type:\n"
   PS3="> "
    select RUN_TYPE in ${RUN_TYPE_LIST[*]}; do
     if [ -z $RUN_TYPE ]; then
       continue 
       elif [ $RUN_TYPE == "EXIT" ]; then
          printf "\nExiting...\n\n"; exit 0
        else break
      fi
    done
fi
#if [ $4 ]; then
#  OUTPUT_DIR=$4
#  else
#    printf "\nEnter output directory: "
#    read OUTPUT_DIR
#fi

if [ $4 ]; then
  SEDAQ_GRAPHICS=$4
else
  SEDAQ_GRAPHICS=false
fi

printf "\n\n### Beginning $RUN_TYPE run...\n\n"

# create new run.mac
ROOTFILE="$FILENAME".root
echo "\
/control/execute setup.mac
#/rat/procset file \"$OUTPUT_DIR/$ROOTFILE\"
/rat/procset file \"$ROOTFILE\"
/rat/proc count
/rat/procset update 1000
/run/beamOn $NUM_EVENTS\
" > run.mac


## MAIN: create conflog && run rat ##
#conflog.sh > $OUTPUT_DIR/"$FILENAME".conf && rat -l $OUTPUT_DIR/"$FILENAME".log $OUTPUT_DIR/"$FILENAME".run.mac
conflog.sh > "$FILENAME".conf && rat -l "$FILENAME".log run.mac
#cd $OUTPUT_DIR


# process information according to type of run
case $RUN_TYPE in
  "neutron")
    process_n0_run.sh $FILENAME $NUM_EVENTS true $SEDAQ_GRAPHICS;;
  "ibd")
    process_ibd_run.sh $FILENAME $NUM_EVENTS;;
  *)
    echo "Error: invalid run type (somehow) specified." && exit 3
esac

## reminder
echo "Reminder: Move output to long-term storage if desired."

## all pau!  )
exit 0
