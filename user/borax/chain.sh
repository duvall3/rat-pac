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

// init
TChain ch(\"T\");\nLong64_t nIBDs(0);\n\n// file loop\n" > chain.cxx

for DIR in */; do
  FILE_BASE=$(basename $DIR /)
  FILE_PREFIX="$FILE_BASE/$FILE_BASE"
  FILENAME=$FILE_PREFIX"_T.root"
  echo "\
ch.Add(\"$FILENAME\");
T->GetEntries();
TTree* t = T->GetTree();
TObjString* tos = (TObjString*)t->GetUserInfo()->At(0);
nIBDs = nIBDs + tos->GetString().Atoll();
"  >> chain.cxx
done

OUTFILE=$(basename $(pwd))"_T.root"

echo "\
// merge trees and prepare nIBDs as a TObjString*
ch.Merge(\"$OUTFILE\");
TString nIBDs_ts = TString::LLtoa(nIBDs, 10); // base 10
TObjString* nIBDs_tos = new TObjString(nIBDs_ts.Data());

// update nIBDs in output file
TFile* f = TFile::Open(\"$OUTFILE\", \"update\");
TKey* tk = f->FindKey(\"T\");
TTree* tr = tk->ReadObj();
TList* t_user = tr->GetUserInfo();
t_user->Clear();
t_user->Add(nIBDs_tos);
tr->Write();
f->Save();
f->Close();

//all pau!   )
}" >> chain.cxx


# all pau!  )
exit 0
