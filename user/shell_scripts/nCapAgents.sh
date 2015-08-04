#!/bin/bash
# nCapAgents -- process a FILENAME.n0.dat file* for capturing-agent statistics
#	*i.e., output from $ROOTSYS/macros/NeutronCaptures.cxx
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #



## init 

# bookkeeping
BASENAME=$(basename $1 .n0.dat)

# check four output filename; otherwise default to basename of input file
if [ $2 ]; then
  OUTPUTFILE=$2
else
  echo "No output filename specified; using $BASENAME"
  OUTPUTFILE=$BASENAME
fi

# don't overwrite existing files without confirmation
if [ -e ./$OUTPUTFILE.cap -o -e ./gam ]; then
# if [ ! $3 ]; then
    echo "WARNING: Output files will be overwritten. Continue? (y/n)"
    read CONTINUE
    if [ $CONTINUE == "y" ]; then echo "OK"; # do nothing
      else
      echo "Exiting." && exit 2
    fi
# else echo "nCapAgents.sh: 3rd argument given; assuming batch mode." # && do nothing
# fi
fi

# prepare folder for $agent.gam files
mkdir gam

# check for 'awk' & 'bc' programs
if [ $(which bc) ]; then isbc=true
  else isbc=false
fi
if [ $(which awk) ]; then awkprogram=awk
  elif [ $(which gawk) ]; then awkprogram=gawk
  elif [ $(which mawk) ]; then awkprogram=mawk
  else echo "ERROR: No awk program found. Go download awk, gawk, or mawk from your repositories. You'll be glad you did.   )"; exit 1
fi

echo "init complete" #debugging 

## get capture info

# determine total number of captures
total_captures=$(grep "Capture: " $1 | wc -l)
echo "Total Captures: $total_captures" #debugging

# process full capture list into BASH array of unique capture-agent names
agent_names=( $( $awkprogram '$1 ~ /Capture:/ {print $2}' $1 | sort | uniq ) )
echo "Capture Agents: ${agent_names[*]}" #debugging

# get totals (and percentages, if bc is available) for each agent
k1=0
for agent in ${agent_names[*]}; do
  agent_totals[$k1]=$(grep $agent $1 | wc -l)
  $awkprogram -F : -v agent=$agent '$2 ~ agent {printf $2"\t"; getline; printf $2"\t"; getline; print $2}' $1 > ./gam/$agent.gam
  if [ $isbc = true ]; then agent_pcts[$k1]=$(echo "${agent_totals[$k1]} / $total_captures * 100" | bc -l); fi
  echo "$agent data complete" #debugging
  ((k1++))
done


echo "gam done" #debugging

## print results

echo "beginning ./$OUTPUTFILE.cap" #debugging

printf "TOTAL: %i\n\n" $total_captures >> ./$OUTPUTFILE.cap

for (( k2=0; k2<k1; k2++ )); do
  if [ $isbc = true ]; then
    printf "%s: %i %2.2f%%\n" ${agent_names[$k2]} ${agent_totals[$k2]} ${agent_pcts[$k2]} >> ./$OUTPUTFILE.cap
  else
    printf "%s:\t%i / %i\n" ${agent_names[$k2]} ${agent_totals[$k2]} $total_captures >> ./$OUTPUTFILE.cap
  fi
done

printf "\n\n" >> ./$OUTPUTFILE.cap


# all pau!   )
exit 0
