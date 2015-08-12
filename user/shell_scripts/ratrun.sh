#!/bin/bash
# ratrun -- master script to configure & execute macros for a RAT-PAC run (incl. data extraction from ROOT tree)
# usage:  ratrun [FILENAME] [NUM_EVENTS]
#	-- FILENAME is the *base* name (i.e., no extension) for the output folder/files
#	-- NUM_EVENTS is the number of events to be run (i.e., passed to the '/run/beamOn' command)
#	-- if either is unspecified, the user will be prompted, so make sure to specify these on the command line
#		if you want to run in batch mode
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #


echo
printf "\n### RAT RUN ###\n\n"
printf "!REMINDER: Set parameter for c.GoChild() in $ROOTSYS/macros/NeutronCaptures.cxx if needed.\n"
printf "!Warning: This script will replace the current version of './run.mac'. Type <Ctrl-C> now if you wish to abort.\n"

# argument check / get info:
if [ $1 ]; then
  FILENAME=$1
  else
    printf "\nEnter file basename for this run: "
    read FILENAME
fi
if [ $2 ]; then
  NUM_EVENTS=$2
  else
    printf "\nEnter number of events: "
    read NUM_EVENTS
fi

printf "\n\n### Beginning run...\n\n"

# create new run.mac
echo "\
/control/execute setup.mac
/rat/procset file \"$FILENAME.root\"
/run/beamOn $NUM_EVENTS\
" > run.mac

# create conflog && run rat
conflog.sh > "$FILENAME".conf && rat run.mac

# rename log file -- ASSUMING NO OTHER LOG FILES ARE CREATED IN LOCAL DIRECTORY DURING RUN!!!
LOGFILE=$(basename $(ls -ltr *.log | tail -1 | awk '{print $NF}') .log)
rename s/$LOGFILE/$FILENAME/ ./$LOGFILE.log

# process neutron-capture information
ROOTFILE="$FILENAME".root
ROOTCOMMAND=$(printf "'NeutronCaptures.cxx(\"$ROOTFILE\",$NUM_EVENTS)'")
eval "root -q -l -b $ROOTCOMMAND > \"$FILENAME\".n0.dat"
n0_dat_to_txt.sh "$FILENAME".n0.dat | column -t > "$FILENAME".txt
nCapAgents.sh "$FILENAME".n0.dat
plot_gammas_mfile.sh $FILENAME
n0_dat_to_sc.sh "$FILENAME".n0.dat

# make output directory & move all the new output files there
mkdir $FILENAME
mv -t $FILENAME $FILENAME.* gam/ plot_gammas.m scatters


## reminder
echo "Reminder: Move output to storage if desired."

## all pau!  )
exit 0
