// init
TFile *f = TFile::Open(filename);
TTree *T2 = (TTree*)gDirectory->Get("T2");
Double_t phi_recon;
T2->SetBranchAddress("phi_recon", &phi_recon);
Int_t k(0), N(T2->GetEntries());

// radar plot
TH2D *h_radar = new TH2D("h_radar", "h_radar", 36, -180.01, 180.01, 1, 0., 1.01);
for ( k=0; k<N; k++ ) {
  T2->GetEntry(k);
  h_radar->Fill( phi_recon, 1. );
}
TCanvas *can_radar = new TCanvas("can_radar", "can_radar");
h_radar->Draw("cyllego2");

// adjust view
 TView *view = gPad->GetView();
 view->Top();
// view->Draw();

