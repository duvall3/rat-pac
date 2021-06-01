#!/bin/bash
# chain -- generate a ROOT macro to combine all the ScintillationData TTrees
# -- intended for use with github.com/duvall3/rat-pac/tree/collab/user/shell_scripts/local_batch_jobs.sh
#		       and 					"	            /duvall3analyze.sh
# Usage:
# 1) Run this script in the umbrella directory of your datarun
# 2) [Optional] Run duvall3analyze.sh
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ Updated 5/21 #


##Copyright (C) 2021 Mark J. Duvall
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <http://www.gnu.org/licenses/>.


# init
OUTFILE=$(basename $(pwd))"_T.root"

# create chains.cxx
echo -e "\
// chain.cxx -- combine TChains
// -- for use with SimpleEnergyDAQ from \$RATROOT/user/root_macros/SEDAQ.cxx
// -- USAGE: open ROOT and run \".x ./chain.cxx\"
// Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ //\n
void chain() {\n
// init
TChain ch(\"T\");\nLong64_t nIBDs(0);\n\n// file loop\n" > chain.cxx

# add individual runs
for DIR in */; do
  FILE_BASE=$(basename $DIR /)
  FILE_PREFIX="$FILE_BASE/$FILE_BASE"
  FILENAME=$FILE_PREFIX"_T.root"
  echo "\
ch.Add(\"$FILE_BASE/$FILENAME\");
T->GetEntries();
TTree* t = T->GetTree();
TObjString* tos = (TObjString*)t->GetUserInfo()->At(0);
nIBDs = nIBDs + tos->GetString().Atoll();
"  >> chain.cxx
done

# prepare merging and saving
echo -e "\
// merge trees and prepare nIBDs as a TObjString*
ch.Merge(\"$OUTFILE\");
TString nIBDs_ts = TString::LLtoa(nIBDs, 10); // base 10
TObjString* nIBDs_tos = new TObjString(nIBDs_ts.Data());\n
// update nIBDs in output file
TFile* f = TFile::Open(\"$OUTFILE\", \"update\");
TKey* tk = f->FindKey(\"T\");
TTree* tr = tk->ReadObj();
TList* t_user = tr->GetUserInfo();
t_user->Clear();
t_user->Add(nIBDs_tos);
tr->Write();
f->Save();
f->Close();\n
//all pau!   )
}" >> chain.cxx

# run the newly-created macro
root -q -l -b 'chain.cxx()'

# all pau!  )
exit 0
