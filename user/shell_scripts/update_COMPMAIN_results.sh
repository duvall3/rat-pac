#!/bin/bash
# update_COMPMAIN_results -- EWISotT
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

# init
RESULTS_DIR=$RATROOT/data/COMPMAIN_RESULTS/by_experiment
RESULTS_LINK_DIR=$RATROOT/data/COMPMAIN_RESULTS/by_plot_type
CANVASES=(c{0..3} c3_with-geo c{4..7})
PLOT_NAMES=("_geo_scale" "_bursts" "_nu-trg" "_pd-xyz" "_pd-xyz-with-geo" "_results-ang-separate" "_results-cos-psi" "_results-skymap" "_cap-prod")

# MAIN
for k in {0..8}; do
  PLOT_LINK_DIR=${CANVASES[k]}
  PLOT_TYPE=${PLOT_NAMES[k]}
  PLOT_PATTERN=$(echo "*"$PLOT_TYPE".png")
  for FILE in $(find $RESULTS_DIR -name $PLOT_PATTERN); do
    ln -s -t $RESULTS_LINK_DIR/$PLOT_LINK_DIR/ $FILE
  done
done

# all pau!   )
exit 0
