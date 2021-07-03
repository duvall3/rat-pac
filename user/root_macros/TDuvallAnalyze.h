#ifndef TDuvallAnalyze
#define TDuvallAnalyze

// TDuvallAnalyze -- master object for analyzing RAT-PAC IBD runs
//   using functionality from github.com > duvall3 > rat-pac > \
//     collab > user > root_macros
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 6/2021 ~ //
// -- partial motivation: flexibility for scint. bursts vs. raw MC

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

#include "TFile.h"
#include "TClass.h"
#include "TTree.h"

class TDuvallAnalyze : public TClass {

private:
  TFile*		fFile;			// current ROOT datafile
  const char*		fFileName;		// name of current ROOT datafile
  TString 		fExperiment;		// name of RAT-PAC experiment
  TString		fExperimentPath;	// path to directory defining fExperiment, usually either absolute or relative to $RATROOT/data
  TTree*		fTree;			// current TTree
  TCut			fCut;			// current cuts on data
  TObjArray* 		fCutList;		// list of cuts
  TObjArray* 		fCanList;		// list of canvases

private:
  void			Init();
  void			FindExperiment();

public:
  TDuvallAnalyze();
  TDuvallAnalyze( const char* fileName );
  TDuvallAnalyze( const char* name, const char* title, const char* fileName );
  TFile*		GetFile() const { return fFile; }
  virtual const char* 	GetFileName() const { return fFileName; }
  TString		GetExperiment()	const { return fExperiment; }
  TString		GetExperimentPath() const { return fExperimentPath; }
  TTree*		GetTree() const { return fTree; }
  TCut			GetCuts() const { return fCut; }
  TObjArray*		GetListOfCuts() const { return fCutList; }
  TObjArray*		GetListOfCanvases() const { return fCanList; }
  void			AddCut( TCut* c );
  void			AddCut( const char* cut );
  void			CombineCuts();
  void			ShowCuts();
  void			ClearCuts();
  void			ResetCuts();
  void			DrawHist( const char* varexp );
//void			DrawPlot(enum) // individ. plots
//void			RemoveCut(TCut) //temp -- return ptr for TObjArray, TTree, TSelection, other?
//void			Voxelize(xyz_quant_data)

//Integrating the TDuvallAnalyze class to ROOT.
ClassDef(TDuvallAnalyze,1)

}; //endclass

// all pau!   )
#endif
