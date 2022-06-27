// tree2txt -- get a TTree from a ROOT file and save it as a text file
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2022 ~ //

//Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

void tree2txt( const char* filename, const char* treename = "T", const char* outfilename = "" ) {

// filename operations
TString savename(outfilename);
if (savename.Length()==0) {
  savename = filename;
  savename.ReplaceAll(".root","");
  savename.Append( TString::Format("_%s.txt", treename) );
}

// read file and tree
TFile *f = TFile::Open(filename);
TTree *T_tree2txt = (TTree*)gDirectory->Get(treename);
if (T_tree2txt==0x0) {
  gFile->Error("tree2txt", "Requested TTree not found. Exiting.");
  return;
}

// prepare for output
T_tree2txt->SetScanField(0);
TTreePlayer *TTP = T_tree2txt->GetPlayer();
TTP->SetScanRedirect(kTRUE);
TTP->SetScanFileName(savename.Data());

// do the thing!
T_tree2txt->Scan("*", "", "colsize=25");

// all pau!   )
return;
}
