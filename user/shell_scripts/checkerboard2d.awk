# checkerboard2d.awk -- script to convert full rectangular (2D) grid
#   to (2D) checkerboard pattern
# -- usage: 
#    mv foo.geo foo.geo~; \
#      awk -f $RATROOT/user/shell_scripts_checkerboard2d.awk \
#      foo.geo~ > foo.geo

# set field and field separators
BEGIN{
  RS="\n{2,}"
  FS="\n"
}

# print all non-target-cell entries
$2 !~ /target_cell/ {print $0}

# only print target cells when ROW and COL are both even or both odd
$2 ~ /target_cell/ {
  match($2, /[[:digit:]]+/, ROW)
  field_copy = $2
  sub(/[[:digit:]]+/, "", field_copy)
  match(field_copy, /[[:digit:]]+/, COL)
  row_even = strtonum(ROW[0]) % 2
  col_even = strtonum(COL[0]) % 2
  if ( row_even == col_even )
    print $0
}


# all pau!   )
