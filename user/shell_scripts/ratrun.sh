#!/bin/bash
# ratrun -- master script to configure & execute macros for a RAT-PAC run (incl. data extraction from ROOT tree)
# usage:  ratrun [FILENAME] [NUM_EVENTS]
#	-- FILENAME is the *base* name (i.e., no extension) for the output folder/files
#	-- NUM_EVENTS is the number of events to be run (i.e., passed to the '/run/beamOn' command)
#	-- if either is unspecified, the user will be prompted, so make sure to specify these on the command line
#		if you want to run in batch mode
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #


echo
printf "\n### RAT RUN ###\n\n"
printf "!Warning: This script will replace the current version of './run.mac'. Type <Ctrl-C> now if you wish to abort.\n\n"

# run types available
RUN_TYPE_LIST=("neutron" "ibd" "EXIT")

# argument check / get info:
if [ $1 ]; then
  FILENAME=$1
  else
    printf "\nEnter file basename for this run: "
    read FILENAME
fi
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

printf "\n\n### Beginning $RUN_TYPE run...\n\n"

# create new run.mac
echo "\
/control/execute setup.mac
/rat/procset file \"$FILENAME.root\"
/run/beamOn $NUM_EVENTS\
" > run.mac

# create conflog && run rat
conflog.sh > "$FILENAME".conf && rat run.mac

# rename log file -- ASSUMING NO OTHER LOG FILES ARE CREATED IN LOCAL DIRECTORY DURING RUN!!!
LOGFILE=$(basename $(ls -ltr *.log | tail -1 | awk '{print $NF}') .log)
rename s/$LOGFILE/$FILENAME/ ./$LOGFILE.log

# process information according to type of run
case $RUN_TYPE in
  "neutron")
    process_n0_run.sh $FILENAME $NUM_EVENTS;;
  "ibd")
#   process_ibd_run.sh $FILENAME $NUM_EVENTS;;
    echo "[feature not ready yet]"
  *)
    echo "Error: invalid run type (somehow) specified." && exit 3
esac

## reminder
echo "Reminder: Move output to long-term storage if desired."

## all pau!  )
exit 0
