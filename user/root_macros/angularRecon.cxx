// angularRecon.cxx -- function (temporarily macro) for calculating and displaying results of IBD angular reconstruction
// -- operates on results of SEDAQ.cxx from github-->duvall3-->rat-pac-->collab-->user-->root_macros
// -- USAGE: root <DATARUN_results.root> --> .L angularRecon.cxx --> angularRecon(T2);
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 12/2019 ~ //
// ~ Version 0.9.0 ~ Updated 5/21 ~ //
//
// NOTE: The angular summary can be printed from the saved output file
//   by running "angular_summary->GetString();" at the ROOT/CINT prompt


//Copyright (C) 2021 Mark J. Duvall
//
//    This program is free software: you can redistribute it and/or modify
//    it under the testd of the GNU General Public License as published by
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


void angularRecon( const char* filename, bool graphics_tf = kFALSE ) {


// init
TString fileName = filename;
TString basename = fileName(0,fileName.Index(".root"));
TFile* f = TFile::Open(filename, "update");
TTree* T = T2;
TTree* T_map = T_map;
Long64_t k(0), N = T2->GetEntries();
Double_t cos_psi;
Double_t phi, phi_mean, phi_std, phi_sdm;
Double_t theta, theta_mean, theta_std, theta_sdm;
Double_t lattd, longtd;
T2->SetBranchAddress("phi_recon", &phi);
T2->SetBranchAddress("theta_recon", &theta);
T2->SetBranchAddress("cos_psi", &cos_psi);
T_map->SetBranchAddress("lattd", &lattd);
T_map->SetBranchAddress("longtd", &longtd);
TH1D *h_phi, *h_theta, *h_cos_psi;
TH2D *h_map;
gStyle->SetHistLineWidth(3);
gStyle->SetHistLineColor(kBlue);
Double_t pi = TMath::Pi();

cout << endl;

// check for presence of IBD candidates
if ( N == 0 ) {
  cout << endl << "No IBD candidate events found in "<< filename << ". Exiting..." << endl;
  cerr << endl << "No IBD candidate events found in "<< filename << ". Exiting..." << endl;
  return;
}

// create canvases
TCanvas* c4 = new TCanvas("c4", "IBD Angular Reconstruction", 820, 120, 1000, 1000);
c4->Divide(1,2);
TCanvas* c5 = new TCanvas("c5", "Actual vs. Reconstructed Angle (#psi)", 820, 120, 1100, 900);
TCanvas* c6 = new TCanvas("c6", "Sky Heatmap Pointing to Antineutrino Source", 820, 120, 1100, 900);


// set up histograms
TH1D* h_phi = new TH1D("h_phi", "Azimuthal Angle (deg) #minus #phi^{o}", 36, -180, 180);
TH1D* h_theta = new TH1D("h_theta", "Polar Angle (deg) #minus #theta^{o}", 36, 0, 360);
TH1D* h_cos_psi = new TH1D("h_cos_psi", "Cos(#psi)", 10, -1, 1);
//TH2D* h_map = new TH2D("h_map", "Skymap Pointing to Reconstructed #bar{#nu_{e}} Source", 36, -180., 180., 18, -90., 90.);
//TH2D* h_map = new TH2D("h_map", "Skymap Pointing to Reconstructed #bar{#nu_{e}} Source", 18, -90., 90., 36, -180., 180.);


// fill histograms
for ( k = 0; k < N; k++ ) {
  T2->GetEntry(k);
  h_phi->Fill(phi);
  h_theta->Fill(theta);
  h_cos_psi->Fill(cos_psi);
  T_map->GetEntry(k);
//h_map->Fill(lattd, longtd);
//h_map->Fill(longtd, lattd);
}


// draw histograms

// phi = azimuthal angle
c4->cd(1);
//h_phi->Draw("cyl lego");
h_phi->Draw();
gPad->SetLogy(kFALSE);
h_phi->GetYaxis()->SetRangeUser(0., 1.2 * h_phi->GetMaximum());
phi_mean = h_phi->GetMean();
phi_std = h_phi->GetStdDev();
phi_sdm = phi_std / sqrt(N);

// theta = polar angle
c4->cd(2);
//h_theta->Draw("cyl lego");
h_theta->Draw();
gPad->SetLogy(kFALSE);
h_theta->GetYaxis()->SetRangeUser(0., 1.2 * h_theta->GetMaximum());
theta_mean = h_theta->GetMean();
theta_std = h_theta->GetStdDev();
theta_sdm = theta_std / sqrt(N);

// psi = angle between actual and reconstr. neutrino momenta
c5->cd();
h_cos_psi->Draw();
gPad->SetLogy(kFALSE);
h_cos_psi->GetYaxis()->SetRangeUser(0., 1.2 * h_cos_psi->GetMaximum());

// skymap
c6->cd();
gPad->SetLogy(kFALSE);
T_map->Draw("lattd:longtd", "", "aitoff");
h_map = (TH2D*)htemp;
h_map->SetName("h_map");
h_map->SetTitle("Skymap Pointing to Reconstructed #bar{#nu_{e}} Source");
//h_map->Draw("aitoff");
h_map->GetXaxis()->SetTitle("longitude (^{o})");
h_map->GetYaxis()->SetTitle("latitude (^{o})");
h_map->GetXaxis()->SetTitleFont(62);
h_map->GetYaxis()->SetTitleFont(62);
h_map->GetXaxis()->SetLimits(-180., 180.);
h_map->GetYaxis()->SetLimits(-90., 90.);
c6->Draw();

// calculate IBD efficiency
TObjString* nIBDs_tos = (TObjString*)T2->GetUserInfo()->At(0);
Long64_t nIBDs = nIBDs_tos->GetString().Atoll();
Double_t eff = (Double_t)N/nIBDs;

// set / report antineutrino direction
Double_t phi_true, theta_true;
cout << endl << "Using default antineutrino direction." << endl;
cerr << "Using default antineutrino direction." << endl;
TVector3 neutrino_direction, nu_hat;
cout << "neutrino_direction: "; neutrino_direction = TVector3(-1,0,0);
nu_hat = neutrino_direction.Unit();
nu_hat.Print();
phi_true = (-nu_hat).Phi() * 180/pi;
theta_true = (-nu_hat).Theta() * 180/pi;

// report results and save summary
TString ts1, ts2, ts3, ts4, ts5, ts6, ts7, ts8, ts_summary;
ts1 = TString::Format( "\n\nIBD Angular Reconstruction:\n* datafile = \"%s\"\n* Note: SDM = SD/sqrt(N)\n\n", fileName.Data() );
ts2 = TString::Format( "Azimuthal Angle (deg):\n  phi_mean\t%2.2f\n  phi_sd\t%2.2f\n  phi_sdm\t%2.2f\n\n", phi_mean, phi_std, phi_sdm );
ts3 = TString::Format( "Polar Angle (deg):\n  theta_mean\t%2.2f\n  theta_sd\t%2.2f\n  theta_sdm\t%2.2f\n\n", theta_mean, theta_std, theta_sdm );
ts4 = TString::Format( "SUMMARY:\n  Total IBDs: %d\n  N = %d\n  IBD Efficiency = %2.2f%%\n", nIBDs, N, eff*100 );
ts5 = TString::Format( "  phi   = %2.2f   +/- %2.2f deg (SD)\t%2.2f sigma from true value,  or\n", phi_mean, phi_std, TMath::Abs((phi_mean-phi_true))/phi_std );
ts6 = TString::Format( "                 +/-  %2.2f deg (SDM)\t%2.2f sigma from true value\n", phi_sdm, TMath::Abs((phi_mean-phi_true))/phi_sdm );
ts7 = TString::Format( "  theta = %2.2f   +/- %2.2f deg (SD)\t%2.2f sigma from true value,  or\n", theta_mean, theta_std, TMath::Abs((theta_mean-theta_true))/theta_std );
ts8 = TString::Format( "                 +/-  %2.2f deg (SDM)\t%2.2f sigma from true value\n\n", theta_sdm, TMath::Abs((theta_mean-theta_true))/theta_sdm );
ts_summary = ts1+ts2+ts3+ts4+ts5+ts6+ts7+ts8;
printf("\n%s", ts_summary.Data());
TObjString angular_summary = ts_summary;
angular_summary.Write("angular_summary");

// save plots
if ( graphics_tf ) {
  c4->Write();
  c5->Write();
  c6->Write();
  h_phi->Write();
  h_theta->Write();
  h_cos_psi->Write();
  h_map->Write();
  c4->SaveAs(basename+"-ang-separate.png");
  c5->SaveAs(basename+"-ang.png");
  c6->SaveAs(basename+"-skymap.png");
}

// tidy up
c4->Close();
c5->Close();
c6->Close();
printf( "\n\n" );

// all pau!   )
f->Close();
}
