#!/bin/bash
# local_batch_jobs -- script to create and run a set of RAT-PAC simulations
#	using multiple cores on the same machine
#
# -- should be run in the relevant $RATROOT/data/<EXPERIMENT> directory
#
# -- Usage: local_batch_jobs.sh <DATARUN_NAME> <EVENTS_PER_INSTANCE> <NUM_INSTANCES> [OUTPUT_DIR]
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
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2019 ~ #


## init
if [[ $# -lt 3 ]]; then
  echo "USAGE: local_batch_jobs.sh <DATARUN_NAME> <EVENTS_PER_INSTANCE> <NUM_INSTANCES> [OUTPUT_DIR]" && exit 10
fi
DATARUN=$1
NEVENTS=$2
NINSTS=$3
if [[ $# -lt 4 ]]; then
  EXPDIR=$RATROOT/data/$(basename $(pwd) /)
else
  EXPDIR=$4
fi

#debug
echo $DATARUN
echo $NEVENTS
echo $NINSTS
echo $RATROOT
echo


## MAIN

# prepare super-directory
mkdir $DATARUN && cd $DATARUN

# loop over run directories
for (( k=0; k<$NINSTS; k++ )) {

  # RAT-PAC instance subdirectory init
  INST_DIR="$DATARUN"_$k
  mkdir $INST_DIR
  cd $INST_DIR

  # create run.mac
  echo -e "/control/execute $EXPDIR/setup.mac\n/rat/procset file \"$INST_DIR.root\"\n/run/beamOn $NEVENTS" > run.mac # assume IBD run

  # prepare simulation, post-processing, and combination commands
  RATCMD="rat -l $INST_DIR.log run.mac" # assume IBD run
  PROCCMD="$RATROOT/user/shell_scripts/process_ibd_run.sh $INST_DIR $NEVENTS"
  FULLCMD="eval $RATCMD && eval $PROCCMD"

  # RUN
  eval "$FULLCMD &"
  cd ..
  echo
  sleep 1s

} # end datarun / dir loop

# combine dataruns into a single _T file for use with SEDAQ.cxx
$RATROOT/user/shell_scripts/chain.sh


## all pau!   )
exit 0
