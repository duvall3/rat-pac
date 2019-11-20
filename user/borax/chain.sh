#!/bin/bash
# chain -- generate a ROOT macro to combine all the SimpleEnergyDAQ TTrees
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ #


# Usage:
# 1) Run this script in the umbrella directory of your datarun
# 2) Open a ROOT prompt and run ".x ./chain.cxx"


echo -e "\
// chain.cxx -- combine TChains
// -- for use with SimpleEnergyDAQ from \$RATROOT/user/root_macros/SEDAQ.cxx
// -- USAGE: open ROOT and run \".x ./chain.cxx\"
// Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ //

void chain() {

TChain ch(\"T\");\n" > chain.cxx

for DIR in */; do
  FILE_BASE=$(basename $DIR /)
  FILE_PREFIX="$FILE_BASE/$FILE_BASE"
  FILENAME=$FILE_PREFIX"_T.root"
  echo "ch.Add(\"$FILENAME\");" >> chain.cxx
done

OUTFILE=$(basename $(pwd))"_T.root"

echo -e "\nch.Merge(\"$OUTFILE\");\n\n//all pau!   )\n}" >> chain.cxx

# all pau!  )
exit 0
