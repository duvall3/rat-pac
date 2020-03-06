#!/bin/bash
# chkbd3.sh -- simple script to quickly handle 3D checkerboarding
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/2020 ~ #

DIRNAME=$(pwd)
EXPNAME=$(basename $DIRNAME)

FILENAME="$EXPNAME".geo
COPYNAME="$EXPNAME"_temp.geo

cp $FILENAME $COPYNAME
awk -f $RATROOT/user/shell_scripts/checkerboard3d.awk $COPYNAME > $FILENAME
rm $COPYNAME

# all pau!   )
exit 0
