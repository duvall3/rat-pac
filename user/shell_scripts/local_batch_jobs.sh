#!/bin/bash
# local_batch_jobs -- script to create and run a set of RAT-PAC simulations
#	using multiple cores on the same machine
#
# -- should be run in the relevant $RATROOT/data/<EXPERIMENT> directory
#
# -- Usage: local_batch_jobs.sh <DATARUN_NAME> <EVENTS_PER_INSTANCE> <NUM_INSTANCES> [QUANTIZED_POSITIONS] [POSITION_RESOLUTIONS]
#      OR   local_batch_jobs.sh <kill>
#
# -- Example: local_batch_jobs.sh some_datarun 200 5
#      -- this would run a combined total of 1000 events split over 5 instances
#         of RAT-PAC containing 200 events each, all under an umbrella
#         directory named "some_datarun"
#
# -- NOTE: This script depends on the following companion scripts from GitHub at:
#      https://github.com/duvall3/rat-pac/tree/comparison/ :
#      -- 
#      -- 
#      -- 
#
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2019 ~ Updated 9/21 ~ #


## KILL option: kill all instances of RAT-PAC belonging to the current user

ARG1=$(echo $1 | tr [:upper:] [:lower:])
if [[ $ARG1 = "kill" ]]; then

  # check whether there are any relevant jobs
  if [[ ! $(pgrep -u $USER -x rat) ]]; then # user currently does not have RAT-PAC running
    echo -e "\nUser $USER does not currently have any RAT-PAC jobs running.\n\nKill canceled.\n" && exit 2
  fi
  
  # prompt for confirmation
  echo -en "\nWARNING: This will kill all of your current RAT-PAC jobs. Confirm kill (Y/N)?  " \
    && read KILL_YN
  
  # execute user's reply
  if [ $( grep "[Yy]" <(echo $KILL_YN) ) ]; then # reply contained "Y" or "y"
    # kill
    echo -e "\nKilling all current RAT-PAC jobs belonging to $USER..."
      pkill -SIGKILL -u $USER -x rat \
      && echo -e "\nDone.\n" \
      && exit 0
  elif [ $( grep "[Nn]" <(echo $KILL_YN) ) ]; then # reply contained "N" or "n"
    # do not kill
    echo -e "\nKill canceled.\n" && exit 2
  else
    # user entered something other than y(es) or n(o)
    echo -e "\nInput not recognized; please try again.\n" && local_batch_jobs.sh kill
  fi

fi


## INIT

if [[ $# -lt 3 ]]; then
  echo -e "\nUSAGE: local_batch_jobs.sh <DATARUN_NAME> <EVENTS_PER_INSTANCE> <NUM_INSTANCES> [QUANTIZED_POSITIONS] [POSITION_RESOLUTIONS]\n  OR   local_batch_jobs.sh <kill>\n" && exit 10
fi
DATARUN=$1
NEVENTS=$2
NINSTS=$3
if [[ $# -lt 4 ]]; then
  QUANTIZED_POSITIONS=""
else
  QUANTIZED_POSITIONS=$4
fi
if [[ $# -lt 5 ]]; then
  POSITION_RESOLUTIONS=""
else
  POSITION_RESOLUTIONS=$5
fi
#if [[ $# -lt 6 ]]; then #deprecated
   EXPDIR=$RATROOT/data/$(basename $(pwd) /) #KEEPME
#else
#  EXPDIR=$(basename $6 /)
#fi

##debug
#echo $DATARUN
#echo $NEVENTS
#echo $NINSTS
#echo $RATROOT
#echo $EXPDIR
#echo


## MAIN

# prepare super-directory
mkdir $DATARUN && cd $DATARUN

# loop over instance subdirectories
for (( k=0; k<$NINSTS; k++ )) {

  # RAT-PAC instance subdirectory init
  INST_DIR="$DATARUN"_$k
  mkdir $INST_DIR
  cd $INST_DIR

  # create run.mac
  echo -e "/control/macroPath $EXPDIR\n/control/execute setup.mac\n/rat/procset file \"$INST_DIR.root\"\n/run/beamOn $NEVENTS" > run.mac # assume IBD run

  # prepare simulation, post-processing, and combination commands
  RATCMD="rat -l $INST_DIR.log run.mac" # assume IBD run
  PROCCMD="$RATROOT/user/shell_scripts/process_rat_run.sh $INST_DIR $NEVENTS false $QUANTIZED_POSITIONS $POSITION_RESOLUTIONS"
  ECHOCMD="echo -e \"\n$INST_DIR complete.\n\""
  FULLCMD="eval $RATCMD && eval $PROCCMD && eval $ECHOCMD"

  # RUN
  eval "$FULLCMD &"
  sleep 2s
  cd $EXPDIR/$DATARUN

} # end datarun / dir loop

# wait for RAT and ROOT to finish
while pgrep -t $(tty | sed s_/dev/__) "rat|root" > /dev/null; do
  sleep 1s
done

# simulations and conversions should be finished here
echo -e "\nBatch jobs complete.\n"

# combine dataruns into a single _T file for use with SEDAQ2.cxx
echo -e "\nCombining scintillation data...\n"
chain.sh && echo -e "\nTChain complete.\n"

# analyze master datafile
echo -e "\nAnalyzing combined data...\n"
T_FILE=$DATARUN"_T.root"
RES_FILE=$DATARUN"_results.root"
ANCMD1=$(echo -e "root -q -l -b 'SEDAQ2.cxx(\"$T_FILE\", true, \"$QUANTIZED_POSITIONS\", \"$POSITION_RESOLUTIONS\")'")
ANCMD2=$(echo -e "root -q -l -b 'angularRecon.cxx(\"$RES_FILE\", true)'")
#echo -e "\n$ANCMD1\n$ANCMD2\n" #debug
eval $ANCMD1 && eval $ANCMD2
#eval $ANCMD1 #debug
#if [[ $? == 0 ]]; then eval $ANCMD2; fi #debug

## all pau!   )
if [[ $? == 0 ]]; then
  echo -e "\nDone.\n"
  echo -e "\nBatch run complete!\n\n"
  exit 0
else
  echo -e "\nDone.\n"
  echo -e "\nBatch run finished, with errors.\n\n"
  exit 1
fi
