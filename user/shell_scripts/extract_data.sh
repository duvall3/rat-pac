#!/bin/bash
# extract_data.sh -- Extract either reference data or test data from batch run in DIRECTORY (default: current directory).
#   This script will attempt to detect whether the directory contains reference data or test data,"
#   but either routine can be set manually using the '-r' and '-t' options for reference data and test data, respectively."
# USAGE: extract_data.sh [-h|-r|-t] [DIRECTORY]
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 06/2023 ~ #

# Copyright (C) 2023 Mark J. Duvall / T. Rocks Science
# 
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 


## INIT

# general
NULL=/dev/null
ERR=/dev/stderr

# control for aliases
ECHO="$(which echo) -e"

# define usage
usage() {
  $ECHO "Usage: extract_data.sh [-h|-r|-t] [DIRECTORY]"
  $ECHO "Extract either reference data or test data from batch run in DIRECTORY (default: current directory)."
  $ECHO "  This script will attempt to detect whether the directory contains reference data or test data,"
  $ECHO "  but either routine can be set manually using the '-r' and '-t' options for reference data and test data, respectively."
  $ECHO
  $ECHO "Options:"
  $ECHO "  -h\tShow this help message and exit"
  $ECHO "  -r\tForce reference-data routine"
  $ECHO "  -t\tForce test-data routine"
  $ECHO
}

# process options
ROUTINE=TBD
FORCE_ROUTINE=false
while getopts "hrt" OPTIONS; do
  case $OPTIONS in
    h)
      usage
      exit 10
      ;;
    r)
      FORCE_ROUTINE=true
      ROUTINE=r
      ;;
    t)
      FORCE_ROUTINE=true
      ROUTINE=t
      ;;
    *)
      $ECHO
      usage
      exit 11
      ;;
  esac
done
# shift $((OPTIND-1)) # uncomment for options with args

# process arg(s)
DIR=${1:-.}


## MAIN

# ls -lhd $DIR #debug

# if no routine has been forced, attempt to auto-detect routine based on file/directory name(s)
if ! $FORCE_ROUTINE; then
  $ECHO "Determining routine from file/directory name(s)..."
  #TODO
  $ECHO "Routine set: $ROUTINE"
fi

#debug
$ECHO $DIRECTORY

# execute extraction routine
if [[ $ROUTINE = "r" ]]; then
  $ECHO "Extracting reference data..."
  ROOTCMD="root -q -l -b 'extractRef(\"$DIR\")'"
  EXIT_STATUS=$?
elif [[ $ROUTINE = "t" ]]; then
  $ECHO "Extracting test data..."
  for DIR in $DIRECTORY??*/; do
    DIR=${DIR%/}
    ROOTCMD="root -q -l -b 'extractTest(\"$DIR\",kTRUE)'"
    # echo $ROOTCMD #debug
    eval $ROOTCMD
  done
  EXIT_STATUS=$?
elif [[ $ROUTINE = "TBD" ]]; then
  $ECHO "Routine undetermined. Exiting..."
  exit 9
else
  $ECHO "Error: Unrecognized routine \"$ROUTINE\". Exiting..." > $ERR	# shouldn't be possible, but just in case
  # EXIT_STATUS=3
  exit 3
fi


## EXIT

# all pau!   )
EXIT_STATUS=${EXIT_STATUS:-0}
if [ $EXIT_STATUS -eq 0 ]; then
  $ECHO 'Done!'
else
  $ECHO 'Exiting with error(s).'
fi
exit $EXIT_STATUS

