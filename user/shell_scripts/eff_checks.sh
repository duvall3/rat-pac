#!/bin/bash
# eff_checks.sh -- calculate total efficiencies from a (batch-distributed) run
#   -- USAGE: eff_checks.sh $FILENAME to run AWK section on file, OR:
#             eff_checks.sh	      to execute full processing of subdirectories
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 4/2020 ~ #


# provide filename or let loop
if [[ $1 && $1 == "*.root" ]]; then
  FULLFILE=$1
else if [[ $1 && $1 != "*.root" ]]; then
  echo -e '\
USAGE: eff_checks.sh $FILENAME to run AWK section on file, OR:
       eff_checks.sh	      to execute full processing of subdirectories'
  echo "CHECK USAGE" >2 && exit 10
else
  DATARUN=$(basename $(pwd) /)
  FULLFILE=eff_checks_$DATARUN
  # loop over subdirectories
  for DIR in */; do
    FILE=$(basename $DIR /)
    ROOTCMD="root -q -l -b 'effCheck.cxx(\"${DIR}${FILE}.root\")'"
    eval $ROOTCMD >> $FULLFILE
  done
fi

# process results
TOTAL=$(cat $FULLFILE | awk '$1 ~ /events/ {print $4}' | add_list.sh)

# append result
echo -e "\n\n## TOTAL:\t\t$TOTAL ##\n\n" >> $FULLFILE

# all pau!   )
exit 0
