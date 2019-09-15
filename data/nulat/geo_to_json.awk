# geo_to_json -- AWK script to convert RAT-PAC geometry files to parsable .JSON files
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2019 ~ #

$1 ~ /^$/ {print $0}	# blank line
$1 ~ /[{}]/ {print $0}	# { or }
$1 ~ /[[:alpha:]]+/ {
  match($1, /[[:alpha:]]+/, field_name)
  $1="\""field_name[0]"\":"
  print $0
}

# all pau!   )
