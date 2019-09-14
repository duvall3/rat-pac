#!/bin/bash
# local_batch_jobs -- script to create and run a set of RAT-PAC simulations
#	using multiple cores on the same machine
# -- should be run in the relevant $RATROOT/data/<EXPERIMENT> directory
#
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2019 ~ #
#
# USAGE: local_batch_jobs.sh <DATARUN_NAME> <EVENTS_PER_INSTANCE> <NUM_INSTANCES>


## init
if [[ $# -lt 3 ]]; then
  echo "USAGE: local_batch_jobs.sh <DATARUN_NAME> <EVENTS_PER_INSTANCE> <NUM_INSTANCES>" && exit 10
fi
DATARUN=$1
NEVENTS=$2
NINSTS=$3

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

  # sudir init
  INST_DIR="$DATARUN"_$k
  mkdir $INST_DIR
  cd $INST_DIR

  # create run.mac
  echo -e "/control/execute ../../setup.mac\n/rat/procset file \"$INST_DIR.root\"\n/run/beamOn $NEVENTS" > run.mac # assume IBD run

  # prepare simulation, post-processing, and combination commands
  RATCMD="rat -l $INST_DIR.log run.mac" # assume IBD run
  PROCCMD="process_ibd_run.sh $INST_DIR $NEVENTS"
  FULLCMD="eval $RATCMD && eval $PROCCMD"

  # RUN
  eval "$FULLCMD &"
# echo "$FULLCMD &" #debug
  cd ..
  echo
  sleep 1s

} # end datarun / dir loop

# combine dataruns into a single _T file for use with SEDAQ.cxx
chain.sh


## all pau!   )
exit 0
