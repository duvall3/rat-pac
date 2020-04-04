#!/bin/bash
# eff_checks.sh -- calculate total efficiencies from a (batch-distributed) run
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 4/2020 ~ #

# init
DATARUN=$(basename $(pwd) /)

# loop over subdirectories
for DIR in */; do
  FILE=$(basename $DIR /)
  ROOTCMD="root -q -l -b 'effCheck.cxx(\"${DIR}${FILE}.root\")'"
  eval $ROOTCMD >> eff_checks_$DATARUN
done

# process results
cp eff_checks_$DATARUN eff_checks_$DATARUN~
TOTAL=$(cat eff_checks_$DATARUN~ | awk '$1 ~ /events/ {print $4}' | add_list.sh)
mv eff_checks_$DATARUN~ eff_checks_$DATARUN

# append result
echo -e "\n\n## TOTAL:\t\t$TOTAL ##\n\n" >> eff_checks_$DATARUN

# all pau!   )
exit 0
