// processListedFiles -- one possible way to loop over a set of ROOT files read in from a text-only list
// -- USAGE: processListedFiles("LISTFILE");
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 04/2022 ~ //

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

void processListedFiles( const char* LISTFILE ) {

// init
TTree *T_filenames = new TTree("T_filenames", "Filenames to Process");
T_filenames->ReadFile(LISTFILE, "filename/C");
char fn[1024] = "";
T_filenames->SetBranchAddress("filename", &fn);
Int_t file_num(0), total_files(T_filenames->GetEntries());
TFile *f;
TString dir0 = gSystem->pwd();
TString dir, fileStr;

/* // for subsetMeans: */
/* TTree *T_sub = (TTree*)gDirectory->FindObjectAnyFile("T_sub"); */
/* TTree *T2; */

gROOT->LoadMacro("AngRes.cxx");

// main
for ( file_num = 0; file_num < total_files; file_num++ ) {

  // open file
  T_filenames->GetEntry(file_num);
  f = TFile::Open(fn);
  /* fileStr = TString(fn); */

  // PROCESS YOUR FILE HERE
  printf( "%s\n\n", gFile->GetName() );

  // AngRes
  AngRes(fn);

  /* // subsetMeans */
  /* /1* printf("%s\n", gFile->GetName()); *1/ */
  /* dir = fileStr( 0, fileStr.Last('/') ); */
  /* gSystem->cd( dir.Data() ); */
  /* /1* cerr << gSystem->pwd() << endl; //debug *1/ */
  /* T2 = (TTree*)gDirectory->Get("T2"); */
  /* /1* subsetMeans(T_sub); // for subsetMeans *1/ */
  /* cout << T2->GetEntries() << endl; */
  /* /1* T2->ls(); //debug *1/ */
  /* /1* T2->Scan(); //debug *1/ */
  /* gSystem->cd( dir0.Data() ); */
  /* /1* cerr << gSystem->pwd() << endl; //debug *1/ */

  /* // close current file */
  f->Close();
  /* fileStr.Clear(); */
  /* dir.Clear(); */

}

/* // for subsetMeans: */
/* f_sub->cd(); */
/* T_sub->Write(); */
/* f_sub->Close(); */

// all pau!   )
}
