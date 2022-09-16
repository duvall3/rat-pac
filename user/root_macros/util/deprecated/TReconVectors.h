// TReconVectors -- class to cycle through reconstructed incoming antineutrino
//   directions for individual IBD events
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

#ifndef TReconVectors
#define TReconVectors

#include "TFile.h"
#include "TTree.h"
#include "TClass.h"

class TReconVectors : public TClass {

private:
  TFile*		fFile;			// results ROOT file
  char*			fFilename;		// name of results ROOT file
  TTree*		fTree;			// results TTree
  Long64_t		fTotalEvents;		// total number of events in TTree
  Double_t		fLineWidth;		// line width
  Color_t		fLineColor;		// line color
  TVector3		fOriginVector;		// origin vector
  TPolyMarker3D		fOriginMarker;		// origin marker
  TVector3		fReconVector;		// current recon. vector
  TPolyLine3D		fReconLine;		// current recon. line
  TPolyMarker3D		fReconMarker;		// current recon. marker
  Long64_t		fEvent;			// current IBD event (i.e., TTree entry)
  TCanvas*		fCanvas;		// current TCanvas
  TLegend*		fLegend;		// plot legend
  TPolyLine3D		fXaxis;			// x axis
  TPolyLine3D		fYaxis;			// y axis
  TPolyLine3D		fZaxis;			// z axis
  TPolyMarker3D		fXaxisLabel;		// x axis label

public:
  TReconVectors(const char* filename);
  TFile*		GetFile() const { return fFile; }
  char*			GetFilename() const { return fFilename; }
  TTree*		GetTree() const { return fTree; }
  Long64_t		GetTotalEvents() const { return fTotalEvents; }
  Double_t		GetLineWidth() const { return fLineWidth; }
  Color_t		GetLineColor() const { return fLineColor; }
  TVector3		GetOriginVector() const { return fOriginVector; }
  TPolyMarker3D		GetOriginMarker() const { return fOriginMarker; }
  TVector3		GetReconVector() const { return fReconVector; }
  TPolyLine3D		GetReconLine() const { return fReconLine; }
  TPolyMarker3D		GetReconMarker() const { return fReconMarker; }
  Long64_t		GetEvent() const { return fEvent; }
  TCanvas*		GetCanvas() const { return fCanvas; }
  TLegend*		GetLegend() const { return fLegend; }
  void			SetLineColor(Color_t _color);
  void			SetLineWidth(Double_t _width);
  void			DrawEvent(Long64_t event);
  void			DrawNextEvent();
  void			DrawPrevEvent();

//Integrating the TReconVectors class to ROOT.
ClassDef(TReconVectors,1)

}; //endclass

// all pau!   )
#endif
