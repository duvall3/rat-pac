#!/bin/bash
# reanalyze_batch_job.sh -- rerun preparation and analysis on a set of
#   batch-job subdirectories
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

# NOTE: run in batch-job master/umbrella directory

# usage
if [[ $# -lt 1 ]]; then
  echo -e "\nUSAGE: reanalyze_batch_job.sh <DATARUN_NAME> <EVENTS_PER_JOB> [GRAPHICS_TF]\n"
  exit 10
fi

# init
DATARUN_NAME=$1
EVENTS_PER_JOB=$2
# default to no graphics for batch subsets
GRAPHICS_TF=${3:-false}

# MAIN
echo -e "\n/// Reanalyzing batch jobs in $DATARUN_NAME... ///\n"
for DIR in $DATARUN_NAME_*/; do
  cd $DIR
  mv -t . $DIR/*
  rmdir ./$DIR/
  prepare_rat_run.sh $(basename $(pwd)) $EVENTS_PER_JOB $GRAPHICS_TF
  cd ..
done

# remake TChain
chain.sh

# all pau!   )
echo -e "\n/// Batch job reanalysis complete. You are now ready to run duvallAnalyze.cxx on the new $DATARUN_NAME TChain. ///\n\n"
exit 0
