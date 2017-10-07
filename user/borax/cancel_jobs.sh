#!/bin/bash
# cancel_jobs -- cancel all jobs the current user is running on the cluster
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ #

JOB_IDS=( $(squeue -u $USER | awk '$1 ~ /[[:digit:]]/ {print $1}') )

for JOB in ${JOB_IDS[*]}; do
  mjobctl -c $JOB
done

# all pau!   )
exit 0
