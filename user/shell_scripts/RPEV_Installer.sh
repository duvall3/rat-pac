#!/bin/bash
# RPEV_Installer.sh -- simple installer script for Mark Duvall's RATPACEventViewer
# -- USAGE: RPEV_Installer.sh [PREFERRED_ROOTSYS]
# -- see https://github.com/duvall3/rat-pac/blob/collab/user/README_RATPACEventViewer.md
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/2020 ~ Updated 6/21 #


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


# get ROOTSYS and set INSTALL_DIR
if [ $1 ]; then ROOTSYS=$1; fi
if [ -z $ROOTSYS ]; then
  echo -e '\nError: No $ROOTSYS found or given. Please either set this environment variable or provide it on the command line.\n'
  exit 10
fi
INSTALL_DIR=$ROOTSYS/macros

# download files
wget -P $INSTALL_DIR https://github.com/duvall3/rat-pac/raw/collab/user/README_RATPACEventViewer.md
FILE_LIST=(RATPACEventViewer.cxx rpevFunctions.cxx)
for FILE in ${FILE_LIST[*]}; do
  wget -P $INSTALL_DIR https://github.com/duvall3/rat-pac/raw/collab/user/root_macros/$FILE
done

# all pau!   )
exit 0
