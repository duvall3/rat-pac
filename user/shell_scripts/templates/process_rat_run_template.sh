#!/bin/bash
# process_rat_run_template -- prepare and analyze data from a RAT-PAC (IBD) run
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2022 ~ #

#Copyright (C) 2021 Mark J. Duvall
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

## usage
if [ $# -lt 2 ]; then
  echo -e "\nUSAGE: process_rat_run.sh <DATARUN_NAME> <NUM_EVENTS>\n" && exit 10
fi

## init
BASENAME=$1
NUM_EVENTS=$2
EXAMPLE_TF=${EXAMPLE_TF:-false} # get flag from environment
LOGFILE="$BASENAME".log
ROOTFILE="$BASENAME".root

## main
ROOTCMD="root -q -l -b 'analysisMacro.cxx(\"$ROOTFILE\", $NUM_EVENTS, $EXAMPLE_TF)'"
eval $ROOTCOMMAND

## tidying up: make output directory & move all the new output files there
mkdir $BASENAME
mv -t $BASENAME $BASENAME?*

# all pau!  )
exit 0
