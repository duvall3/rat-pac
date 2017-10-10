#!/bin/bash
# chain -- generate a ROOT macro to combine all the SimpleEnergyDAQ TTrees
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ #


# Usage:
# 1) Run this script.
# 2) Open ROOT and run the following commands:
# 3) TChain ch("T");
# 5) .x chain.cxx
# 7) ch.Merge("<OUTPUT_FILENAME>.root");
# 9) .x $RATROOT/Plot_SEDAQ_Results.cxx
#10) f.Close ();
# -- NOTE: You will have to supply the full path for $RATROOT


echo -e "\
// chain.cxx -- combine TChains
// -- for use with SimpleEnergyDAQ from $RATROOT/user/root_macros/SimpleEnergyDAQ.cxx
// Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ //


chain() {\n" > chain.cxx

for DIR in */; do
  FILE_BASE=$(basename $DIR /)
  FILE_PREFIX="$FILE_BASE/$FILE_BASE"
  FILENAME=$FILE_PREFIX"_SEDAQ.root"
  echo "ch.Add(\"$FILENAME\");" >> chain.cxx
done

echo -e "\n//all pau!   )\n}" >> chain.cxx

# all pau!  )
exit 0
