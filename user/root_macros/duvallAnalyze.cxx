// duvallAnalyze -- wrapper macro to run various preparation and analysis code
// -- see comments in $RATROOT/user/root_macros/{SEDAQ2.cxx,angularRecon.cxx}
//      in this repository for details
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 8/2021 ~ //

//Copyright (C) 2021 Mark J. Duvall
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

void duvallAnalyze( const char* baseName, const bool kGraphics = kTRUE, const char* kQuantizedPositions = "", const char* kPositionResolution = "", const Bool_t kAzimuthalOnly = kFALSE ) {

// for OpenGL:
// get current settings
const Bool_t origOGL = gStyle->GetCanvasPreferGL();
const Bool_t origBatch = gROOT->IsBatch();
// set default rendering enging to OpenGL
if (! origOGL) gStyle->SetCanvasPreferGL(kTRUE);

// filenames
TString basename(baseName);
TString scintfile, resultsfile, pdxyzfile, radarfile;
scintfile = basename + "_T.root";
resultsfile = basename + "_results.root";
pdxyzfile = basename + "_pd-xyz.png";

// check / load macros
if ( ! gInterpreter->IsLoaded("SEDAQ2.cxx") ) gROOT->LoadMacro("SEDAQ2.cxx");
if ( ! gInterpreter->IsLoaded("angularRecon.cxx") ) gROOT->LoadMacro("angularRecon.cxx");

// MAIN
printf( "\n\n//// Analyzing datarun \"%s\"... ////\n\n\n", basename.Data() );
SEDAQ2( scintfile.Data(), kGraphics, kQuantizedPositions, kPositionResolution, kAzimuthalOnly );
angularRecon( resultsfile.Data(), kGraphics );

//// fix trouble plots
//ofstream fixc3 = "fixc3.cxx";
//TString fixc3String = TString::Format( "{
//  // fixc3 -- simple macro to fix c3 plot
//  printf(\"Attempting to fix c3 plot...\\n\");
//  gROOT->SetBatch(kTRUE);
//  TFile *f = TFile::Open(\"%s\");
//  c3->Draw();
//  c3->Print(\"%s\");
//  c3->Close();
//  f->Close();
//}",resultsfile.Data(), pdxyzfile.Data() );
//fixc3 << fixc3String.Data();
//fixc3.close();
//gSystem->Exec("root -q -l fixc3.cxx");

// fix trouble plots // TODO: automate
printf("If the c3 plot (%s_pd-xyz.png) did not save correctly, try:", basename.Data());
printf("
1) Quit ROOT
2) Open ROOT interactively
3) Run the following lines at the prompt:\n\n");
printf("TFile *f = TFile::Open(\"%s\");\n", resultsfile.Data());
printf("c3->Draw();\n");
printf("c3->Print(\"%s\");\n", pdxyzfile.Data());
printf("c3->Close();\n");
printf("f->Close();\n");
printf("\nAll pau!   )\n\n");
//ofstream RC = "rootcommands.cxx";
//RC << "{" << endl;
//TString cmd0, cmd1, cmd2, cmd3, cmd4;
//cmd0.Form("TFile *f = TFile::Open(\"%s\");\n", resultsfile.Data());
//cmd1.Form("c3->Draw();\n");
//cmd2.Form("c3->Print(\"%s\");\n", pdxyzfile.Data());
//cmd3.Form("c3->Close();\n");
//cmd4.Form("f->Close();\n");
////gInterpreter->ProcessLine(cmd0.Data());
////gInterpreter->ProcessLine(cmd1.Data());
////gInterpreter->ProcessLine(cmd2.Data());
////gInterpreter->ProcessLine(cmd3.Data());
////gInterpreter->ProcessLine(cmd4.Data());
//RC << cmd0.Data() << cmd1.Data() << cmd2.Data() << cmd3.Data() << cmd4.Data() << "gSystem->Exit(0);" << endl << "}" << endl;

// all pau!   )
printf( "\n//// Analysis Complete ////\n\n\n" );
//printf( "Now run the following line at the shell prompt:\nroot rootcommands.cxx\n\n" );
//printf( "Now run the following line:\n.x rootcommands.cxx\n\n" );
//gSystem->Exit(0);
return;
}
