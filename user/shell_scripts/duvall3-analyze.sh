#!/bin/bash
# duvall3_analyze.sh -- wrapper script for ROOT analysis macros
# -- USAGE: duvall3_analyze.sh [DATARUN_NAME]
#    -- DATARUN_NAME defaults to name of current directory
#    -- Enter DATARUN_NAME without any filename extension
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 12/2019 ~ #

# arg / usage check
if [ $# -lt 1 ]; then
  DATARUN=$(basename $(pwd) /)
else
  DATARUN=$1
fi

# init
DTRNT="$DATARUN"_T.root
DTRNR="$DATARUN"_results.root

# root-command defs
RTCMD_1=$(echo -e "root -q -l -b 'rt_to_root.cxx(\"$DATARUN.rt\")'")
RTCMD_2=$(echo -e "root -q -l -b 'SEDAQ.cxx(\"$DTRNT\", true)'")
RTCMD_3=$(echo -e "root -q -l -b 'angularRecon.cxx(\"$DTRNR\", true)'")
# debug
#echo $RTCMD_1
#echo $RTCMD_2
#echo $RTCMD_3

# MAIN
if [[ -e "$DATARUN".rt && ! -e "$DATARUN"_T.root ]]; then eval $RTCMD_1; fi
eval $RTCMD_2
eval $RTCMD_3

# all pau!   )
exit 0
