#!/bin/bash
# prog_mon.sh -- simple script to keep track of RAT-PAC run progress
#     using avg_progress.sh
# -- see github-->duvall3-->rat-pac-->collab-->user-->shell_scripts
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2019 ~ #

# arg check
if [ $# -lt 1 ]; then
  echo "USAGE: prog_mon.sh <EVENTS_PER_INSTANCE>" && exit 2
else
  EVENTS_PER_INSTANCE=$1
fi

# main
while true; do
  PROG=$(avg_progress.sh $EVENTS_PER_INSTANCE)
  date +"%D %T"
  echo -e "$PROG\n"
  sleep 15s
done

# all pau!   )
exit 0
