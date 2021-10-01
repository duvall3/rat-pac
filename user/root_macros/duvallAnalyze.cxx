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
//printf("Attempting to fix c3 plot...\n");
//if (! origBatch) gROOT->SetBatch(kTRUE);
//TFile *f = TFile::Open(resultsfile.Data());
////c3->Draw();
//c3->Print(pdxyzfile.Data());
////c3->Close();
//f->Close();
//if (! origBatch) gROOT->SetBatch(kFALSE);

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

// all pau!   )
printf( "\n//// Analysis Complete ////\n\n\n" );
return;
}
