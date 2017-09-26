#!/bin/bash
#MSUB -N msub_rat-pac_test3	# name of job
#MSUB -A adg			# sets bank account
#MSUB -l nodes=1:ppn=1,walltime=23:59:59,partition=borax	# uses 1 node
#MSUB -q pbatch			# pool
#MSUB -o /usr/gapps/adg/geant4/rat_pac_and_dependency/duvall3/comparison/data/songs/msub_rat-pac_test3.log
#MSUB -d /usr/gapps/adg/geant4/rat_pac_and_dependency/duvall3/comparison/data/songs/
#MSUB -V
#MSUB		# no more psub commands

source /g/g19/duvall3/.bashrc
export G4NEUTRONHP_USE_ONLY_PHOTONEVAPORATION=1

/usr/gapps/adg/geant4/rat_pac_and_dependency/duvall3/comparison/user/shell_scripts/ratrun.sh msub_rat-pac_test3 1000 neutron

# all pau!   )
exit 0
