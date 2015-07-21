#!/bin/bash
# nCapAgents -- process a DATARUN.n0 file* for capturing-agent info
#	*i.e., output from $ROOTSYS/macros/NeutronCaptures.cxx
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #



## init

# check for 'awk' & 'bc' programs
if [ $(which bc) ]; then isbc=true
  else; isbc=false
fi
if [ $(which awk) ]; then awkprogram=awk
  elif [ $(which gawk) ]; then awkprogram=gawk
  elif [ $(which mawk) ]; then awkprogram=mawk
  else; echo "ERROR: No awk program found. Go download awk, gawk, or mawk from your repositories. You'll be glad you did."; exit 1
fi



## get capture info

# determine total number of captures
total_captures=$(grep "Capture: " $1 | wc -l)

# make a list of all captures
capture_list=$( $awkprogram '$1 ~ /Capture:/ {print $2}' $1 )

# process full capture list into BASH array of unique capture-agent names
agent_names=$( sort $capture_list | uniq | tr '\n' ' ' )

# get totals (and percentages, if bc is available) for each agent
k1=0
for agent in ${agent_names[*]}; do
  agent_totals[$k1]=$(grep $agent $capture_list | wc -l)
  if [ isbc = true ]; then agent_pcts[$k1]=$(echo "$agent_totals[$k1] / $total_captures" | bc -l); fi
  ((k1++))
done



## print results

printf "\n\n"

for (( k2=0; k2<=k1; k2++ )); do
  if [ isbc = true ]; then
    printf "%s:\t%i (%2.1f\%\n)" $agent_names[$k2] $agent_totals[$k2] $agent_pcts[$k2]
  else
    printf "%s:\t%i / %i\n" $agent_names[$k2] $agent_totals[$k2] $total_captures
  fi
  ((k2++))
done

printf "\n\n"


# all pau!   )
exit 0
