#!/bin/bash
# ratrun -- master script to configure & execute macros for a RAT-PAC run (incl. data extraction from ROOT tree)
# usage:  ratrun [FILENAME] [NUM_EVENTS] [SEDAQ_GRAPHICS_TF] [QUANTIZED_POSITIONS] [POSITION_RESOLUTIONS]"
#	-- FILENAME is the *base* name (i.e., no extension) for the output folder/files
#	-- NUM_EVENTS is the number of events to be run (i.e., passed to the '/run/beamOn' command)
#	-- if either of these is unspecified, the user will be prompted, so make sure to specify these on the command line
#		if you want to run in batch mode
#	-- SEDAQ_GRAPHICS_TF is a flag passed to SEDAQ.cxx for whether to create plots
#		-- this defaults to false (for batch-mode operation)
#	-- QUANTIZED_POSITIONS is a string (no quotes) consisting of some combination of {x,y,z}
#			that specifies the axes along which the detector is segmented
#		-- for non-segmented detectors, simply enter two double-quotes ("")
#		-- for partially- or fully-segmented detectors that use the center-position of a cell to determine
#	   	   scintillation position, enter the segmentation axes
#		-- segmented detectors with sub-cell position resolution are not yet supported
#	-- POSITION_RESOLUTIONS is a string (no quotes) consisting of some combination of {x,y,z}
#			that specifies the axes along which to apply Gaussian noise to emulate
#			realistic position (see the parameter "positionResolution"
#			in user/root_macros/particleTracksToScint.cxx)
#		-- this parameter should contain any {x,y,z} not specified in QUANTIZED_POSITIONS
#	-- Example 1: To simulate and analyze a datarun: 1) called "test_1", 2) with 1000 events, 3) with graphics output,
#		for a detector 4) segmented in x & y but 5) not in z, invoke the script as follows:
#			user@host:~$ ratrun.sh test_1 1000 true xy z
#	-- Example 2: Same as the above, but for a fully-segmented detector:
#			user@host:~$ ratrun.sh test_1 1000 true xyz
#	-- Example 3: Same as the above, but for a non-segmented detector:
#			user@host:~$ ratrun.sh test_1 1000 true "" xyz
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ Updated 6/22 ~ v2.0.1 ~ #


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
  echo -e "\nUsage: ratrun.sh <FILENAME> [NUM_EVENTS] [SEDAQ_GRAPHICS_TF] [QUANTIZED_POSITIONS] [POSITION_RESOLUTIONS]\n"
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
if [ $3 ]; then
  SEDAQ_GRAPHICS_TF=$3
else
  SEDAQ_GRAPHICS_TF=false
fi
if [ $4 ]; then
  QUANTIZED_POSITIONS=$4
else
  QUANTIZED_POSITIONS=""
fi
if [ $5 ]; then
  POSITION_RESOLUTIONS=$5
else
  POSITION_RESOLUTIONS=""
fi


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

# create conflog && run rat
echo -e "\n\n### Beginning RAT-PAC run...\n\n"
conflog.sh > "$FILENAME".conf && rat -l "$FILENAME".log run.mac

# export settings
export SEDAQ_GRAPHICS_TF QUANTIZED_POSITIONS POSITION_RESOLUTIONS

# process run data
process_rat_run.sh $FILENAME $NUM_EVENTS

# reminder
echo -e "Reminder: Move output to long-term storage if desired.\n"


## all pau!  )
exit 0
