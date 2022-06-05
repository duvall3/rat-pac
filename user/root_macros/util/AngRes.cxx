// AngRes.cxx -- QDV of finding statistical angular resolution based on data-subset means

void AngRes(const char* filename, Long64_t grp = 100) {

// init
gStyle->SetOptFit(kTRUE);
TFile *f = TFile::Open(filename);
/* Long64_t grp = 100; //DEFAULT */
Long64_t k = 0, N = T2->GetEntries();
Long64_t k_max = (Long64_t)TMath::Floor(N/grp);
TCanvas *c_ar = new TCanvas("c_ar", "AngRes Canvas");
// T2
/* Double_t xp, xd, yp, yd, zp, zd; */
/* T2->SetBranchAddress("prompt_cand_x", &xp); */
/* T2->SetBranchAddress("prompt_cand_y", &yp); */
/* T2->SetBranchAddress("prompt_cand_z", &zp); */
/* T2->SetBranchAddress("delayed_cand_x", &xd); */
/* T2->SetBranchAddress("delayed_cand_y", &yd); */
/* T2->SetBranchAddress("delayed_cand_z", &zd); */
/* // T_sub */
TTree *T_sub = new TTree("T_sub", "Reconstructed-angle means from data subsets");
TVector3 r;
T_sub->Branch("r", &r); // prompt-delayed displacement

/* // hist init */
/* TH1D *h_phi_sub = new TH1D("h_phi_sub", "Subset <#phi> Distribution", 100, -180., 180.); */

// main
for ( k = 0; k < k_max; k++ ) {
  T2->Draw("delayed_cand_x - prompt_cand_x >> hx", "", "", grp, grp*k);
  T2->Draw("delayed_cand_y - prompt_cand_y >> hy", "", "", grp, grp*k);
  T2->Draw("delayed_cand_z - prompt_cand_z >> hz", "", "", grp, grp*k);
  r.SetX(hx->GetMean());
  r.SetY(hy->GetMean());
  r.SetZ(hz->GetMean());
  r = -r.Unit();
  T_sub->Fill();
}

// results
printf("Experiment = %s\n", experiment->GetString().Data());
printf("N = %d\n", T2->GetEntries());
T_sub->Draw("r.Phi()*TMath::RadToDeg() >> h_phi_subset");
h_phi_subset->Fit("gaus");

// format and save
// tidy up graph
Double_t phiRange = 90.;
h_phi_subset->SetAxisRange( -phiRange, phiRange, "X" );
// save
TString savename;
/* savename.Form("%s_AngRes.eps", experiment->GetString().Data()); */
savename.Form("%s_AngRes.root", experiment->GetString().Data());
savename.ReplaceAll("\"", "");
/* c_ar->Print(savename.Data()); */
c_ar->Write();
c_ar->Close();
T_sub->Write();

// cleanup
delete T_sub;
delete c_ar;

// all pau!   )
f->Close();
}
