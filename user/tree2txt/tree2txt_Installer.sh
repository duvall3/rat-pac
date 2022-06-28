#!/bin/bash
# tree2txt_Installer.sh -- simple installer script for Mark Duvall's RATPACEventViewer
# -- USAGE: tree2txt_Installer.sh
# -- see https://github.com/duvall3/rat-pac/tree/collab/user/tree2txt/
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2022 ~ #

##Copyright (C) 2022 Mark J. Duvall
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

# opening message
echo -e '\n\n# # # Downloading and installing tree2txt.
Files will be downloaded to $HOME/tree2txt/ and linked in the following directories:
Shell script: $RATROOT/user/shell_scripts or $HOME/bin
ROOT Macro: $ROOTSYS/macros or $HOME/bin
Octave/MATLAB script: $RATROOT/user/m_files or $HOME/bin\n\n'

# get/set directories
if [ ! -d $HOME/bin ]; then mkdir $HOME/bin; fi
INSTALL_DIR=$HOME/bin/tree2txt
mkdir $INSTALL_DIR
if [ -w $RATROOT/user/shell_scripts ]; then
  SHDIR=$RATROOT/user/shell_scripts
else
  SHDIR=$HOME/bin
fi
if [ -w $ROOTSYS/macros ]; then
  ROOTDIR=$ROOTSYS/macros
else
  ROOTDIR=$HOME/bin
fi
if [ -w $RATROOT/user/m_files ]; then
  MDIR=$RATROOT/user/m_files
else
  MDIR=$HOME/bin
fi

# # get/set directories -- DEBUG VERSION
# if [ ! -d $HOME/bin ]; then mkdir $HOME/bin; fi
# INSTALL_DIR=$HOME/bin/tree2txt
# mkdir $INSTALL_DIR
# SHDIR=$HOME/bin
# ROOTDIR=$HOME/bin
# MDIR=$HOME/bin

# debug
# echo -e "$INSTALL_DIR\t$SHDIR\t$ROOTDIR\t$MDIR\n"

# download files
GHPREFIX=https://github.com/duvall3/rat-pac/raw/collab/user/
cd $INSTALL_DIR
# doc
wget $GHPREFIX/tree2txt/README.md
wget $GHPREFIX/tree2txt/README.html
mkdir README.html_files
wget -P README.html_files $GHPREFIX/tree2txt/README.html_files/github-markdown.css
wget -P README.html_files $GHPREFIX/tree2txt/README.html_files/styles.css
# code
wget $GHPREFIX/shell_scripts/tree2txt.sh
wget $GHPREFIX/root_macros/util/tree2txt.cxx
wget $GHPREFIX/m_files/import_labeled_data.m

# create symlinks
ln -s $(pwd -P)/tree2txt.sh $SHDIR
ln -s $(pwd -P)/tree2txt.cxx $ROOTDIR
ln -s $(pwd -P)/import_labeled_data.m $MDIR

# finish up
cd -
echo -e "\n\n# # # Installer script finished.
If the utility doesn't work as described in the 'Usage'
section of the README, then check your paths as described
in the 'Installation > Manual' section.\n\n"

# all pau!   )
exit 0

