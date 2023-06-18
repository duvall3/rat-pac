#!/bin/bash
# ref_compare.sh -- workaround for ROOT crashes
# Usage: user@host:$RATROOT/data/<experiment>/.../REFDATA$ ref_compare.sh <DIRECTORY> [ANDERSON_TF=false] [VARNAME=phi]
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2022 ~ #

#Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# arg / help check
if [[ ($# -lt 1) || ($1 =~ -h) ]]; then
  echo "Usage: user@host:$RATROOT/data/<experiment>/.../REFDATA$ ref_compare.sh <DIRECTORY> [ANDERSON_TF=false] [VARNAME=phi]"
  exit 10
fi

# init
HOST=$(hostname)
DATE=$('date' -R)
TESTDIR=${1%/}
ANDERSON_TF=${2:-kFALSE}
VARNAME=${3:-phi}

# main
for FILE in $TESTDIR/*_$VARNAME.root; do
  ROOTCMD="root -q -l -b 'compareRef.cxx(\"$FILE\",$ANDERSON_TF)'"
  # echo $ROOTCMD #ebug
  eval $ROOTCMD
done

# all pau!   )
exit 0
