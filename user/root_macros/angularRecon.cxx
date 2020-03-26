// angularRecon.cxx -- function (temporarily macro) for calculating and displaying results of IBD angular reconstruction
// -- operates on results of SEDAQ.cxx from github-->duvall3-->rat-pac-->collab-->user-->root_macros
// -- USAGE: root <DATARUN_results.root> --> .L angularRecon.cxx --> angularRecon(T2);
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 12/2019 ~ //

void angularRecon( const char* filename ) {

// init
TString fileName = filename;
TString basename = fileName(0,fileName.Index(".root"));
TFile* f = TFile::Open(filename, "update");
TTree* T = T2;
TTree* T_map = T_map;
Long64_t N = T2->GetEntries();
Double_t cos_psi;
Double_t phi_mean, phi_rms, phi_unc;
Double_t theta_mean, theta_rms, theta_unc;
TH1F *h_phi, *h_theta, *h_cos_psi;
TH2F *h_map;

// create histograms
TCanvas* c4 = new TCanvas("c4", "IBD Angular Reconstruction", 820, 120, 1000, 1000);
c4->Divide(1,2);
TCanvas* c5 = new TCanvas("c5", "Actual vs. Reconstructed Angle (#psi)", 820, 120, 1100, 900);
TCanvas* c6 = new TCanvas("c6", "Sky Heatmap Pointing to Antineutrino Source", 820, 120, 1100, 900);

// phi = azimuthal angle
c4->cd(1);
gPad->SetLogy(kFALSE);
T->Draw("phi_recon", "", "cyl lego");
h_phi = htemp;
h_phi->SetName("h_phi");
h_phi->SetTitle("Azimuthal Angle (deg) #minus #phi^{o}");
phi_mean = h_phi->GetMean();
phi_rms = h_phi->GetRMS();
phi_unc = phi_rms / sqrt(N);

// theta = polar angle
c4->cd(2);
gPad->SetLogy(kFALSE);
T->Draw("theta_recon");
h_theta = (TH1F*)c4_2->FindObject("htemp");
//TH2F* h_theta = new TH2F;
h_theta->SetName("h_theta");
h_theta->SetTitle("Polar Angle (deg) #minus #theta^{o}");
//h_theta->SetBins(18, 0, 180, 5, 0, 1.2);
h_theta->GetXaxis()->SetLimits(0, 180);
//Double_t theta;
//T2->SetBranchAddress("theta_recon", &theta);
//for ( Int_t ev=0; ev<T2->GetEntries(); ev++ )  { h_theta->Fill(theta, 1); }
//h_theta->Draw("cyl lego2");
h_theta->Draw();
theta_mean = h_theta->GetMean();
theta_rms = h_theta->GetRMS();
theta_unc = theta_rms / sqrt(N);

// psi = angle between actual and reconstr. neutrino momenta
c5->cd();
gPad->SetLogy(kFALSE);
T->Draw("cos_psi");
h_cos_psi = (TH1F*)c5->FindObject("htemp");
h_cos_psi->SetBins(10, -1, 1);
h_cos_psi->SetName("h_cos_psi");
h_cos_psi->SetTitle("Cos(#psi)");
h_cos_psi->GetXaxis()->SetLimits(-1,1);
h_cos_psi->Draw();

// skymap
c6->cd();
gPad->SetLogy(kFALSE);
T_map->Draw("lattd:longtd", "", "aitoff");
h_map = htemp;
h_map->SetName("h_map");
h_map->SetTitle("Skymap Pointing to Reconstructed #bar{#nu_{e}} Source");
h_map->GetXaxis()->SetTitle("longitude (^{o})");
h_map->GetYaxis()->SetTitle("latitude (^{o})");
h_map->GetXaxis()->SetTitleFont(62);
h_map->GetYaxis()->SetTitleFont(62);

// calculate IBD efficiency
TObjString* nIBDs_tos = (TObjString*)T2->GetUserInfo()->At(0);
Long64_t nIBDs = nIBDs_tos->GetString().Atoll();
Double_t eff = (Double_t)N/nIBDs;

// report results
Double_t phi_true(0), theta_true(0); // assume true neutrino direction is at phi = 0 deg, theta = 0 deg
printf( "\n\nIBD Angular Reconstruction:\n* datafile = \"%s\"\n* Note: SDM = SD/sqrt(N)\n\n", fileName.Data() );
printf( "Azimuthal Angle (deg):\n  phi_mean\t%2.2f\n  phi_sd\t%2.2f\n  phi_sdm\t%2.2f\n\n", phi_mean, phi_rms, phi_unc );
printf( "Polar Angle (deg):\n  theta_mean\t%2.2f\n  theta_sd\t%2.2f\n  theta_sdm\t%2.2f\n\n", theta_mean, theta_rms, theta_unc );
printf( "SUMMARY:\n  Total IBDs: %d\n  N = %d\n  IBD Efficiency = %2.2f%%\n", nIBDs, N, eff*100 );
printf( "  phi   = %2.2f   +/- %2.2f deg (SD)\t%2.2f sigma from true value,  or\n", phi_mean, phi_rms, TMath::Abs((phi_mean-phi_true))/phi_rms );
printf( "                 +/-  %2.2f deg (SDM)\t%2.2f sigma from true value\n", phi_mean, phi_unc, TMath::Abs((phi_mean-phi_true))/phi_unc );
printf( "  theta = %2.2f   +/- %2.2f deg (SD)\t%2.2f sigma from true value,  or\n", theta_mean, theta_rms, TMath::Abs((theta_mean-theta_true))/theta_rms );
printf( "                 +/-  %2.2f deg (SDM)\t%2.2f sigma from true value\n\n", theta_mean, theta_unc, TMath::Abs((theta_mean-theta_true))/theta_unc );

// save plots
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
printf( "\n\n" );

// all pau!   )
f->Close();
}
