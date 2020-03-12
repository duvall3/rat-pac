#!/bin/bash
# RPEV_Installer.sh -- simple installer script for Mark Duvall's RATPACEventViewer
# -- USAGE: RPEV_Installer.sh [PREFERRED_ROOTSYS]
# -- see https://github.com/duvall3/rat-pac/blob/collab/user/README_RATPACEventViewer.md
#      for more information
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/2020 ~ #

# get ROOTSYS and set INSTALL_DIR
if [ $1 ]; then
  ROOTSYS=$1
fi
if [ -z $ROOTSYS ]; then
  echo -e '\nError: No $ROOTSYS found or given. Please either set this environment variable or provide it on the command line.\n'
  exit 10
fi
INSTALL_DIR=$ROOTSYS/macros

# download files
cd $INSTALL_DIR
wget https://github.com/duvall3/rat-pac/raw/collab/user/README_RATPACEventViewer.md
FILE_LIST=(RATPACEventViewer.cxx drawTracks.cxx drawNextEvent.cxx drawPrevEvent.cxx highlightCells.cxx)
for FILE in ${FILE_LIST[*]}; do
  wget https://github.com/duvall3/rat-pac/raw/collab/user/root_macros/$FILE
done

# all pau!   )
exit 0
