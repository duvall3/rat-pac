#!/bin/bash
# duvall3_analyze.sh -- wrapper script for ROOT analysis macros
# -- USAGE: duvall3_analyze.sh <DATARUN_NAME>
#    -- NOTE: Enter DATARUN_NAME without any file extension
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 12/2019 ~ #

# arg / usage check
if [ $# -lt 1 ]; then
  echo -e "\nUSAGE: duvall3_analyze.sh <DATARUN_NAME>\n-- NOTE: Enter DATARUN_NAME without any file extension.\n"
  exit 2
fi

# init
DATARUN=$1
DTRNT="$DATARUN"_T.root
DTRNR="$DATARUN"_results.root

# root-command defs
RTCMD_1=$(echo -e "root -q -l -b 'rt_to_root.cxx(\"$DATARUN.rt\")'")
RTCMD_2=$(echo -e "root -q -l -b 'SEDAQ.cxx(\"$DTRNT\", true)'")
RTCMD_3=$(echo -e "root -q -l -b 'angularRecon.cxx(\"$DTRNR\")'")
echo $RTCMD_1 #debug
echo $RTCMD_2 #debug
echo $RTCMD_3 #debug

# MAIN
eval $RTCMD_1
eval $RTCMD_2
eval $RTCMD_3

# all pau!   )
exit 0
