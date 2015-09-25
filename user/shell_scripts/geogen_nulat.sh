#!/bin/bash
# geogen_nulat -- generate .geo entries for NuLat from a template


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


# define arrays
LR=(left mid right)
UD=(bot mid top)
FB=(back mid front)
OFFSET=(-51 0 51) # 1-mm separation for TIR

for k_lr in {0..2}; do

  for k_ud in {0..2}; do
  
    for k_fb in {0..2}; do
  
      index_name_lr=target_cube_${LR[$k_lr]}
      index_name_fb="$index_name_lr"_${UD[$k_ud]}
      index_name="$index_name_fb"_${FB[$k_fb]}
      x=${OFFSET[$k_lr]}
      y=${OFFSET[$k_ud]}
      z=${OFFSET[$k_fb]}
      
      echo -e "\
// -------- GEO[$index_name]
{
name: \"GEO\",
index: \"$index_name\",
valid_begin: [0, 0],
valid_end: [0, 0],
mother: \"cube_array\",
type: \"box\",
size: [25.0, 25.0, 25.0], // mm
material: \"ej254_015li6\",
invisible: 0,
position: [$x.0, $y.0, $z.0] // mm
}\n\n"
      
    done #k_fb
  
  done #k_ud

done #k_lr


# all pau!   )
exit 0
