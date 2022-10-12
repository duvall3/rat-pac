#!/bin/bash
# local_batch_jobs_template -- TEMPLATE FOR: script to create and run a set of RAT-PAC simulations
#	using multiple cores on the same machine
#
# -- should be run in the relevant $RATROOT/data/<EXPERIMENT> directory
#
# -- Usage: local_batch_jobs_template.sh <DATARUN_NAME> <EVENTS_PER_INSTANCE> <NUM_INSTANCES> [OTHER_PARAMS]...
#      OR   local_batch_jobs_template.sh <kill>
#
# -- Example: local_batch_jobs_template.sh some_datarun 200 5
#      -- this would run a combined total of 1000 events split over 5 instances
#         of RAT-PAC containing 200 events each, all under an umbrella
#         directory named "some_datarun"
#
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2022 ~ #

#Copyright (C) 2019 Mark J. Duvall
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
    echo -e "\nInput not recognized; please try again.\n" && local_batch_jobs_template.sh kill
  fi

fi


## INIT

# process args and get directory
if [[ $# -lt 3 ]]; then
  echo -e "\nUSAGE: local_batch_jobs_template.sh <DATARUN_NAME> <EVENTS_PER_INSTANCE> <NUM_INSTANCES> [OTHER_PARAMS]...\n"
  exit 10
fi
DATARUN=$1
NEVENTS=$2
NINSTS=$3
EXAMPLE_TF=${4:-$EXAMPLE_TF}	# first try argument, then environment
EXAMPLE_TF=${EXAMPLE_TF:-false}	# if still empty, use default
EXPDIR=$RATROOT/data/$(basename $(pwd) /)

##debug
#echo $DATARUN
#echo $NEVENTS
#echo $NINSTS
#echo $EXAMPLE_TF
#echo $RATROOT
#echo


## MAIN

# prepare super-directory
mkdir -p output/$DATARUN && cd output/$DATARUN

# loop over instance subdirectories
for (( k=0; k<$NINSTS; k++ )) {

  # RAT-PAC instance subdirectory init
  INST_DIR="$DATARUN"_$k
  mkdir $INST_DIR
  cd $INST_DIR

  # create run.mac
  echo -e "/control/macroPath $EXPDIR\n/control/execute setup.mac\n/rat/procset file \"$INST_DIR.root\"\n/run/beamOn $NEVENTS" > run.mac

  # prepare simulation, post-processing, and combination commands
  RATCMD="rat -l $INST_DIR.log run.mac"
  PROCCMD="$RATROOT/user/shell_scripts/process_rat_run_template_template.sh $INST_DIR $NEVENTS $EXAMPLE_TF"
  ECHOSTR='\n$INST_DIR complete.\n'
  ECHOCMD="echo -e $ECHOSTR"
  FULLCMD="eval $RATCMD && eval $PROCCMD && eval $ECHOCMD"

  # RUN
  eval "$FULLCMD &"
  sleep 2s
  cd $EXPDIR/output/$DATARUN

} # end datarun / dir loop

# wait for RAT and ROOT to finish
while pgrep -t $(tty | sed s_/dev/__) "rat|root" > /dev/null; do
  sleep 1s
done

# simulations and conversions should be finished here
echo -e "\nBatch jobs complete.\n"

# combine dataruns into a single ROOT file
echo -e "\nCombining data...\n"
chain_template.sh && echo -e "\nTChain complete.\n"

# analyze master datafile
echo -e "\nAnalyzing combined data...\n"
RES_FILE=$DATARUN"_results.root"
ANCMD="root -q -l -b someAnalysisMacro(\"$RES_FILE\", $NUM_EVENTS, $EXAMPLE_TF)'"
eval $ANCMD

## all pau!   )
if [ $? -eq  0 ]; then
  echo -e "\nDone.\n"
  echo -e "\nBatch run complete!\n\n"
  exit 0
else
  echo -e "\nDone.\n"
  echo -e "\nBatch run finished, with errors.\n\n"
  exit 2
fi
