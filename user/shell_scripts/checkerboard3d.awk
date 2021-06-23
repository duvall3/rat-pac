# checkerboard3d.awk -- script to convert full rectangular 3D grid
#   into "3D checkerboard" pattern
# -- usage: 
#    mv foo.geo foo.geo~; \
#      awk -f $RATROOT/user/shell_scripts_checkerboard3d.awk \
#      foo.geo~ > foo.geo

# set field and field separators
BEGIN{
  RS="\n{2,}"
  FS="\n"
}

# print all non-target-cell entries
$2 !~ /target_cell/ {print $0 "\n"}

#debug
#{print $0}
{print $1 "\t" $2 "\n"}

# only print target cells when ROW, COL, and LYR are either all even or all odd
$1 ~ /target_cell/ {
# match($1, /[[:digit:]]+/, ROW)
# field_copy = $1
# match(field_copy, /[[:digit:]]+/)
  match($1, /[[:digit:]]+/)
  ROW = substr($1, RSTART, RLENGTH)
  print length(ROW) "\t" ROW "\n" #debug
  sub(/[[:digit:]]+/, "", field_copy)
# match(field_copy, /[[:digit:]]+/, COL)
  sub(/[[:digit:]]+/, "", field_copy)
# match(field_copy, /[[:digit:]]+/, LYR)
# row_even = strtonum(ROW[0]) % 2
# col_even = strtonum(COL[0]) % 2
# lyr_even = strtonum(LYR[0]) % 2
# if ( (row_even==col_even) && (col_even==lyr_even) )
#   print $0 "\n"
# else # rather than deleting volume, replace with alternate material
#  sub("ej254_005li6", "glass", $0)
#  print $0 "\n"
}

# debug
#{print "debug: " ROW[0] "\t" COL[0] "\t" LYR[0] "\t\t" row_even "\t" col_even "\t" lyr_even "\n"}

# all pau!   )
