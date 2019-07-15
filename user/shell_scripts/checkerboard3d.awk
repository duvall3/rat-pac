# checkerboard3d.awk -- script to convert full rectangular 3D grid
#   into "3D checkerboard" pattern
# -- usage: 
#    mv foo.geo foo.geo~; \
#      awk -f $RATROOT/user/shell_scripts_checkerboard.awk \
#      foo.geo~ > foo.geo

# set field and field separators
BEGIN{
  RS="\n\n"
  FS="\n"
}

# print all non-target-cell entries
$2 !~ /target_cell/ {print $0}

# only print target cells when ROW, COL, and LYR are either all even or all odd
$2 ~ /target_cell/ {
  match($2, /[[:digit:]]+/, ROW)
  field_copy = $2
  sub(/[[:digit:]]+/, "", field_copy)
  match(field_copy, /[[:digit:]]+/, COL)
  sub(/[[:digit:]]+/, "", field_copy)
  match(field_copy, /[[:digit:]]+/, LYR)
  row_even = strtonum(ROW[0]) % 2
  col_even = strtonum(COL[0]) % 2
  lyr_even = strtonum(LYR[0]) % 2
  if ( (row_even==col_even) && (col_even==lyr_even) )
    print $0
}

# all pau!   )
