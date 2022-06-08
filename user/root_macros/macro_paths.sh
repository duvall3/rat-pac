#!/bin/bash
# macro_paths.sh -- simple script to assist with installation
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

# init
ABS_PATH=$(pwd -P)
if [ $ABS_PATH = $(realpath $RATROOT/user/root_macros) ]; then
  MACRO_PATH='$(RATROOT)/user'
else  
  MACRO_PATH=$ABS_PATH
fi
UTIL_PATH=$MACRO_PATH"/util"
PATHSTR=":$MACRO_PATH:$UTIL_PATH"
# echo -e "$ABS_PATH\n$MACRO_PATH\n$UTIL_PATH\n$PATHSTR" #debug

# MAIN
echo -e "\nTo make these macros available to ROOT:
  1) Open your .rootrc file (or create one if necessary)
  2) Find or create the MacroPath line, which should look something like this:
	Unix.*.Root.MacroPath:   .:\$(ROOTSYS)/macros
  3) Add \"$PATHSTR\" to the end of this line, so that it looks more like this:
	Unix.*.Root.MacroPath:   .:\$(ROOTSYS)/macros$PATHSTR
"

# all pau!   )
exit 0
