// TRATGeo -- class for assembling geometry in a RAT-PAC ROOT file
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

#ifndef TRATGeo
#define TRATGeo

#include "TFile.h"
#include "TClass.h"
#include <TRATVolume.cxx>

//namespace TRG {

class TRATGeo : public TClass {

private:
  TFile*		fFile;			// current ROOT datafile
  const char*		fFileName;		// name of current ROOT datafile
  TString 		fExperiment;		// name of RAT-PAC experiment
  TString		fExperimentPath;	// path to directory defining fExperiment, usually either absolute or relative to $RATROOT/data
  const TMap*		fDB;			// RAT-PAC database TMap*
  TList*		fVolumeList;		// list of TRATVolume objects
  TList*		fActiveCells;		// list of active cells for checkerboard detectors
  TList*		fInertCells;		// list of inert cells for checkerboard detectors

private:
  void			Init();			// initialize
  void			FindExperiment();	// fill experiment name, path, etc.
  void			FindCheckerboardActive( Int_t kDims ); // fill list of active checkerboard cells
  void			FindCheckerboardInert( Int_t kDims ); // fill list of inert checkerboard cells

public:
  TRATGeo();
  void			Build();		// construct TRATVolume list
  void			BuildCheckerboard( const Int_t kDims = 3 ); // construct active/inert checkerboard lists
  TFile*                GetFile() const { return fFile; }
  virtual const char*   GetFileName() const { return fFileName; }
  TString               GetExperiment() const { return fExperiment; }
  TString               GetExperimentPath() const { return fExperimentPath; }
  TMap*                 GetDB() const { return fDB; }
  TList*		GetListOfVolumes() const { return fVolumeList; }
  TRATVolume*		GetVolume(const char* volumeName);
  Int_t			GetEntries() const { return fVolumeList->GetEntries(); }
  TList*		GetCheckerboardActive() const { return fActiveCells; }
  TList*		GetCheckerboardInert() const { return fInertCells; }
  TList*		FindVolumesContaining( TVector3 location, Bool_t kPrint = kFALSE );
  TList*		FindVolumesContaining( Double_t x, Double_t y, Double_t z, Bool_t kPrint = kFALSE );
  TRATVolume*		FindLowestVolumeContaining( TVector3 location );
  TRATVolume*		FindLowestVolumeContaining( Double_t x, Double_t y, Double_t z );
  void			ShowVolume(const char* volumeName);
  void			ShowAll();
  void			Types();		// print volume types
  void			Materials();		// print volume materials
  void			Mothers();		// print volume mother-volumes
  void			Sizes();		// print volume (half-)sizes
  void			Positions();		// print absolute positions

//Integrating the TRATGeo class to ROOT.
ClassDef(TRATGeo,4)

}; //endclass

//} // namespace TRG

// all pau!   )
#endif
