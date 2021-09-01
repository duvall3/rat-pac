// TRATVolume -- class for analyzing geometry in a RAT-PAC ROOT file
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

#ifndef TRATVolume
#define TRATVolume

#include "TFile.h"
#include "TClass.h"
#include "TTree.h"

class TRATVolume : public TClass {

private:
  const char*		fVolNameChr;		// volume name
  TString		fVolName;		// volume name (TString)
  TFile*		fFile;			// current ROOT datafile
  const char*		fFileName;		// name of current ROOT datafile
  TString 		fExperiment;		// name of RAT-PAC experiment
  TString		fExperimentPath;	// path to directory defining fExperiment, usually either absolute or relative to $RATROOT/data
  const TMap*		fDB;			// RAT-PAC database TMap
  TString		fMother;		// name of mother volume
  TVector3		fRelativePosition;	// volume position, *relative to mother volume*
  TVector3		fAbsolutePosition;	// volume position, *relative to overall coordinate system*
//TObjArray* 		f___List;		// list of ___

private:
  void			FindExperiment();	// fill experiment name, path, etc.
  void			FindMother();		// fill mother volume name
  void			FindRelativePosition();	// fill volume relative position
//void			FindAbsolutePosition();	// fill volume absolute position
  void			FindAll();		// fill all members not individually set in ctor

public:
  TRATVolume();
  TRATVolume( const char* volNameChr );
  TRATVolume( const TString volName );
  void			FindAbsolutePosition();	// fill volume absolute position
  virtual const char*	GetVolNameChr() const { return fVolNameChr; }
  const TString		GetVolName() const { return fVolName; }
  TFile*		GetFile() const { return fFile; }
  virtual const char* 	GetFileName() const { return fFileName; }
  TString		GetExperiment()	const { return fExperiment; }
  TString		GetExperimentPath() const { return fExperimentPath; }
  TMap*			GetDB() const { return fDB; }
  TString		GetMother() const { return fMother; }
  TVector3		GetRelativePosition() const { return fRelativePosition; }
  TVector3		GetAbsolutePosition() const { return fAbsolutePosition; }
//  TTree*		GetTree() const { return fTree; }
//  TCut			GetCuts() const { return fCut; }
//  TObjArray*		GetListOfCuts() const { return fCutList; }
//  TObjArray*		GetListOfCanvases() const { return fCanList; }
////TObjArray*		GetListOfHistograms() const { return fHistList; }
//  void			AddCut( TCut* c );
//  void			AddCut( const char* cut );
//  void			ShowCuts();
//  void			ClearCuts();
//  void			ResetCuts();
////void			DrawHisto( const char* varexp );
////void			DrawHisto( TH1* histo );
//  int			IBDToScint();
//  int			RtToRoot();
//  void			ibdTracksToScint();
////void			SEDAQ( const char* fileName, Bool_t kGraphics = kFALSE, Double_t promptLow = 0, Double_t delayedLow = 0, Double_t deltaTLow  = 1.e-6, Double_t deltaTHigh = 100.e-6, Bool_t kNuLat = kFALSE );
//  void			SEDAQ();
////void			AngularRecon( const char* fileName, Bool_t kGraphics = kFALSE );
//  void			AngularRecon();
////void			RATPACEventViewer( const char* fileName, TString cellExpr = ".*" );
//  void			RATPACEventViewer();
//  void			Analyze();
//  void			AnalyzeScint();
//  void			AnalyzeTracks();
////void			DrawPlot(enum) // individ. plots
////void			RemoveCut(TCut) //temp -- return ptr for TObjArray, TTree, TSelection, other?
////void			Voxelize(xyz_quant_data)

//Integrating the TRATVolume class to ROOT.
ClassDef(TRATVolume,1)

}; //endclass

// all pau!   )
#endif
