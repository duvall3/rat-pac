#!/bin/bash
# fast_neutron_background -- master script to prepare a file of HEPEVT-formatted events for MC simulation
# -- usage: fast_neutron_background.sh [NUMBER_OF_EVENTS]
# ~ by Mark J. Duvall ~ mjduvall@hawaii.edu ~ March 2016 ~


if [ -z $1 ]; then
  NHEP=10000 # NUMBER_OF_EVENTS defaults to 10k
else
  NHEP=$1
fi

echo "Generating neutron events..."
OCT_CODE="octave --eval \"NHEP = $NHEP; savefile='$PWD/hepevt.txt'; run $RATROOT/user/m_files/backgrounds/neutron_generator\""
#OCT_CODE="matlab -nosplash -nodisplay -nodesktop -r \"NHEP = $NHEP; savefile='$PWD/hepevt.txt'; run $RATROOT/user/m_files/backgrounds/neutron_generator\"; quit"
eval $OCT_CODE
#echo $OCT_CODE
$RATROOT/user/shell_scripts/txt_to_hepevt.sh


# all pau!   )
echo "Done."
exit 0
