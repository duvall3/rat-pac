// angularRecon.cxx -- function (temporarily macro) for calculating and displaying results of IBD angular reconstruction
// -- operates on results of SEDAQ.cxx from github-->duvall3-->rat-pac-->collab-->user-->root_macros
// -- USAGE: root <DATARUN_results.root> --> .L angularRecon.cxx --> angularRecon(T2);
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 12/2019 ~ //

void angularRecon( const TTree* T ) {

// init
Int_t N = T2->GetEntries();
Double_t phi_mean, phi_rms, phi_unc;
Double_t theta_mean, theta_rms, theta_unc;
TH1F *h_phi, *h_theta;
TCanvas* c4 = new TCanvas("c4", "IBD Angular Reconstruction", 70, 60, 1500, 800);
c4->Divide(1,2);

// phi = azimuthal angle
c4->cd(1);
T->Draw("phi_recon");
h_phi = htemp;
h_phi->SetName("h_phi");
h_phi->SetTitle("Azimuthal Angle (deg)");
h_phi->GetXaxis()->SetLimits(-90, 90);
h_phi->Draw();
phi_mean = h_phi->GetMean();
phi_rms = h_phi->GetRMS();
phi_unc = phi_rms / sqrt(N);

// theta = polar angle
c4->cd(2);
T->Draw("theta_recon");
h_theta = (TH1F*)c4_2->FindObject("htemp");
h_theta->SetName("h_theta");
h_theta->SetTitle("Polar Angle (deg)");
h_theta->GetXaxis()->SetLimits(-90, 90);
h_theta->Draw();
theta_mean = h_theta->GetMean();
theta_rms = h_theta->GetRMS();
theta_unc = theta_rms / sqrt(N);

// report results
Double_t phi_true(0), theta_true(0); // assume true neutrino direction is at phi = 0 deg, theta = 0 deg
printf( "\n\nIBD Angular Reconstruction Results,\n  uncertainty = RMS / sqrt(N) :\n\n" );
printf( "Azimuthal Angle (deg):\n  phi_mean\t\t%2.2f\n  phi_rms\t\t%2.2f\n  phi_unc\t\t%2.2f\n\n", phi_mean, phi_rms, phi_unc );
printf( "Polar Angle (deg):\n  theta_mean\t%2.2f\n  theta_rms\t%2.2f\n  theta_unc\t%2.2f\n\n", theta_mean, theta_rms, theta_unc );
printf( "SUMMARY (N = %d):\n", N );
printf( "  phi   = %2.2f +/- %2.2f deg\t(%2.2f sigma)\n", phi_mean, phi_unc, (phi_mean-phi_true)/phi_unc );
printf( "  theta = %2.2f +/- %2.2f deg\t(%2.2f sigma)\n\n\n", theta_mean, theta_unc, (theta_mean-theta_true)/theta_unc);

// all pau!   )
}
