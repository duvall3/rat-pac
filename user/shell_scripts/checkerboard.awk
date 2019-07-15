# checkerboard.awk -- script to convert full rectangular grid
#   to checkerboard pattern

# reminder: print when ROW%2 == COL%2

# set record and field separators
BEGIN{
  RS="\n\n"
  FS="\n"
}

$2 !~ /target_cell/ {print $0}

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
