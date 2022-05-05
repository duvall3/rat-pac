// angres -- EWISotT
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 05/2022 ~ //

/* void angres() { */
{

// init
TTree *T_r = (TTree*)gDirectory->Get("T_r");
Long64_t N = T_r->GetEntries();
/* Double_t l, lx, ly, lz, dp; */
Double_t l, dp;
TVector3 mu;
/* Double_t P = 150.; // Double CHOOZ */
/* Double_t P = 25.; // NuLat and 3D-Chkbd. */
/* Double_t P = (1./3.) * (2.5 + 50. + (1./2.)*(25.+30.)); // SANTA */
/* Double_t P = (1./3.) * (2.5 + 2.5 + 25.); // SANDD, 2D-Chkbd. */
Double_t P = 150.; // PROSPECT
TCanvas *c_angres = new TCanvas("c_angres", "c_angres");

// main

// get means
/* T_r->Draw("r.fX>>hx", "abs(r.fX)<500."); // DC ONLY */
/* T_r->Draw("r.fY>>hy", "abs(r.fY)<500."); // DC ONLY */
/* T_r->Draw("r.fZ>>hz", "abs(r.fZ)<500."); // DC ONLY */
T_r->Draw("r.fX>>hx");
T_r->Draw("r.fY>>hy");
T_r->Draw("r.fZ>>hz");
c_angres->Close();
mu.SetX(hx->GetMean()};
mu.SetY(hy->GetMean()};
mu.SetZ(hz->GetMean()};

// calculate angular resolution via (Delta phi)_{1#sigma} = #arctan( (P/l) / #sqrt{N} )
/* l = sqrt( lx**2 + ly**2 + lz**2 ); */
l = mu.Mag();
dp = TMath::ATan( (P/l) / sqrt(N) ) * TMath::RadToDeg();
/* printf( "\nFilename = %s\nN = %d\nDeltaPhi = %3.2f deg\n\n", gFile->GetName(), N, dp ); */
printf( "\nFilename = %s\nN = %d\nP = %e\nl = %e\nDeltaPhi = %3.4f deg\n\n", gFile->GetName(), N, P, l, dp );

// all pau!   )
}
