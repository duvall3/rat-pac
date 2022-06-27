#!/bin/bash
# tree2txt -- convert a ROOT tree to a labeled ASCII table
# -- USAGE: tree2txt.sh <INFILENAME> [TREENAME] [OUTFILENAME]
# -- Defaults: TREENAME = "T", OUTFILENAME = INFILENAME - ".root" + "_TREENAME.txt"
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2022 ~ #

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

# arg and awk check
if [ $# -lt 1 ]; then
  echo "USAGE: tree2txt.sh <INFILENAME> [TREENAME] [OUTFILENAME]"
  exit 2
fi
if [[ ! $(type awk 2> /dev/null) ]]; then
  if [[ ! $(type gawk 2> /dev/null) ]]; then
    echo "ERROR: No AWK program (awk or gawk) found. Do yourself a favor and go install AWK."
    exit 10
  else
    AWK=$(which gawk)
  fi
else
  AWK=$(which awk)
fi

# process args
INFILENAME=$1
TREENAME=${2:-T}
OUTFILENAME=${3:-${INFILENAME%.root}_$TREENAME.txt}

# init
ROOTCMD="root -q -l -b 'tree2txt.cxx(\"$INFILENAME\", \"$TREENAME\", \"$OUTFILENAME\")'"
VIMCMD="'vim' $OUTFILENAME -Es \
  -c 1d \
  -c 2d \
  -c %s_\*__g \
  -c \"%s_Row\ \ _\ \ Row_\"
  -c wq"

# debug
# echo $ROOTCMD
# echo $VIMCMD
# echo

# MAIN
eval $ROOTCMD
EXIT_STATUS=$?
eval $VIMCMD

# debug
# echo $EXIT_STATUS

# all pau!   )
SUCCESS_MSG="\n\nTree-to-text conversion complete!\nOutput written to file \"$OUTFILENAME\".\nIf desired, you may now open Octave/MATLAB and use 'run import_labeled_data' to import the data."
if [ $EXIT_STATUS -eq 0 ]; then
  echo -e $SUCCESS_MSG
  exit 0
else
  echo "Finished, with errors."
  exit $EXIT_STATUS
fi


