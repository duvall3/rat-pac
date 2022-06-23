// processListedFiles -- one possible way to loop over a set of ROOT files read in from a text-only list
// -- USAGE: void processListedFiles(const char* listfileName, const char* macroName = "", const char* macroArgsExtra = "");
// -- Provide macroName WITHOUT its file extension (e.g., "someMacro", NOT "someMacro.cxx")
// -- Provide ALL additional macro arguments in a single string
// -- Example: To execute a macro someMacro(const char* filename, Bool_t kFlag, const char* optionString)
//    on every file named in filelist.txt = file0.root, file1.root, etc.,
//    with arguments kFlag = kTRUE and optionString = "abc", use the following line:
//      processListedFiles("filelist.txt", "someMacro", "kTRUE, \"abc\"");
//        \-->  someMacro("file0.root", kTRUE, "abc");  // processListedFiles will then generate and run these lines
//              someMacro("file1.root", kTRUE, "abc");  // ...
//              someMacro("file2.root", kTRUE, "abc");  // ... etc.
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

void processListedFiles( const char* listfileName, const char* macroName, const char* macroArgsExtra = "" ) {

//// init
// file list
TTree *T_filenames = new TTree("T_filenames", "Filenames to Process");
T_filenames->ReadFile(listfileName, "filename/C");
char fn[1024] = "";
T_filenames->SetBranchAddress("filename", &fn);
Int_t file_num(0), total_files(T_filenames->GetEntries());
TFile *f;
TString dir0 = gSystem->pwd();
TString dir, filenameStr;
// macro
TString macroArgList;
TMacro mac(macroName);

// main
printf("\n/// Processing files from %s:\n\n", listfileName);
for ( file_num = 0; file_num < total_files; file_num++ ) {

  // get filename from list
  T_filenames->GetEntry(file_num); // this sets "fn" to the current filename
  /* f = TFile::Open(fn); // optional, depending on desired macro */

  // PROCESS YOUR FILE HERE
  // The default body of this loop (provided below)
  //   will execute the specified macro on each
  //   of the files in the list, using any
  //   specified additional parameters;
  //   but feel free to copy or modify this loop

  // parameter prep
  printf("Processing %s...\n", fn);
  macroArgList.Form("\"%s\"", fn);
  if (macroArgsExtra != "") {
    macroArgList += ", ";
    macroArgList.Append(macroArgsExtra);
  }

  // execution
  printf("Executing macro %s with arguments (%s):\n", mac.GetName(), macroArgList.Data());
  mac.Exec(macroArgList.Data());
    
}

// all pau!   )
printf("/// processListedFiles complete!\n\n");
}
