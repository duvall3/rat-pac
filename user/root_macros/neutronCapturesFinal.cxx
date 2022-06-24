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

#include <TRATGeo.h>

/* void neutronCapturesFinal( const char* filename, TVector3 nu_dirn = TVector3(-1.,0.,0.) ) { */
void neutronCapturesFinal( const char* filename, Double_t phi_source_deg = TMath::QuietNaN() ) {

// TODO: implement position quantization in // MAIN

// for graphics output:
// switch default rendering engine
const Bool_t origOGL = gStyle->GetCanvasPreferGL();
if (! origOGL) gStyle->SetCanvasPreferGL(kTRUE);
// set to batch mode if needed
const Bool_t origBatch = gROOT->IsBatch();
if (! origBatch) gROOT->SetBatch(kTRUE);

// init
// file operations
TString inFileName(filename);
TString outFileName = inFileName;
outFileName.ReplaceAll("\.root", "_res.root");
gSystem->CopyFile(inFileName.Data(), outFileName.Data(), kTRUE);
TFile *fnc = TFile::Open(outFileName, "update");
// general
TTree *T_ncap = (TTree*)gDirectory->Get("T_ncap");
TRATGeo g;
g.Build();
TRATVolume *startVolume, *endVolume;
Long64_t k = 0, N = T_ncap->GetEntries();
Double_t phi_source = phi_source_deg * TMath::DegToRad();
TVector3 nu_dirn(TMath::Cos(phi_source), TMath::Sin(phi_source), 0.);
TString savename = filename;
savename.ReplaceAll("_ncap.root","");

// if phi is not provided, attempt to extract it from the filename
if ( TMath::IsNaN(phi_source_deg) ) {
  TString phiStr(filename);
  phiStr.ToUpper();
  phiStr = phiStr( TRegexp("[0-9]+DEG") );
  phiStr = phiStr( TRegexp("[0-9]+") );
  if (phiStr.Length()==0) {
    gROOT->Error("neutronCapturesFinal", "Could not determine angle phi_source_deg; please provide as argument or include, e.g., \"15DEG\" in filename. Exiting.\n");
    return;
  } else {
    phi_source_deg = phiStr.Atof();
  }
}

// histograms
// capture/interevent time
Double_t *tbins = logBins(1.e-10, 1.e3);
TH1D *h_dt = new TH1D("h_dt", "Capture Time", 100, tbins);
// phi
TH1D *h_phi = new TH1D("h_phi", "#varphi (Quant.)", 100, -180.01, 180.01);
// cos[psi]
TH1D *h_cospsi = new TH1D("h_cospsi", "Cos[#psi]", 100, -1.01, 1.01);
// map
TH2D *h_map = new TH2D("h_map", "Skymap", 40, -180., 180., 40, -90., 90.);

// tree
Double_t dt, cospsi, phi, theta;
TString *startVol, *volName;
Bool_t volCheck;
TVector3 *dr, dr_q;//, *dr_r;
TVector3 *startPos, *endPos;
T_ncap->SetBranchAddress("dt", &dt);
T_ncap->SetBranchAddress("startVol", &startVol);
T_ncap->SetBranchAddress("volName", &volName);
T_ncap->SetBranchAddress("volCheck", &volCheck);
T_ncap->SetBranchAddress("dr", &dr);
TBranch* br_phi = T_ncap->Branch("phi", &phi);
TBranch* br_theta = T_ncap->Branch("theta", &theta);
TBranch* br_dr_q = T_ncap->Branch("dr_q", &dr_q);
TBranch* br_cp = T_ncap->Branch("cospsi", &cospsi);

// prepare tiny perturbation to avoid zero-difference problems in segmented detectors
Double_t pertSigma = 1.e-6; // mm


// MAIN
for ( k=0; k<N; k++ ) {
  T_ncap->GetEntry(k);
  startVolume = (TRATVolume*)g.GetVolume(startVol->Data());
  endVolume = (TRATVolume*)g.GetVolume(volName->Data());
  startPos = startVolume->GetAbsolutePosition();
  endPos = endVolume->GetAbsolutePosition();
  dr_q = *endPos - *startPos;
  // apply tiny perturbation to avoid zero-difference problems in segmented detectors (see "init" above")
  dr_q.SetX( gRandom->Gaus(dr_q.X(), pertSigma) );
  dr_q.SetY( gRandom->Gaus(dr_q.Y(), pertSigma) );
  dr_q.SetZ( gRandom->Gaus(dr_q.Z(), pertSigma) );
  // reverse direction to point to source
  dr_q = -dr_q;
  phi = dr_q.Phi() * TMath::RadToDeg();
  theta = dr_q.Theta() * TMath::RadToDeg();
  /* cospsi = nu_dirn.Dot( dr->Unit() ); //FIXME -- update for quant/resn */
  cospsi = nu_dirn.Dot( dr_q.Unit() ); //FIXME -- update for quant/resn
  if (volCheck) {
    if ( dr_q.Mag() > 1.0 ) h_phi->Fill(phi); // exclude single-volume events from reconstr. //TODO -- generalization needed?
    h_dt->Fill(dt);
    h_cospsi->Fill(cospsi);
    /* h_map->Fill( dr_q.Phi()*TMath::RadToDeg(), 90. - dr_q.Theta()*TMath::RadToDeg() ); */
    h_map->Fill( phi, 90. - theta );
    br_phi->Fill();
    br_theta->Fill();
    br_dr_q->Fill();
    br_cp->Fill();
  }
}


//// plots

// phi
TCanvas *c_phi = new TCanvas("c_phi", "c_phi");
/* T_ncap->Draw("phi>>h_phi", "volCheck==1"); */
h_phi->Draw();
/* h_phi->SetTitle("Reconstructed Azimuthal Angle to Source"); */
/* TODO NOTE: T_ncap->Draw("phi", rcut+vcut) PRODUCES SIMILAR (identical?) RESULTS
 * Relatedly: TODO Switch t->Draw("phi") to t->Draw("TMath::Nint(phi)") for segmented dtrs.!
 * ^ NOTE: Will need to account for shift in results! */
h_phi->GetXaxis()->SetTitle("#varphi (^{o})");

// zeta (neutron-reconstructed source direction)
TCanvas *c_zeta = new TCanvas("c_zeta", "c_zeta");
T_ncap->Draw("zeta>>h_zeta", "volCheck==1");
h_zeta->SetTitle("Reconstructed Azimuthal Angle to Source");
h_zeta->GetXaxis()->SetTitle("#zeta (^{o})");

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
/* T_ncap->Draw("lattd:longtd>>h_map", "volCheck==1", "aitoff"); */
/* T_ncap->Draw( "dr_q.Theta()*TMath::RadToDeg() : 90. - dr_q.Phi()*TMath::RadToDeg()>>h_map", "", "aitoff"); */
h_map->Draw("aitoff");
h_map->SetTitle("Skymap to Reconstructed Source Direction");
/* h_map->GetXaxis()->SetLimits(-180., 180.); */
/* h_map->GetYaxis()->SetLimits(-90., 90.); */
h_map->SetAxisRange(-180., 180., "X");
h_map->SetAxisRange(-90., 90., "Y");
h_map->GetXaxis()->SetTitle("longitude (^{o})");
h_map->GetYaxis()->SetTitle("lattitude (^{o})");

// fit zeta //FIXME -- you may phi when ready
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
// plots/ dir
gSystem->MakeDirectory("plots");
savename.Prepend("plots/");
// canvases
c_phi->Print(savename+"_phi.png");
c_zeta->Print(savename+"_zeta.png");
c_dt->Print(savename+"_dt.png");
c_cp->Print(savename+"_cp.png");
c_map->Print(savename+"_map.png");
c_all->Print(savename+"_all.png");
c_phi->Write("c_phi");
c_zeta->Write("c_zeta");
c_dt->Write("c_dt");
c_cp->Write("c_cp");
c_map->Write("c_map");
c_all->Write("c_all");
c_phi->Close();
c_zeta->Close();
c_dt->Close();
c_cp->Close();
c_map->Close();
c_all->Close();
/* plotList->Write();//"plotList"); */
// file &c.
phiFR->Write("phiFR");
// final
fnc->Write();
fnc->Close();

// run angres.cxx if available
Int_t kangres = gROOT->LoadMacro("angres.cxx");
if (kangres == 0) { // reminder: 0 = success for LoadMacro
  angres(outFileName.Data());
}

// reset graphics settings if applicable
if (! origOGL) gStyle->SetCanvasPreferGL(kFALSE);
if (! origBatch) gROOT->SetBatch(kFALSE);

// all pau!   )
}
