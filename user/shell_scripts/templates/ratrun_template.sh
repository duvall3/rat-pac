#!/bin/bash
# ratrun_template -- master script to configure & execute macros for a RAT-PAC run (incl. data extraction from ROOT tree)
# usage:  ratrun <FILENAME> [NUM_EVENTS] [EXAMPLE_TF]
#	-- FILENAME is the *base* name (i.e., no extension) for the output folder/files
#	-- NUM_EVENTS is the number of events to be run (i.e., passed to the '/run/beamOn' command)
#	-- if either of these is unspecified, the user will be prompted, so make sure to specify these on the command line
#		if you want to run in batch mode
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2022 ~ #

##Copyright (C) 2021 Mark J. Duvall
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <http://www.gnu.org/licenses/>.


## init

# set photon evaporation flag
export G4NEUTRONHP_USE_ONLY_PHOTONEVAPORATION=1

# argument check / get info:
if [ $# -lt 1 ]; then
  echo -e "\nUsage: ratrun_template.sh <FILENAME> [NUM_EVENTS] [EXAMPLE_TF]\n"
  exit 100
fi
echo
echo -e "\n### RAT RUN ###\n\n"
FILENAME=$1
if [ $2 ]; then
  NUM_EVENTS=$2
  else
    echo -e "\nEnter number of events: "
    read NUM_EVENTS
fi
EXAMPLE_TF=${3:-false} # default false


## configure

# create new run.mac
ROOTFILE="$FILENAME".root
echo "\
/control/execute setup.mac
/rat/procset file \"$ROOTFILE\"
/rat/proc count
/rat/procset update 1000
/run/beamOn $NUM_EVENTS\
" > run.mac


## MAIN
echo -e "\n\n### Beginning RAT-PAC run...\n\n"

# run rat
rat -l "$FILENAME".log run.mac

# export any desired setting to environment for other scripts
export EXAMPLE_TF

# process run data
process_rat_run_template.sh $FILENAME $NUM_EVENTS

# reminder
echo -e "Reminder: Move output to long-term storage if desired.\n"


## all pau!  )
exit 0
