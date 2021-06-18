// neutronInitialMomenta -- prepare a skymap of initial neutron directions
//   from a RAT-PAC IBD run
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 6/21 ~ //


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


#include <TMath.h>


TTree* neutronInitialMomenta(const char* fileName = "") {

// filename stuff
if (fileName == "") {
  if (gFile != 0x0) {
    TString filename = gFile->GetName();
  } else {
    gROOT->Error("No file specified or loaded.", "%s/\n");
    return 0x0;
  }
} else {
  TString filename = fileName;
  TFile* f = TFile::Open(filename);
}
TString datarun = filename(0,filename.Index(".root"));
TPair* tp = db->FindObject("DETECTOR[].experiment");
TObjString* tos = tp->Value();
TString detectorpath = tos->GetString();
detectorpath.ReplaceAll("\"", "");
TObjArray* toa = detectorpath.Tokenize("/");
tos = (TObjString*)toa->At(toa->GetEntries()-1);
TString detector = tos->GetString();

// RAT-PAC object init
//RAT::DSReader r(gFile->GetName());
RAT::DSReader r(filename.Data());
RAT::DS::Root* ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
RAT::TrackNode* n = c.Here();

// general init
Int_t k, N = r.GetTotal();
Double_t lattd, longtd;
TVector3 p;
Double_t pi = TMath::Pi();

// prepare new TTree
TTree* T3 = new TTree("T3", "Initial Neutron Momenta");
T3->Branch("lattd", &lattd);
T3->Branch("longtd", &longtd);

// MAIN
for ( k=0; k<N-1; k++ ) {
  ds = r.GetEvent(k);
  RAT::TrackNav nav(ds);
  c = nav.Cursor(0);
  n = c.GoChild(1);
  p = n->GetMomentum();
  p = -p; // for a nicer view if neutrinos had momenta parallel to {-1,0,0}
  longtd = p.Phi()*180/pi;
  lattd = 90 - (p.Theta()*180/pi);
  T3->Fill();
}

// draw skymap
TCanvas* can = new TCanvas("can", detector+"\t|\t"+filename, 820, 120, 800, 700);
T3->Draw("lattd:longtd", "", "aitoff");
TH2D* hmap = (TH2D*)htemp;
hmap->SetTitle(T3->GetTitle());
hmap->GetXaxis()->SetLimits(-180., 180.);
hmap->GetYaxis()->SetLimits(-90., 90);
hmap->GetXaxis()->SetTitle("Longitude (^{o})");
hmap->GetYaxis()->SetTitle("Lattitude (^{o})");
can->Draw();

// all pau!   )
return T3;
}
