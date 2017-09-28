#!/bin/bash
# batch_jobs -- script to generate MSUB job scripts
# -- usage: batch_jobs.sh <BATCH_NAME> <EXPERIMENT> <NUMBER_OF_JOBS> <EVENTS_PER_JOB>
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2017 ~ #



## init

# check args
if [ $# -lt 4 ]; then
  echo -e "\nUsage: batch_jobs.sh <BATCH_NAME> <EXPERIMENT> <NUMBER_OF_JOBS> <EVENTS_PER_JOB>\n"
  exit 100
fi

# pass args
BATCH_NAME=$1
EXPERIMENT=$2
NUMBER_OF_JOBS=$3
EVENTS_PER_JOB=$4



## MAIN

DIR_NAME=$BATCH_NAME"_jobs"
mkdir $DIR_NAME

# job scripts:

for (( k=1; k<=$NUMBER_OF_JOBS; k++ )) {
  
  JOB_NAME=$BATCH_NAME"_"$k"of"$NUMBER_OF_JOBS
  LOG_NAME=$JOB_NAME".log"

  echo -e "\
#!/bin/bash
#MSUB -N $JOB_NAME					 	# name of job
#MSUB -A adg							# sets bank account
#MSUB -l nodes=1:ppn=1,walltime=23:59:59,partition=borax	# uses 1 node
#MSUB -d $RATROOT/data/$EXPERIMENT/				# sets working directory
#MSUB -o $RATROOT/data/$EXPERIMENT/$LOG_NAME			# sets outfile
#MSUB -q pbatch							# pool
#MSUB -V
#MSUB								# no more psub commands

# script generated by $USER on $HOSTNAME at $(date)

source /g/g19/duvall3/.bashrc
export G4NEUTRONHP_USE_ONLY_PHOTONEVAPORATION=1

$RATROOT/user/shell_scripts/ratrun.sh $JOB_NAME $EVENTS_PER_JOB neutron

# all pau!   )" > $DIR_NAME/$JOB_NAME".sh" && chmod 755 $DIR_NAME/$JOB_NAME".sh"

}


# master script:

echo "#!/bin/bash" > $DIR_NAME/submit_jobs.sh && chmod 755 $DIR_NAME/submit_jobs.sh
echo -e "# script generated by $USER on $HOSTNAME at $(date)\n" >> $DIR_NAME/submit_jobs.sh

for JOB in $DIR_NAME/"$BATCH_NAME"*.sh; do
  echo "echo -e \"$(basename $JOB)\t\$(msub $(basename $JOB) | tr -d '\n')\" >> job_ids.txt" >> $DIR_NAME/submit_jobs.sh
done

echo -e "\nchmod 644 job_ids.txt\n\n# all pau!   )" >> $DIR_NAME/submit_jobs.sh



## all pau!   )
exit 0
