#!/bin/bash
# chkbd2.sh -- simple script to quickly handle checkerboarding
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2019 ~ #

DIRNAME=$(pwd)
EXPNAME=$(basename $DIRNAME)

FILENAME="$EXPNAME".geo
COPYNAME="$EXPNAME"_temp.geo

cp $FILENAME $COPYNAME
awk -f $RATROOT/user/shell_scripts/checkerboard2d.awk $COPYNAME > $FILENAME
rm $COPYNAME

# all pau!   )
exit 0
