// neutronCaptures -- prepare a skymap of neutron-capture displacements
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


TTree* neutronCaptures(const char* fileName = "", bool save_tf = kFALSE, int neutron_child = 0) {

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
TString detector;
TMap* db = (TMap*)gFile->FindObjectAny("db");
if ( db != 0x0 ) {
  TPair* tp = db->FindObject("DETECTOR[].experiment");
  TObjString* tos = tp->Value();
  TString detectorpath = tos->GetString();
  detectorpath.ReplaceAll("\"", "");
  TObjArray* toa = detectorpath.Tokenize("/");
  tos = (TObjString*)toa->At(toa->GetEntries()-1);
  detector = tos->GetString();
}

// RAT-PAC object init
RAT::DSReader r(filename.Data());
RAT::DS::Root* ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
RAT::TrackNode* n = c.Here();

// general init
Int_t k, N = r.GetTotal();
Double_t lattd, longtd;
TVector3 dr, pi_hat = TVector3(-1,0,0);
Double_t xi, yi, zi, xf, yf, zf;
Double_t R, cos_psi, zeta;
const Double_t pi = TMath::Pi();

// prepare new TTree
TTree* T = new TTree("T", "Neutron-Capture Displacements");
T->Branch("lattd", &lattd);
T->Branch("longtd", &longtd);
T->Branch("R", &R);
T->Branch("cos_psi", &cos_psi);
T->Branch("zeta", &zeta);

// MAIN
for ( k=0; k<N; k++ ) {
  ds = r.GetEvent(k);
  RAT::TrackNav nav(ds);
  c = nav.Cursor(0);
//n = c.GoChild(0); // neutron-only run
//n = c.GoChild(1); // IBD run
  n = c.GoChild(neutron_child);
  xi = n->GetEndpoint().X(); yi = n->GetEndpoint().Y(); zi = n->GetEndpoint().Z();
  n = c.GoTrackEnd();
  if ( (n->GetProcess() == "nCapture") | (n->GetProcess() == "neutronInelastic") ) {
    xf = n->GetEndpoint().X(); yf = n->GetEndpoint().Y(); zf = n->GetEndpoint().Z();
    dr = TVector3(xf-xi, yf-yi, zf-zi);
    R = dr.Mag();
//  cos_psi = pi_hat.Dot(dr.Unit());
    cos_psi = -dr.X() / R; // for p_hat_init = {-1,0,0}
    zeta = TMath::ATan2( dr.Z(), dr.Y() ) * 180/pi;
    dr = -dr; // for nicer view if initial direction was {-1,0,0}
    longtd = dr.Phi()*180/pi;
    lattd = 90 - (dr.Theta()*180/pi);
    T->Fill();
    nav.Clear();
  }
}

// draw skymap
TCanvas* can_skymap = new TCanvas("can_skymap", detector+" | "+filename, 820, 120, 800, 700);
T->Draw("lattd:longtd>>hmap", "", "aitoff");
hmap->SetTitle(T->GetTitle());
hmap->GetXaxis()->SetLimits(-180., 180.);
hmap->GetYaxis()->SetLimits(-90., 90);
hmap->GetXaxis()->SetTitle("Longitude (^{o})");
hmap->GetYaxis()->SetTitle("Lattitude (^{o})");
can_skymap->Draw();

// draw capture-distance plot
TCanvas* can_capdist = new TCanvas("can_capdist", detector+" | "+filename, 820, 120, 800, 700);
T->Draw("R>>hdis", "R<1000");
hdis->SetTitle(T->GetTitle());
hdis->GetXaxis()->SetTitle("Neutron-Capture Distance (mm)");
hdis->SetLineWidth(2);
hdis->SetLineColor(kBlue);
can_capdist->SetLogy(kTRUE);
can_capdist->Draw();

// draw cos_psi plot
TCanvas* can_cospsi = new TCanvas("can_cospsi", detector+" | "+filename, 820, 120, 800, 700);
TH1D* hcospsi = new TH1D("hcospsi", T->GetTitle(), 10, -1., 1.);
T->Draw("cos_psi>>hcospsi");
hcospsi->GetXaxis()->SetTitle("cos[#psi]");
hcospsi->GetYaxis()->SetRangeUser(0., 1.2*hcospsi->GetMaximum());
hcospsi->SetLineWidth(2);
hcospsi->SetLineColor(kRed);
//TPaveStats* st_cospsi = (TPaveStats*)can_cospsi->GetPrimitive("stats");
//st_cospsi->SetX1(-1.);
//st_cospsi->SetX2(2.5);
can_cospsi->Draw();

// draw zeta plot
TCanvas* can_zeta = new TCanvas("can_zeta", detector+" | "+filename, 820, 120, 800, 700);
TH1D* hzeta = new TH1D("hzeta", T->GetTitle(), 100, -180., 180.);
T->Draw("zeta>>hzeta");
Double_t zeta_maxcount = hzeta->GetMaximum();
hzeta->GetYaxis()->SetRangeUser(0., 1.2*zeta_maxcount);
hzeta->GetXaxis()->SetTitle("#zeta (^{o})");
hzeta->SetLineWidth(2);
hzeta->SetLineColor(kMagenta);
can_zeta->Draw();

// save if desired
if (save_tf == kTRUE) {
  TString savename_skymap = datarun+"_nCapDirections.png";
  TString savename_capdist = datarun+"_nCapDistances.png";
  TString savename_cospsi = datarun+"_nCapCosPsi.png";
  TString savename_zeta = datarun+"_nCapZeta.png";
  can_skymap->SaveAs(savename_skymap);
  can_capdist->SaveAs(savename_capdist);
  can_cospsi->SaveAs(savename_cospsi);
  can_zeta->SaveAs(savename_zeta);
}

// all pau!   )
return T;
}
