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
  TObjArray*		fHistList;		// list of histograms

private:
  void			FindExperiment();
  void			CombineCuts();

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
  TObjArray*		GetListOfHistograms() const { return fHistList; }
  void			LoadFile( const char* fileName );
  void			AddCut( TCut* c );
  void			AddCut( const char* cut );
  void			ShowCuts();
  void			ClearCuts();
  void			ResetCuts();
  void			DrawHist( const char* varexp );
  int			RtToRoot( const char* rt_file );
//void			SEDAQ( const char* fileName, Bool_t kGraphics = kFALSE, Double_t promptLow = 0, Double_t delayedLow = 0, Double_t deltaTLow  = 1.e-6, Double_t deltaTHigh = 100.e-6, Bool_t kNuLat = kFALSE );
  void			SEDAQ( const char* fileName );
//void			AngularRecon( const char* fileName, Bool_t kGraphics = kFALSE );
  void			AngularRecon( const char* fileName );
//void			RATPACEventViewer( const char* fileName, TString cellExpr = ".*" );
  void			RATPACEventViewer( const char* fileName );
  void			Analyze();
//void			DrawPlot(enum) // individ. plots
//void			RemoveCut(TCut) //temp -- return ptr for TObjArray, TTree, TSelection, other?
//void			Voxelize(xyz_quant_data)

//Integrating the TDuvallAnalyze class to ROOT.
ClassDef(TDuvallAnalyze,1)

}; //endclass

// all pau!   )
#endif
