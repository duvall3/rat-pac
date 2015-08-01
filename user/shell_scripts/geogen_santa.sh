#!/bin/bash
# geogen -- generate .geo entries from a template


#### TEMPLATE:
#// -------- GEO[]
#{
#name: "GEO",
#index: "",
#valid_begin: [0, 0],
#valid_end: [0, 0],
#mother: "",
#type: "",
#size: [0.0, 0.0, 0.0], // mm
#material: "",
#invisible: 0,
#position: [0.0, 0.0, 0.0] // mm
#}
#
#


for k in {0..39}; do
  
  strip_id=$(($k+1))
  index_name=strip_"$strip_id"
  
  y=$((-955+($k*51)))
  
      echo -e "\
// -------- GEO[$index_name]
{
name: \"GEO\",
index: \"$index_name\",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: \"capture_plane\",
type: \"box\",
size: [1000.0, 25.0, 30.0], // mm
material: \"gd_scintillator\",
invisible: 0,
position: [0.0, $y.0, 0.0] // mm
}\n\n"
      
done


# all pau!   )
exit 0
