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

// main
for ( file_num = 0; file_num < total_files; file_num++ ) {
  T_filenames->GetEntry(file_num);
  f = TFile::Open(fn);
  // process your file here
  printf("%s\n", gFile->GetName()); // example
  f->Close();
}

// all pau!   )
}
