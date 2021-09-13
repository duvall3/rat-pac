// duvallAnalyze -- wrapper macro to run various preparation and analysis code
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

void duvallAnalyze( const char* baseName, const bool kGraphics = kTRUE, const char* kQuantizedPositions = "", const char* kPositionResolution = "" ) {

// set default rendering enging to OpenGL
gStyle->SetCanvasPreferGL(kTRUE);

// filenames
TString basename(baseName);
TString scintfile, resultsfile;
scintfile = basename + "_T.root";
resultsfile = basename + "_results.root";

// check / load macros
if ( ! gInterpreter->IsLoaded("SEDAQ2.cxx") ) gROOT->LoadMacro("SEDAQ2.cxx");
if ( ! gInterpreter->IsLoaded("angularRecon.cxx") ) gROOT->LoadMacro("angularRecon.cxx");

// MAIN
printf( "\n\n//// Analyzing datarun \"%s\"... ////\n\n\n", basename.Data() );
SEDAQ2( scintfile.Data(), kGraphics, kQuantizedPositions, kPositionResolution );
angularRecon( resultsfile.Data(), kGraphics );
printf( "//// Analysis Complete ////\n\n\n" );

// all pau!   )
return;
}
