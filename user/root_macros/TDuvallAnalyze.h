#ifndef TDuvallAnalyze
#define TDuvallAnalyze

// TDuvallAnalyze -- master object for analyzing RAT-PAC IBD runs
//   using functionality from github.com > duvall3 > rat-pac > \
//     collab > user > root_macros
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 6/2021 ~ //
// -- partial motivation: flexibility for bursts vs. raw MC

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

#include "TObject.h"
#include "TFile.h"
#include "TNamed.h"
#include "TString.h"

class TDuvallAnalyze : public TNamed {

private:
  TFile*	fFile;			// current ROOT datafile
  TString 	fExperiment;		// name of RAT-PAC experiment
  TString	fExperimentPath;	// path to RAT-PAC data directory
  //TList(TTree Entries*) currentEventSet --> data from *_results.root T2
  //TList(TCut) currentCuts

public:  // voids TEMPORARY
  TDuvallAnalyze();
  TDuvallAnalyze( const char* fileName );
//TDuvallAnalyze( const char* name, const char* title, const char* fileName )
  TFile*		GetFile() const { return fFile; }
  TString		GetExperiment()	const { return fExperiment; }
  TString		GetExperimentPath()	const { return fExperimentPath; }
//void			Draw() // DrawAllPlots()
//void			DrawPlot(enum) // individ. plots
//void			RestoreDefaultCuts() // arg. experiment, config file, other?
//void			ApplyCut(TCut) //temp -- return ptr for TList, TTree, TSelection, other?
//void			RemoveCut(TCut) //temp -- return ptr for TList, TTree, TSelection, other?
//void			ShowCuts() //temp -- return ptr for TList, TTree, TSelection, other?
//void			Voxelize(xyz_quant_data)

//Integrating the TDuvallAnalyze class to ROOT.
ClassDef(TDuvallAnalyze,1)

}; //endclass

// all pau!   )
#endif
