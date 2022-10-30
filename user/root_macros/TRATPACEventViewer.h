// TRATPACEventViewer
/// Class for viewing RAT-PAC detector geometries
//   and particle tracks in ROOT
// -- Note: For CINT, load using gROOT->LoadMacro("TRATPACEventViewer.cxx");
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 09/2022 ~ //

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

#ifndef TRATPACEventViewer
#define TRATPACEventViewer

#include <TRATGeo.cxx>

class TRATPACEventViewer : public TClass {

private:
  // members
  TString		fFileName;							// name of fDataFile
  TFile*		fDataFile;							// file containing RAT-PAC output
  /* RAT::DSReader		fDSReader;							// RAT-PAC data-structure reader */
  TTree*		fTree;								// RAT-PAC output tree
  TString		fVolumePattern;							// string used to create fVolumePatternRE
  TRATGeo*		fRATGeo;							// manager for RAT-PAC volume info
  TGeoManager*		fGeoManager;							// manager for ROOT volumes
  /* Int_t			fTopChildID;							// top-level child index (see SetTopChildID in source file) */
  Bool_t		fkHighlight;							// cell-highlight mode on/off
  TCanvas*		fCanvas;							// main canvas
  Long64_t		fTotalEvents;							// total top-level MC events in fDataFile
  Long64_t		fCurrentEvent;							// the currently-active MC event

private:
  // internal methods
  /* void			Init();								// initialize */
  void			SetCurrentEvent(Long64_t eventID=0) { fCurrentEvent = eventID; }
  void			HighlightCells();							// highlight cells containing IBD vertex, e+ annihilation, and n-capture (for IBD)

public:
  // public methods
  TRATPACEventViewer();									// default ctor
  TRATPACEventViewer(const char* fileName, const char* volumePattern = ".*");		// regular ctor
  // init
  Init(const char* fileName, const char* volumePattern = ".*");				// initialize
  // getters
  TString		GetFileName() { return fFileName; }
  TFile*		GetDataFile() { return fDataFile; }
  /* RAT::DSReader		GetDSReader() { return fDSReader; } */
  TTree*		GetTree() { return fTree; }
  TString		GetVolumePattern() { return fVolumePattern; }
  TRATGeo*		GetRATGeo() { return fRATGeo; }
  TGeoManager*		GetGeoManager() { return fGeoManager; }
  /* Int_t			GetTopChildID() { return fTopChildID; } */
  Bool_t		GetHighlightMode() { return fkHighlight; }
  TCanvas*		GetCanvas() { return fCanvas; }
  Long64_t		GetTotalEvents() { return fTotalEvents; }
  Long64_t		GetCurrentEvent() { return fCurrentEvent; }
  // setters
  void			SetData( Double_t someArg ) { fSomeData = someArg; }
  void			SetVolumePattern(const char* pattern) { fVolumePattern = pattern; }
  /* void			SetTopChildID(Int_t index=1) { fTopChildID = index; } */
  void			SetHighlightMode(Bool_t bValue=kTRUE) { fkHighlight = bValue; }
  // MAIN
  void			DrawGeometry();							// build and draw detector geometry
  void			DrawTracks(Long64_t event=0);					// draw particle tracks for a given event
  void			DrawNextEvent();
  void			DrawPrevEvent();
  void			RedrawCurrentEvent() { DrawTracks(GetCurrentEvent()); }
  void			Zoom(Double_t zoomFactor=2);
  void			ToggleInertVis();						// toggle inert cells on/off (checkerboards only)

// Integrating the TRATPACEventViewer class into ROOT
ClassDef(TRATPACEventViewer,1) // with class version number

}; //end class

// all pau!   )
#endif

