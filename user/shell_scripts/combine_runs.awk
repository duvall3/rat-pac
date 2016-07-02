# combine_runs.awk -- part of combine_runs.sh
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ June 2016 ~ #


# switch firstheader on; set event counter to 0
BEGIN{firstheader=1; event_num=0}


# if the line is a header and hasn't been printed already,
#    print it and switch 'firstheader' off
$1 ~ /event/ {
  if (firstheader==1) {
    print $0; firstheader=0; getline }
  else
    getline
}


# if the line is data, replace the event count with the corrected value,
#    increment the event count, and print the corrected line
$1 ~ /[[:digit:]]*/ {
 if (firstheader==0) {
    event_num++
    $1=event_num
    print $0
   }
}


# all pau!   )
