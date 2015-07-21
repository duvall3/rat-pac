#!/bin/bash
# ratrun -- simple script to configure & execute RAT-PAC run macros

printf "\n\n### RAT RUN ###\n\nWARNING: This script will replace the current version of 'run.mac'. Enter <Ctrl-C> now if you wish to abort.\n"

# get info:
printf "\nEnter file basename for this run: "
read FILENAME
printf "\nEnter number of events: "
read NUM_EVENTS

printf "\n\n### Beginning run...\n\n"

# create new run.mac
echo "\
/control/execute setup.mac
/rat/procset file \"$FILENAME.root\"
/run/beamOn $NUM_EVENTS\
" > run.mac

# create conflog & run rat
#conflog.sh > "$FILENAME".conf && rat run.mac

exit 0
