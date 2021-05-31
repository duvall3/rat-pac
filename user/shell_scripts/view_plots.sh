#!/bin/bash
# view_plots.sh -- simple script to view plots in order
# -- USAGE: view_plots.sh [DATARUN_NAME]
#    -- DATARUN_NAME defaults to name of current directory
#    -- Enter DATARUN_NAME without any filename extension
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 5/21 ~ #


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


# arg / usage check
if [ $# -lt 1 ]; then
  DATARUN=$(basename $(pwd) /)
else
  DATARUN=$1
fi

# init
c1="$DATARUN"_bursts
c2="$DATARUN"_nu-trg
c3="$DATARUN"_pd-xyz
c4="$DATARUN"_results-ang-separate
c5="$DATARUN"_results-ang
c6="$DATARUN"_results-skymap
c_LIST=$(echo $c{1..6}.png)

# main
eog $c_LIST &

# all pau!   )
exit 0
