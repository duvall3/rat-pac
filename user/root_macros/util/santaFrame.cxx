// santaFrame -- for antineutrino-source imaging
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2022 ~ //

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

void santaFrame( const char* filename, Double_t phiTrue = 0. ) {

//DEBUG
/* { */
/* const char* filename = "OFFAXIS_SANTA_00DEG_ncap.root"; */
/* Double_t phiTrue = 0.; */
/* cout << phiTrue << endl; */

// for graphics output:
Bool_t kGraphics = kTRUE;
/* Bool_t kGraphics = kFALSE; */
if (kGraphics) {
  // switch default rendering engine
  const Bool_t origOGL = gStyle->GetCanvasPreferGL();
  if (! origOGL) gStyle->SetCanvasPreferGL(kTRUE);
  // set to batch mode if needed
  const Bool_t origBatch = gROOT->IsBatch();
  if (! origBatch) gROOT->SetBatch(kTRUE);
}

// init
TFile *f = TFile::Open(filename);
TTree *T = T_ncap;
Long64_t k = 0, N = T->GetEntries();
Double_t longtd, lattd;
Bool_t volCheck;
T->SetBranchAddress("longtd", &longtd);
T->SetBranchAddress("lattd", &lattd);
T->SetBranchAddress("volCheck", &volCheck);
TString htitle;
htitle.Form("#phi_{true} = %2d^{o}", TMath::Nint(phiTrue));
/* TH2D* h_sq = new TH2D("h_sq", htitle.Data(), 100, -70., 70., 100, -70., 70.); */
TH2D* h_sq = new TH2D("h_sq", htitle.Data(), 40, -65., 65., 40, -65., 65.);

// MAIN
for (k=0; k<N; k++ ) {
  T->GetEntry(k);
//if ( (TMath::Abs(lattd)<70.) & (TMath::Abs(longtd)<70.) ) {
  if (volCheck) {
    h_sq->Fill(longtd, lattd);
  }
}

// draw
TCanvas *c_sq = new TCanvas("c_sq", "c_sq");
h_sq->Draw("col");
TAxis *h_sqx = h_sq->GetXaxis();
TAxis *h_sqy = h_sq->GetYaxis();
h_sqx->SetTitle("Latitude (^{o})");
h_sqy->SetTitle("Longitude (^{o})");

// print
TString saveName;
/* saveName.Form("%d_col.png", TMath::Nint(phiTrue)); */
/* c_sq->Print(saveName.Data()); */
/* h_sq->Draw("aitoff"); */
/* saveName.Form("%d_nmap.png", TMath::Nint(phiTrue)); */
/* c_sq->Print(saveName.Data()); */
h_sq->Draw("cont4");
h_sqx->SetTitle("y (m)");
h_sqy->SetTitle("z (m)");
h_sqy->SetTitleOffset(1.1);
h_sqx->SetLimits(-1., 1.);
h_sqy->SetLimits(-1., 1.);
saveName.Form("%d_cont.png", TMath::Nint(phiTrue));
c_sq->Print(saveName.Data());
c_sq->Close();
f->Close();

// reset graphics settings if applicable
if (kGraphics) {
  if (! origOGL) gStyle->SetCanvasPreferGL(kFALSE);
  if (! origBatch) gROOT->SetBatch(kFALSE);
}

}
