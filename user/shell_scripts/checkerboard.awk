# checkerboard.awk -- script to convert full rectangular grid
#   to checkerboard pattern
# -- usage: mv some-experiment.geo some-experiment.geo~; \
#      cat some-experiment.geo~ | \
#      awk -f $RATROOT/user/shell_scripts_checkerboard.awk

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
