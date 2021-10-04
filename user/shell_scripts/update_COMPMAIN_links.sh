#!/bin/bash
# update_COMPMAIN_links -- EWISotT
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
GREP=$(which grep)
AWK=$(which awk); AWK=${AWK:-$(which mawk)}; AWK=${AWK:-$(which gawk)}
#RESULTS_FILE_PATTERN='COMPMAIN*10?_results.root'
#RESULTS_EXCLUDE_PATTERN='(005LI-6)|(pert)|(shielded)'
#RESULTS_ORIG_FILES=( $( find $RATROOT/data/*/* -type f -name "$RESULTS_FILE_PATTERN" | $GREP -iEv $RESULTS_EXCLUDE_PATTERN ) )
RESULTS_ROOT_DIR=$RATROOT/data/COMPMAIN_RESULTS/ROOT_files
RESULTS_BY_EXP_DIR=$RATROOT/data/COMPMAIN_RESULTS/by_experiment
RESULTS_BY_PLOT_DIR=$RATROOT/data/COMPMAIN_RESULTS/by_plot_type
RESULTS_ORIG_FILES=( $(find $RESULTS_ROOT_DIR -type l ! -xtype l -name "*.root") )
CANVASES=(c{0..3} c3_with-geo c{4..8})
PLOT_NAMES=("_geo_scale" "_bursts" "_nu-trg" "_pd-xyz" "_pd-xyz-with-geo" "_results-ang-separate" "_results-cos-psi" "_results-skymap" "_cap-prod" "_results-phi-radar")

## MAIN

# update ROOT-file and by_experiment links
for LINK in ${RESULTS_ORIG_FILES[*]}; do
  # init
  FILE=$(readlink $LINK)
  FILE_DIR=$(dirname $FILE)
  DATARUN_NAME=$(basename $FILE _results.root)
  EXPERIMENT=$(echo $FILE | $GREP -iEo ".*/data/[[:alnum:]-]+" | $AWK -F / '{print $NF}')
  # geo_scale file
  for GEO_FILE in $RATROOT/data/$EXPERIMENT/*_geo_scale.png; do
    if [[ -e $GEO_FILE && ! -L $RESULTS_BY_EXP_DIR/$EXPERIMENT/$(basename $GEO_FILE) ]]; then ln -s $GEO_FILE $RESULTS_BY_EXP_DIR/$EXPERIMENT/; fi
  done
# # ROOT file
# if [[ ! -L $RESULTS_ROOT_DIR/$(basename $FILE) ]]; then ln -s $FILE $RESULTS_ROOT_DIR/; fi
  # by_experiment
  for PLOT_FILE in $FILE_DIR/COMPMAIN*.png; do
    if [[ -e $PLOT_FILE && ! -L $RESULTS_BY_EXP_DIR/$EXPERIMENT/$(basename $PLOT_FILE) ]]; then ln -s $PLOT_FILE $RESULTS_BY_EXP_DIR/$EXPERIMENT/; fi
  done
done

# update by_plot_type links
for k in {0..9}; do
  PLOT_LINK_DIR=${CANVASES[k]}
  PLOT_TYPE=${PLOT_NAMES[k]}
  PLOT_PATTERN=$(echo "*"$PLOT_TYPE".png")
  for FILE in $(find $RESULTS_BY_EXP_DIR -name "$PLOT_PATTERN"); do
    if [[ -e $FILE && ! -L $RESULTS_BY_PLOT_DIR/$PLOT_LINK_DIR/$(basename $FILE) ]]; then ln -s -t $RESULTS_BY_PLOT_DIR/$PLOT_LINK_DIR/ $FILE; fi
  done
done

# all pau!   )
exit 0
