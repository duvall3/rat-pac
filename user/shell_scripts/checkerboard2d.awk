# checkerboard2d.awk -- script to convert full rectangular (2D) grid
#   to (2D) checkerboard pattern
# -- usage: 
#    mv foo.geo foo.geo~; \
#      awk -f $RATROOT/user/shell_scripts_checkerboard.awk \
#      foo.geo~ > foo.geo
# -- NOTE: This script assumes the first two cell indices are the relevant ones;
#      a version where either ROW or COL can be static while LYR changes
#      may be developed in the future

# set record and field separators
BEGIN{
  RS="\n\n"
  FS="\n"
}

# print all non-target-cell entries
$2 !~ /target_cell/ {print $0}

# only print target cells when ROW and COL are both even or both odd
$2 ~ /target_cell/ {
  match($0, /[[:digit:]]+/, ROW)
  record_copy = $0
  sub(/[[:digit:]]+/, "", record_copy)
  match(record_copy, /[[:digit:]]+/, COL)
  row_even = strtonum(ROW[0]) % 2
  col_even = strtonum(COL[0]) % 2
  if ( row_even == col_even )
    print $0
}


# all pau!   )
