#!/bin/bash
# ratrun -- simple script to configure & execute RAT-PAC run macros

echo -e "\n\n### RAT RUN ###\nWARNING: This script will replace the current version of 'run.mac'. Enter <Ctrl-C> now if you wish to abort.\n"

# get info:
echo -e "\nEnter file basename for this run: "
read FILENAME && echo
echo "Enter number of events: "
read NUM_EVENTS && echo

# create new run.mac
echo "
  /control/execute setup.mac
  /rat/procset file \"$FILENAME.root\"
  /run/beamOn $NUM_EVENTS
" > run.mac

return 0
