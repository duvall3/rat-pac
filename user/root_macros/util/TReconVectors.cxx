// drawReconVectors -- class to cycle through reconstructed incoming antineutrino
//   directions (from SEDAQ2.cxx) for individual IBD events
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

#include <TReconVectors.h>

// Call the ClassImp() macro to give the TReconVectors class RTTI and full I/O capabilities.
#if !defined(__CLING__)
  ClassImp(TReconVectors);
#endif

const TString defaultName = "TReconVectors";
const TString defaultTitle = "class for drawing reconstructed neutrino directions";
const Color_t defaultLineColor = kCyan;
const Double_t defaultLineWidth = 2.;
const TVector3 defaultOriginVector = TVector3(0.,0.,0.);
const TPolyLine3D defaultLine(2);
Double_t xp, xd, yp, yd, zp, zd;

//______________________________________________________________________________
// ctor
TReconVectors::TReconVectors(const char* filename)
{
  SetName(defaultName);
  SetTitle(defaultTitle);
  fFile = TFile::Open(filename);
  if (fFile==0) {
    this->Error("TReconVectors", "File not found");
    return;
  } else {
    // init
    fFilename = fFile->GetName();
    fTree = (TTree*)gDirectory->Get("T2");
    fTotalEvents = fTree->GetEntries();
    fLineWidth = defaultLineWidth;
    fLineColor = defaultLineColor;
    fOriginVector = defaultOriginVector;
    fOriginMarker = TPolyMarker3D(1);
    fReconVector = TVector3(0.,0.,0.);
    fReconLine = defaultLine;
    fReconMarker = TPolyMarker3D(1);
    fEvent = 0;
    fCanvas = new TCanvas("c_TReconVectors", defaultName);
    fCanvas->cd();
    fCanvas->SetFillColor(kBlack);
    fCanvas->Draw();
    fLegend = new TLegend;
    // create and draw axes
    fXaxis.SetPoint(0, 0., 0., 0.);
    fYaxis.SetPoint(0, 0., 0., 0.);
    fZaxis.SetPoint(0, 0., 0., 0.);
    fYaxis.SetPoint(0, 0., 0., 0.);
    fZaxis.SetPoint(0, 0., 0., 0.);
    fXaxis.SetPoint(1, 1., 0., 0.);
    fYaxis.SetPoint(1, 0., 1., 0.);
    fZaxis.SetPoint(1, 0., 0., 1.);
    fXaxis.SetLineColor(kRed);
    fYaxis.SetLineColor(kBlue);
    fZaxis.SetLineColor(kGreen);
    fXaxis.SetLineWidth(defaultLineWidth);
    fYaxis.SetLineWidth(defaultLineWidth);
    fZaxis.SetLineWidth(defaultLineWidth);
    fXaxis.Draw();
    fYaxis.Draw("same");
    fZaxis.Draw("same");
    // crudely label x-axis
    fXaxisLabel = TPolyMarker3D(1);
    fXaxisLabel.SetPoint(0, 1.1, 0., 0.);
    fXaxisLabel.SetMarkerStyle(5);
    fXaxisLabel.SetMarkerColor(kRed);
    fXaxisLabel.SetMarkerSize(2.);
    fXaxisLabel.Draw("same");
    // legend
    fLegend->AddEntry(&fXaxis, "x");
    fLegend->AddEntry(&fYaxis, "y");
    fLegend->AddEntry(&fZaxis, "z");
    fLegend->Draw();
    // set marker and line data / attributes
    fOriginMarker.SetPoint(0, fOriginVector.X(), fOriginVector.Y(), fOriginVector.Z());
    fOriginMarker.SetMarkerStyle(8);
    fOriginMarker.SetMarkerSize(1.5);
    fOriginMarker.SetMarkerColor(fLineColor);
    fReconLine.SetPoint(0, fOriginVector.X(), fOriginVector.Y(), fOriginVector.Z());
    fReconLine.SetLineWidth(fLineWidth);
    fReconLine.SetLineColor(fLineColor);
    fReconMarker.SetPoint(0, fReconVector.X(), fReconVector.Y(), fReconVector.Z());
    fReconMarker.SetMarkerStyle(3);
    fReconMarker.SetMarkerSize(3);
    fReconMarker.SetMarkerColor(fLineColor);
    // address TTree branches
    fTree->SetBranchAddress("prompt_cand_x", &xp);
    fTree->SetBranchAddress("prompt_cand_y", &yp);
    fTree->SetBranchAddress("prompt_cand_z", &zp);
    fTree->SetBranchAddress("delayed_cand_x", &xd);
    fTree->SetBranchAddress("delayed_cand_y", &yd);
    fTree->SetBranchAddress("delayed_cand_z", &zd);
  }
}

//______________________________________________________________________________
// SetLineColor
TReconVectors::SetLineColor(Color_t _color)
{
  fLineColor = _color;
  fOriginMarker.SetMarkerColor(fLineColor);
  fReconLine.SetLineColor(fLineColor);
  fReconMarker.SetMarkerColor(fLineColor);
}

//______________________________________________________________________________
// DrawEvent
TReconVectors::DrawEvent(Long64_t _event)
{
  fCanvas->cd();
  fEvent = _event;
  fTree->GetEntry(fEvent);
  fReconVector = TVector3( xd-xp, yd-yp, zd-zp ).Unit();
  fReconLine.SetPoint( 1, fReconVector.X(), fReconVector.Y(), fReconVector.Z() );
  fReconMarker.SetPoint( 0, fReconVector.X(), fReconVector.Y(), fReconVector.Z() );
  fXaxis.Draw();
  fXaxisLabel.Draw("same");
  fYaxis.Draw("same");
  fZaxis.Draw("same");
  fReconLine.Draw("same");
  fOriginMarker.Draw();
  fReconMarker.Draw("same");
//gPad->GetView()->ShowAxis();
  fLegend->AddEntry(&fReconLine, "#nu_{e}");
  fLegend->Draw();
}

//______________________________________________________________________________
// DrawNextEvent
TReconVectors::DrawNextEvent()
{
  fEvent++;
  DrawEvent(fEvent);
}

//______________________________________________________________________________
// DrawPrevEvent
TReconVectors::DrawPrevEvent()
{
  fEvent--;
  DrawEvent(fEvent);
}

////______________________________________________________________________________
//// 
//TReconVectors::
//{
//}

////______________________________________________________________________________
//// 
//TReconVectors::
//{
//}

////______________________________________________________________________________
//// 
//TReconVectors::
//{
//}

//______________________________________________________________________________
// override Print
TReconVectors::Print()
{
  fFile->Print();
  cout << fFilename << endl;
  fTree->ls();
  cout << "Total Events: " << fTotalEvents << endl;
  fOriginVector.Print();
  cout << "Line Width: " << fLineWidth << endl;
  cout << "Line Color: " << fLineColor << endl;
  cout << "Event: " << fEvent << endl;
  fOriginMarker.Print();
  fReconVector.Print();
  fReconLine.Print();
  fReconMarker.Print();
}

// all pau!   )
