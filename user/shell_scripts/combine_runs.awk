# combine_runs.awk -- part of combine_runs.sh
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ June 2016 ~ #

BEGIN{firstline=1; event_num=0}

$1 ~ /event/ {

  if (firstline==1) {

    print $0; firstline=0; getline }

  else

    getline
}

$1 ~ /[[:digit:]]*/ {
  
 if (firstline==0) {
    
    event_num++

    $1=event_num
  
    print $0

   }
  
}

# all pau!   )
