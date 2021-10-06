#!/bin/bash
# reanalyze_COMPMAIN_all -- simple script to run $RATROOT/user/root_macros/duvallAnalyze.cxx
#   on all primary COMPMAIN datasets
# -- USAGE:   reanalyze_COMPMAIN_all [BATCH_TF <EVENTS_PER_JOB>]
# -- optional argument BATCH_TF defaults to FALSE and determines whether
#      to descend into the batch-job RAT-PAC/ROOT files
#      and re-extract the MC particle-track data
# -- if BATCH_TF is TRUE, then EVENTS_PER_JOB is the number of events
#      per individual batch job (defaults to 2500)
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
ANALYSIS_ARGS=()
BATCH_TF=${1:-false}
EVENTS_PER_JOB=${2:-2500}
LOGFILE=$RESULTS_DIR/rean.log
if [ -e $LOGFILE ]; then mv $LOGFILE $RESULTS_DIR/"rean_prev.log"; fi
#command > >(tee -a stdout.log) 2> >(tee -a stderr.log >&2)

## MAIN

for LINK in $RESULTS_DIR/*_results.root; do

  # datarun init
  FILE=$(readlink $LINK)
  DATARUN_DIR=$(dirname $FILE)
  DATARUN_NAME=$(basename $FILE _results.root)
  EXPERIMENT=$(echo $FILE | /usr/bin/grep -iEo ".*/data/[[:alnum:]-]+" | awk -F / '{print $NF}')
  ANALYSIS_ARGS=("\"$DATARUN_NAME\"," "true,")
  EXIT_STATS=()
  cd $DATARUN_DIR

  # re-process base-level ROOT files if specified
  if $BATCH_TF; then reanalyze_batch_job.sh $DATARUN_NAME $EVENTS_PER_JOB > >(tee $LOGFILE) 2> >(tee -a $LOGFILE >&2); fi

  # individual experiment settings
  case $EXPERIMENT in
    chooz)
      ANALYSIS_ARGS=(${ANALYSIS_ARGS[*]} "\"\"," "\"xyz\"")
      ;;
    santa)
      ANALYSIS_ARGS=(${ANALYSIS_ARGS[*]} "\"xz\"," "\"y\"")
      ;;
    nulat*|*-3d*)
      ANALYSIS_ARGS=(${ANALYSIS_ARGS[*]} "\"xyz\"")
      ;;
    sandd|*-2d*|*-ref|prospect)
      ANALYSIS_ARGS=(${ANALYSIS_ARGS[*]} "\"xy\"," "\"z\"," "true")
      ;;
    ideal)
      ANALYSIS_ARGS=(${ANALYSIS_ARGS[*]} "\"\"")
      ;;
    *)
      echo "WARNING: Experiment not recognized among pre-defined types. Proceeding with default analysis settings." > >(tee -a $LOGFILE) 2> >(tee -a $LOGFILE >&2)
      ;;
  esac

  # run analysis
  ROOT_COMMAND="root -q -l -b 'duvallAnalyze.cxx(${ANALYSIS_ARGS[*]})'"
  eval $ROOT_COMMAND > >(tee -a $LOGFILE) 2> >(tee -a $LOGFILE >&2)
# echo -e "$FILE\n$EXPERIMENT\n${ANALYSIS_ARGS[*]}" #debug
# echo $ROOT_COMMAND #debug
# echo #debug
  EXIT_STATS=(${EXIT_STATS[*]} $?)

  # reset options
  ANALYSIS_ARGS=()

done

# draw collective cos[psi] plots
root -q -l -b 'drawAllCosPsi().cxx' > >(tee -a $LOGFILE) 2> >(tee -a $LOGFILE >&2)
root -q -l -b 'drawAllCosPsi(1).cxx' > >(tee -a $LOGFILE) 2> >(tee -a $LOGFILE >&2)

# run GL fixer
fix_COMPMAIN_glbox.sh > >(tee -a $LOGFILE) 2> >(tee -a $LOGFILE >&2)

# update links
update_COMPMAIN_links.sh > >(tee -a $LOGFILE) 2> >(tee -a $LOGFILE >&2)
#echo -e "\nupdate_COMPMAIN_results.sh\n" #debug
EXIT_STATS=(${EXIT_STATS[*]} $?)

## return and report status
cd $RESULTS_DIR
if [[ $(( $(echo ${EXIT_STATS[*]} | tr " " "+") )) -gt 0 ]]; then
  echo -e "Reanalysis finished, with errors.\nExit statuses:" > >(tee -a $LOGFILE) 2> >(tee -a $LOGFILE >&2)
  k=0
  column -t <(
    for LINK in $RESULTS_DIR/*; do
      echo -e $LINK "\t" ${EXIT_STATS[k]} "\n"
      ((k++))
    done
    NUM_STATS=${#EXIT_STATS[*]}
    echo -e "update_COMPMAIN_results.sh\t${EXIT_STATS[$NUM_STATS-1]}"
  ) > >(tee -a $LOGFILE) 2> >(tee -a $LOGFILE >&2)
  exit 2
else
  echo -e "\nReanalysis complete!\n\n" > >(tee -a $LOGFILE) 2> >(tee -a $LOGFILE >&2)
  exit 0
fi
## all pau!   )
