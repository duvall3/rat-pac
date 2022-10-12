#!/bin/bash
# process_rat_run_template -- TEMPLATE FOR: prepare and analyze data from a RAT-PAC (IBD) run
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

### FOR TEMPLATE VERION ONLY ###

## usage
if [ $# -lt 2 ]; then
  echo -e "\nUSAGE: process_rat_run_template.sh <DATARUN_NAME> <NUM_EVENTS>\n" && exit 10
fi

## init
BASENAME=$1
NUM_EVENTS=$2
EXAMPLE_TF=${EXAMPLE_TF:-false} # get flag from environment
LOGFILE="$BASENAME".log
ROOTFILE="$BASENAME".root

# template-only code
echo -e "### process_rat_run_template.sh ###\n"
echo -e "DATARUN_NAME: $BASENAME\nNUM_EVENTS: $NUM_EVENTS\nEXAMPLE_TF: $EXAMPLE_TF\nROOTFILE: $ROOTFILE\n"
ROOTCMD="root -q -l -b 'analysisMacroTemplate.cxx(\"$ROOTFILE\", $NUM_EVENTS, $EXAMPLE_TF)'" # do
echo -e "ROOTCMD: $ROOTCMD\n"

# all pau!   )
exit 0

### END TEMPLATE-ONLY SECTION ###


### ACTUAL CODE STARTS HERE ###


## usage
if [ $# -lt 2 ]; then
  echo -e "\nUSAGE: process_rat_run_template.sh <DATARUN_NAME> <NUM_EVENTS>\n" && exit 10
fi

## init
BASENAME=$1
NUM_EVENTS=$2
EXAMPLE_TF=${EXAMPLE_TF:-false} # get flag from environment
LOGFILE="$BASENAME".log
ROOTFILE="$BASENAME".root

## main
# root 'analysisMacroTemplate.cxx("$ROOTFILE", $NUM_EVENTS, $EXAMPLE_TF)' # do not do
ROOTCMD="root -q -l -b 'analysisMacroTemplate.cxx(\"$ROOTFILE\", $NUM_EVENTS, $EXAMPLE_TF)'" # do
echo $ROOTCMD #debug
eval $ROOTCMD # do

## tidying up: make output directory & move all the new output files there
mkdir $BASENAME
mv -t $BASENAME $BASENAME?*

# all pau!  )
exit 0
