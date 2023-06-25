// TRATPACEventViewer
/// Class for viewing RAT-PAC detector geometries and MC events in ROOT //DOC//
// -- Note: For CINT, load using gROOT->LoadMacro("TRATPACEventViewer.cxx");
/**
 * This class imports detector geometries and MC-event data
 *   from RAT-PAC ".root" output files and displays them
 *   using ROOT's *TGeoManager* system.  
 * **Note: This class requires ROOT to be integrated with 
 *   a working installation of RAT-PAC.** See the [RAT-PAC documentation](https://rat.readthedocs.io/en/latest)
 *   for instructions.  
 * Typical Usage:  
 * 1. Create a TRATPACEventViewer object using one of the following:  
 *    - Call the ctor with the filename and [optionally] a regex for volume selection; or  
 *    - Call the ctor without arguments, then call the Init() method with the filename and [optionally] a regex for volume selection.  
 * 2. Call DrawGeometry().  
 * 3. Adjust the camera using Zoom() and the mouse if desired.  
 * 4. View at least one event using DrawTracks().  
 * 5. View additional events using any of DrawTracks(), DrawNextEvent(), and DrawPrevEvent().  
 *
 * Example, assuming a RAT-PAC output file named `Datarun0.root`:  
 * ```cpp
 * TRATPACEventViewer R("Datarun0.root");
 * R.DrawGeometry();
 * R.Zoom(5.0);
 * R.DrawTracks(0);
 * R.DrawNextEvent();
 * R.DrawNextEvent();
 * // etc.
 * ```
 */
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
  TString		fFileName;							///< Name of input RAT-PAC/ROOT file containing at least 1 MC event
  TFile*		fDataFile;							///< Input *TFile*
  /* RAT::DSReader		fDSReader;							///< RAT-PAC data-structure reader */
  TTree*		fTree;								///< RAT-PAC output tree
  TString		fVolumePattern;							///< String used to create *TRegexp* pattern for selecting volumes
  TRATGeo*		fRATGeo;							///< Manager for RAT-PAC volume info
  TGeoManager*		fGeoManager;							///< Manager for ROOT volumes
  /* Int_t			fTopChildID;							///< top-level child index (see SetTopChildID in source file) */
  Bool_t		fkHighlight;							///< Cell-highlight mode on/off
  TCanvas*		fCanvas;							///< Main canvas
  Long64_t		fTotalEvents;							///< Total top-level MC events in input file
  Long64_t		fCurrentEvent;							///< The currently-active MC event

private:
  // internal methods
  /* void			Init();								///< Initialize */
  void			SetCurrentEvent(Long64_t eventID=0) { fCurrentEvent = eventID; }	///< Set the currently-active MC event
  void			HighlightCells();							///< Highlight cells containing IBD vertex, e+ annihilation, and n-capture (for IBD)

public:
  // public methods
  TRATPACEventViewer();									///< Default ctor
  TRATPACEventViewer(const char* fileName, const char* volumePattern = ".*");		///< Regular ctor
  // init
  Init(const char* fileName, const char* volumePattern = ".*");				///< Initialize
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
  void			SetVolumePattern(const char* pattern) { fVolumePattern = pattern; }
  /* void			SetTopChildID(Int_t index=1) { fTopChildID = index; } */
  void			SetHighlightMode(Bool_t bValue=kTRUE) { fkHighlight = bValue; }
  // MAIN
  void			DrawGeometry();							///< Build and draw detector geometry
  void			DrawTracks(Long64_t event=0);					///< Draw particle tracks for a given event
  void			DrawNextEvent();
  void			DrawPrevEvent();
  void			RedrawCurrentEvent() { DrawTracks(GetCurrentEvent()); }
  void			Zoom(Double_t zoomFactor=2);					///< Simple shortcut for adjusting zoom when running interactively
  /* void			ToggleInertVis();						///< Toggle inert cells on/off (checkerboards only) // NOT YET IMPLEMENTED */

// Integrating the TRATPACEventViewer class into ROOT
ClassDef(TRATPACEventViewer,1) // with class version number

}; //end class

// all pau!   )
#endif

