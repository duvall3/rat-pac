#!/bin/bash
# eff_checks.sh -- calculate total efficiencies from a (batch-distributed) run
#   -- USAGE: eff_checks.sh $FILENAME to run AWK section on file, OR:
#             eff_checks.sh	      to execute full processing of subdirectories
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 4/2020 ~ #


# detect datarun name
DATARUN=$(basename $(pwd) /)
FULLFILE=eff_checks_$DATARUN

# include alternate detector-volume regex if provided
if [[ $1 ]]; then
  ROOT_OPT_ARG=", \"$1\""
else
  ROOT_OPT_ARG=""
fi

# check whether results only need to be processed
if [[ -f $FULLFILE ]]; then
  # backup if file exists
  echo "$FULLFILE exists; backing up."
  cp $FULLFILE $FULLFILE.backup
  echo "Backed up at $(date) by $USER via $0." >> $FULLFILE.backup
fi

# generate results if file does not exist
if [[ ! -f $FULLFILE ]]; then
  for DIR in */; do
    FILE=$(basename $DIR /)
    ROOTCMD="root -q -l -b 'effCheck.cxx(\"${DIR}${FILE}.root\"${ROOT_OPT_ARG})'"
    eval $ROOTCMD >> $FULLFILE
  done
fi

# process results
TOTAL=$(cat $FULLFILE | awk '$1 ~ /events/ {print $4}' | add_list.sh)

# append and print result
echo -e "\n\n## TOTAL:\t\t$TOTAL ##" >> $FULLFILE
echo && tail -n 1 $FULLFILE && echo

# all pau!   )
exit 0
