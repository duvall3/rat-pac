#!/bin/bash
# ibd_term_vols -- process a FILENAME.ibd.dat file* for e+ & n0 termination-volume statistics
#	*i.e., output from $ROOTSYS/macros/IBD.cxx
#	-- adapted from github.com/duvall3/rat-pac/user/nCapAgents.sh
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ September 2015 ~ #



## init 

# bookkeeping
BASENAME=$(basename $1 .ibd.dat)
#BASENAME=$(basename $1 .n0.dat)

# check four output filename; otherwise default to basename of input file
if [ $2 ]; then
  OUTPUTFILE=$2
else
  echo "No output filename specified; using $BASENAME"
  OUTPUTFILE=$BASENAME
fi

## don't overwrite existing files without confirmation
#if [ -e ./$OUTPUTFILE.cap -o -e ./gam ]; then
## if [ ! $3 ]; then
#    echo "WARNING: Output files will be overwritten. Continue? (y/n)"
#    read CONTINUE
#    if [ $CONTINUE == "y" ]; then echo "OK"; # do nothing
#      else
#      echo "Exiting." && exit 2
#    fi
## else echo "nCapAgents.sh: 3rd argument given; assuming batch mode." # && do nothing
## fi
#fi

# check for 'awk' & 'bc' programs
if [ $(which bc) ]; then isbc=true
  else isbc=false
fi
if [ $(which awk) ]; then awkprogram=awk
  elif [ $(which gawk) ]; then awkprogram=gawk
  elif [ $(which mawk) ]; then awkprogram=mawk
  else echo "ERROR: No awk program found. Go download awk, gawk, or mawk from your repositories. You'll be glad you did.   )"; exit 1
fi

#echo "init complete" #debugging 

## get capture info

# determine total number of captures
total_captures=$(grep "Capture: " $1 | wc -l)
echo "Total Captures: $total_captures" #debugging

## neutron-capture volumes

# process full capture list into BASH array of unique capture-volume names
volume_names=( $( $awkprogram '$0 ~ /neutron Termination Volume:/ {print $4}' $1 | sort | uniq ) )
#echo "Capture Volumes: ${volume_names[*]}" #debugging

# get totals (and percentages, if bc is available) for each agent
k1=0
for volume in ${volume_names[*]}; do
  volume_totals[$k1]=$(grep -c "neutron.*$volume$" $1)
# $awkprogram -v volume=$volume '$3 ~ volume {printf $3"\t"; getline; printf $3"\t"; getline; print $5}' $1 > ./gam/$volume.gam
  if [ $isbc = true ]; then volume_pcts[$k1]=$(echo "${volume_totals[$k1]} / $total_captures * 100" | bc -l); fi
  echo "$volume data complete" #debugging
  ((k1++))
done


## print results

echo "writing ./$OUTPUTFILE.vol" #debugging

printf "TOTAL:\t%i\n\n" $total_captures > ./$OUTPUTFILE.vol_temp

for (( k2=0; k2<k1; k2++ )); do
  if [ $isbc = true ]; then
    printf "%s:\t\t%i\t\t%2.2f%%\n" ${volume_names[$k2]} ${volume_totals[$k2]} ${volume_pcts[$k2]} >> ./$OUTPUTFILE.vol_temp
  else
    printf "%s:\t\t%i\t\t/ %i\n" ${volume_names[$k2]} ${volume_totals[$k2]} $total_captures >> ./$OUTPUTFILE.vol_temp
  fi
done

printf "\n\n" >> ./$OUTPUTFILE.vol_temp

column -t ./$OUTPUTFILE.vol_temp > ./$OUTPUTFILE.vol
rm ./$OUTPUTFILE.vol_temp


# all pau!   )
exit 0
