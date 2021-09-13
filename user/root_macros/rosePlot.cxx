// init
TFile *f = TFile::Open(filename);
TTree *T2 = (TTree*)gDirectory->Get("T2");
Double_t phi_recon;
T2->SetBranchAddress("phi_recon", &phi_recon);
Int_t k(0), N(T2->GetEntries());

// rose plot
TH2D *h_rose = new TH2D("h_rose", "h_rose", 36, -180.01, 180.01, 1, 0., 1.01);
for ( k=0; k<N; k++ ) {
  T2->GetEntry(k);
  h_rose->Fill( phi_recon, 1. );
}
TCanvas *can_rose = new TCanvas("can_rose", "can_rose");
h_rose->Draw("cyllego2");

// adjust view
 TView *view = gPad->GetView();
 view->Top();
// view->Draw();

