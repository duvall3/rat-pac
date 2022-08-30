// duvallAnalyzePrep -- wrapper macro to run various preparation and analysis code
// -- mainly written for use with reanalyze_batch_jobs.sh
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2021 ~ //

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

void duvallAnalyzePrep( const char* baseName, const bool kGraphics = kFALSE, const char* kQuantizedPositions = "", const char* kPositionResolution = "" ) {

// filenames
TString basename(baseName);
TString rootfile, rtfile, scintfile, energiesfile, resultsfile;
rootfile = basename + ".root";
scintfile = basename + "_T.root";
rtfile = basename + "_energies.rt";
energiesfile = basename + "_energies_T.root";
resultsfile = basename + "_results.root";

// check / load macros
if ( ! gInterpreter->IsLoaded("rt_to_root.cxx") ) gROOT->LoadMacro("rt_to_root.cxx");
if ( ! gInterpreter->IsLoaded("particleTracksToScint.cxx") ) gROOT->LoadMacro("particleTracksToScint.cxx");
if ( ! gInterpreter->IsLoaded("correctEnergies.cxx") ) gROOT->LoadMacro("correctEnergies.cxx");

// MAIN
printf( "\n\n//// Preparing datarun \"%s\"... ////\n\n\n", basename.Data() );
rt_to_root( rtfile.Data() );
particleTracksToScint( rootfile.Data() );
correctEnergies( scintfile.Data(), energiesfile.Data() );
neutronCaptures( rootfile.Data() );
printf( "//// Preparation Complete ////\n\n\n" );

// all pau!   )
return;
}
