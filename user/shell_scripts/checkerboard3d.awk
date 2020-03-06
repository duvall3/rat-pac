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
$1 !~ /target_cube/ {print $0 "\n"}

# only print target cells when ROW, COL, and LYR are either all even or all odd
$1 ~ /target_cube/ {
  match($1, /[[:digit:]]+/, ROW)
  field_copy = $1
  sub(/[[:digit:]]+/, "", field_copy)
  match(field_copy, /[[:digit:]]+/, COL)
  sub(/[[:digit:]]+/, "", field_copy)
  match(field_copy, /[[:digit:]]+/, LYR)
  row_even = strtonum(ROW[0]) % 2
  col_even = strtonum(COL[0]) % 2
  lyr_even = strtonum(LYR[0]) % 2
  if ( (row_even==col_even) && (col_even==lyr_even) )
    print $0 "\n"
}

# all pau!   )
