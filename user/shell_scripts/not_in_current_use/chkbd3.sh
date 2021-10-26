#!/bin/bash
# chkbd3.sh -- simple script to quickly handle 3D checkerboarding
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/2020 ~ #

DIRNAME=$(pwd)
EXPNAME=$(basename $DIRNAME)

FILENAME="$EXPNAME".geo
COPYNAME="$EXPNAME"_temp.geo

#awkprogram=$(which gawk)
#if [[ -z $awkprogram ]]; then awkprogram=$(which awk)

awkprogram=$(which awk)

echo $awkprogram #debug

cp $FILENAME $COPYNAME
$awkprogram -f $RATROOT/user/shell_scripts/checkerboard3d.awk $COPYNAME > $FILENAME
rm $COPYNAME

# all pau!   )
exit 0
