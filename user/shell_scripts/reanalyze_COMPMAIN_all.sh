#!/bin/bash
# reanalyze_COMPMAIN_all -- simple script to run $RATROOT/user/root_macros/duvallAnalyze.cxx
#   on all primary COMPMAIN datasets
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2021 ~ #

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
RESULTS_DIR=$RATROOT/data/COMPMAIN_RESULTS/ROOT_files
ANALYSIS_OPTIONS=()

## MAIN

for LINK in $RESULTS_DIR/*; do

  # datarun init
  FILE=$(readlink $LINK)
  DATARUN_DIR=$(dirname $FILE)
  DATARUN_NAME=$(basename $FILE _results.root)
  EXPERIMENT=$(echo $FILE | /usr/bin/grep -iEo ".*/data/[[:alnum:]-]+" | awk -F / '{print $NF}')
  ANALYSIS_OPTIONS=("\"$DATARUN_NAME\"," "true,")
  EXIT_STATS=()
  cd $DATARUN_DIR

  # individual experiment settings
  case EXP_MATCH in
    first)
      ...
      ;;
    second)
      ...
      ;;
    *)
      ...
      ;;
  esac

  # run analysis
  ROOT_COMMAND="root -q -l -b 'duvallAnalyze.cxx(${ANALYSIS_OPTIONS[*]})'"
# eval $ROOT_COMMAND
  echo -e "$FILE\n$EXPERIMENT\n${ANALYSIS_OPTIONS[*]}\n" #debug
  echo $ROOT_COMMAND #debug
  EXIT_STATS=(${EXIT_STATS[*]} $?)

  # reset options
  ANALYSIS_OPTIONS=()

done

# update links
update_COMPMAIN_results.sh
EXIT_STATS=(${EXIT_STATS[*]} $?)

## all pau!   )
if [[ $(( $(echo ${EXIT_STATS[*]} | tr " " "+") )) -gt 0 ]]; then
  echo -e "Reanalysis finished, with errors.\nExit statuses:"
  k=0
  column -t <(
  for LINK in $RESULTS_DIR/*; do
    echo -e $LINK "\t" ${EXIT_STATS[k]} "\n"
    ((k++))
  done
  NUM_STATS=${#EXIT_STATS[*]}
  echo -e "update_COMPMAIN_results.sh\t${EXIT_STATS[$NUM_STATS-1]}"
  )
  exit 2
else
  echo -e "\nReanalysis complete!\n\n"
  exit 0
fi

# if [[ $EXPERIMENT =~ "chooz" ]]; then ANALYSIS_OPTIONS=(${ANALYSIS_OPTIONS[*]} "\"\"," "\"xyz\""); fi
# if [[ $EXPERIMENT =~ "santa" ]]; then ANALYSIS_OPTIONS=(${ANALYSIS_OPTIONS[*]} "\"xz\"," "\"y\""); fi
# if [[ ($EXPERIMENT =~ "nulat") || ($EXPERIMENT =~ "3d") ]]; then ANALYSIS_OPTIONS=(${ANALYSIS_OPTIONS[*]} "\"xyz\""); fi
# if [[ $EXPERIMENT =~ "sandd" ]]; then ANALYSIS_OPTIONS=(${ANALYSIS_OPTIONS[*]} "\"xy\"," "\"z\"," "true"); fi
