#!/bin/bash
# geogen_santa -- generate .geo entries for SANTA from a template
# Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #


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


## scintillator strips -- one set for target plane & one set for capture plane

# capture plane
for k1 in {0..39}; do
  
  strip_id=$(($k1+1))
  index_name=capture_strip_"$strip_id"
  
  y=$((-995+($k1*51)))
  
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
material: \"ej254_5b\",
invisible: 0,
position: [0.0, $y.0, 0.0] // mm
}\n\n"
      
done


# opaque separator sheets
for k2 in {1..39}; do
  
  index_name=capture_sheet_"$k2"
 
  # argh, need non-integer arithmetic; will have to use bc 
  # y=$((-1020+($k2*51)))
  calculation="-1020.5+$(($k2*51))"
  y=$(echo $calculation | bc -l)
  
  echo -e "\
// -------- GEO[$index_name]
{
name: \"GEO\",
index: \"$index_name\",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: \"capture_plane\",
type: \"box\",
size: [1000.0, 0.25, 30.0], // mm
material: \"acrylic_black\",
invisible: 0,
position: [0.0, $y, 0.0] // mm
color: [1, 1, 1 ],
}\n\n"
  
done


# target plane
for k3 in {0..39}; do

  strip_id=$(($k3+1))
  index_name=target_strip_"$strip_id"

  y=$((-995+($k3*51)))

  echo -e "\
// -------- GEO[$index_name]
{
name: \"GEO\",
index: \"$index_name\",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: \"target_plane\",
type: \"box\",
size: [1000.0, 25.0, 2.5], // mm
material: \"ej254_undoped\",
invisible: 0,
position: [0.0, $y.0, 0.0] // mm
}\n\n"
 
done


# opaque separator sheets
for k4 in {1..39}; do

  index_name=target_sheet_"$k4"

  # argh, need non-integer arithmetic; will have to use bc 
  # y=$((-1020+($k2*51)))
  calculation="-1020.5+$(($k4*51))"
  y=$(echo $calculation | bc -l)

  echo -e "\
// -------- GEO[$index_name]
{
name: \"GEO\",
index: \"$index_name\",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: \"target_plane\",
type: \"box\",
size: [1000.0, 0.25, 2.5], // mm
material: \"acrylic_black\",
invisible: 0,
position: [0.0, $y, 0.0] // mm
color: [1, 1, 1 ],
}\n\n"

done



# all pau!   )
exit 0