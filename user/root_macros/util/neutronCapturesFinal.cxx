// void neutronCapturesFinal( <nCap_filename> )
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

/* void neutronCapturesFinal( const char* filename, TVector3 nu_dirn = TVector3(-1.,0.,0.) ) { */
void neutronCapturesFinal( const char* filename, Double_t phi_source_deg = 0. ) {

// for graphics output:
// switch default rendering engine
const Bool_t origOGL = gStyle->GetCanvasPreferGL();
if (! origOGL) gStyle->SetCanvasPreferGL(kTRUE);
// set to batch mode if needed
const Bool_t origBatch = gROOT->IsBatch();
if (! origBatch) gROOT->SetBatch(kTRUE);

// init
TFile *fnc = TFile::Open(filename, "update");
TTree *T_ncap = (TTree*)gDirectory->Get("T_ncap");
Long64_t k = 0, N = T_ncap->GetEntries();
Double_t phi_source = phi_source_deg * TMath::DegToRad();
TVector3 nu_dirn(TMath::Cos(phi_source), TMath::Sin(phi_source), 0.);
// zeta (neutron-reconstructed source direction)
TString savename = filename;
savename.ReplaceAll("_ncap.root","");
// capture/interevent time
Double_t *tbins = logBins(1.e-10, 1.e3);
TH1D *h_dt = new TH1D("h_dt", "Capture Time", 100, tbins);
// cos[psi]
TH1D *h_cospsi = new TH1D("h_cospsi", "Cos[#psi]", 100, -1.01, 1.01);

// tree
Double_t dt, cospsi;
Bool_t volCheck;
TVector3 *dr;
T_ncap->SetBranchAddress("dt", &dt);
T_ncap->SetBranchAddress("volCheck", &volCheck);
T_ncap->SetBranchAddress("dr", &dr);
TBranch* br_cp = T_ncap->Branch("cospsi", &cospsi);

// MAIN
for ( k=0; k<N; k++ ) {
  T_ncap->GetEntry(k);
  cospsi = nu_dirn.Dot( dr->Unit() );
  if (volCheck) {
    h_dt->Fill(dt);
    h_cospsi->Fill(cospsi);
    br_cp->Fill();
  }
}

// plots

// zeta
TCanvas *c_zeta = new TCanvas("c_zeta", "c_zeta");
T_ncap->Draw("zeta>>h_zeta", "volCheck==1");
h_zeta->SetTitle("Reconstructed Azimuthal Angle to Source");
h_zeta->GetXaxis()->SetTitle("#varphi (^{o})");

// dt
TCanvas *c_dt = new TCanvas("c_dt", "c_dt");
/* c_dt->SetLogy(kTRUE); */
c_dt->SetLogx(kTRUE);
h_dt->Draw();
h_dt->GetXaxis()->SetTitle("#Deltat (s)");
h_dt->GetXaxis()->SetTitleOffset(1.15);

// cos[psi]
TCanvas *c_cp = new TCanvas("c_cp", "c_cp");
h_cospsi->Draw();
h_cospsi->SetAxisRange(0., 1.4 * h_cospsi->GetMaximum(), "Y");
h_cospsi->GetXaxis()->SetTitle("cos(#psi)");

// skymap
TCanvas *c_map = new TCanvas("c_map", "c_map");
T_ncap->Draw("lattd:longtd>>h_map", "volCheck==1", "aitoff");
h_map->SetTitle("Skymap to Reconstructed Source Direction");
h_map->GetXaxis()->SetLimits(-180., 180.);
h_map->GetYaxis()->SetLimits(-90., 90.);
h_map->GetXaxis()->SetTitle("lattitude (^{o})");
h_map->GetYaxis()->SetTitle("longitude (^{o})");

// fit phi
c_zeta->cd();
// init
Double_t N_phi = h_zeta->GetEntries();
Double_t phiLower, phiUpper, phiTrue = phi_source_deg;
Double_t phiBinWidth = h_zeta->GetBinWidth(0);
Int_t lbin, ubin;
lbin = h_zeta->FindFirstBinAbove(0);
ubin = h_zeta->FindLastBinAbove(0);
phiLower = h_zeta->GetBinLowEdge(lbin);
phiUpper = h_zeta->GetBinLowEdge(ubin) + phiBinWidth;
// fitting function with generic starting guesses for fit parameters
TF1 *phi_phit = new TF1("phi_phit", "[0] + [1]*TMath::Gaus(x,[2],[3])", phiLower, phiUpper); // "[ph]it = fit" because I'm a dork
Double_t sigma_guess = 20.;	// param [3]: guess width ~ few*10^1 degrees
Double_t phi_guess = phiTrue;	// param [2]: guess actual source direction
Double_t A_guess = N_phi / ( sigma_guess * TMath::Sqrt(2*TMath::Pi()) ); // param [1]: usual Gaussian normalization
Double_t noise_guess = TMath::Mean(h_zeta->GetNbinsX(), h_zeta->GetArray()); // param [0]: mean histogram level ~ baseline offset
phi_phit->SetParameters(noise_guess, A_guess, phi_guess, sigma_guess);
phi_phit->SetLineColor(kRed);
// now perform fit
TFitResultPtr phiFRP = h_zeta->Fit(phi_phit, "SR");
TFitResult *phiFR = phiFRP.Get();
// turn on full stats
TPaveStats *phiStats = (TPaveStats*)c_zeta->GetPrimitive("stats");
if (phiStats != 0) phiStats->SetOptFit(kTRUE);

// all
TCanvas *c_all = new TCanvas("c_all", "c_all");
c_all->Divide(2,2);
c_all_1->cd();
h_zeta->DrawCopy();
TPaveStats *st_zeta_all = (TPaveStats*)c_all_1->GetPrimitive("stats");
if (st_zeta_all != 0) st_zeta_all->SetOptFit(kFALSE);
c_all_2->cd();
c_all_2->SetLogx(kTRUE);
h_dt->Draw();
c_all_3->cd();
h_cospsi->Draw();
c_all_4->cd();
h_map->Draw("aitoff");

/* // list */
/* TList *plotList = new TList; */
/* plotList->Add(c_zeta); */
/* plotList->Add(c_dt); */
/* plotList->Add(c_cp); */
/* plotList->Add(c_map); */

// save, print, close
// canvases
c_zeta->Print(savename+"_zeta.png");
c_dt->Print(savename+"_dt.png");
c_cp->Print(savename+"_cp.png");
c_map->Print(savename+"_map.png");
c_all->Print(savename+"_all.png");
c_zeta->Write("c_zeta");
c_dt->Write("c_dt");
c_cp->Write("c_cp");
c_map->Write("c_map");
c_all->Write("c_all");
c_zeta->Close();
c_dt->Close();
c_cp->Close();
c_map->Close();
c_all->Close();
/* plotList->Write();//"plotList"); */
// file &c.
phiFR->Write("phiFR");
fnc->Write();
fnc->Close();

// reset graphics settings if applicable
if (! origOGL) gStyle->SetCanvasPreferGL(kFALSE);
if (! origBatch) gROOT->SetBatch(kFALSE);

// all pau!   )
}
