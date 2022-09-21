#!/bin/bash
# angle_multibatch.sh -- start a series of local_batch_jobs
#   batch runs at 1-degree increments
# Usage: angle_multibatch.sh <NAME_PREFIX> <MAX_ANGLE_DEG> [NUM_INSTANCES]
# -- NUM_INSTANCES defaults to 30
# ~ Mark J. Duvall ~ duvall3@github.com ~ 09/2022 ~ #

#Copyright (C) 2022 Mark J. Duvall
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

# arg check
USE_MSG='Usage: angle_multibatch.sh <NAME_PREFIX> <MAX_ANGLE_DEG> [NUM_INSTANCES]'
if [[ ($# -lt 2) || ($1 =~ -h) ]]; then
  echo -e $USE_MSG
  exit 10
fi

# init
NAME_PREFIX=$1
MAX_ANGLE_DEG=$2
NUM_INSTANCES=${3:-25}
# echo -e "$NAME_PREFIX\t$MAX_ANGLE_DEG\t$NUM_INSTANCES" #debug
# TODO: hard-coded for now
# EVENTS_PER_INSTANCE=1 #debug
EVENTS_PER_INSTANCE=40 #testing
# EVENTS_PER_INSTANCE=400
QUANTIZED_POSITIONS="xy"
POSITION_RESOLUTIONS="z"


# main
for (( PHI = 0; PHI <= $MAX_ANGLE_DEG; PHI++ )) {
  BATCH_NAME=$(printf "%s_%02dDEG" $NAME_PREFIX $PHI)
  SET_ANGLE_CMD=$(echo "set_angle.vim gen/ibd.mac $PHI")
  LBJ_CMD=$(echo "local_batch_jobs.sh $BATCH_NAME $EVENTS_PER_INSTANCE $NUM_INSTANCES $QUANTIZED_POSITIONS $POSITION_RESOLUTIONS")
  # echo $SET_ANGLE_CMD #debug
  eval $SET_ANGLE_CMD
  # echo $LBJ_CMD #debug
  eval $LBJ_CMD
}

# all pau!   )
exit 0
