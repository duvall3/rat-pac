// tradRes -- EWISotT
// ~ Mark J. Duvall ~ duvall3@github.com ~ 01/2023 ~ //

void tradRes() {

// init
TList *l = TDuvallUtils::ListFiles(".*_ncap_res\.root$");
TIter i(l);
TFile *f = TFile::Open("tradRes.root", "recreate");
TFile *ff;
TSystemFile *sf;
TVectorD *phiTrueV;
TFitResult *phiFR;

// prepare tree
Double_t phi, phiTrue, phiDiff;
TTree *T = new TTree("T", "trad-style angular determination");
T->Branch("phi", &phi);
T->Branch("phiTrue", &phiTrue);
T->Branch("phiDiff", &phiDiff);

// main
for ( i=l->begin(); i!=l->end(); ++i ) {
  sf = (TSystemFile*)*i;
  ff = TFile::Open(sf->GetName());
  phiFR = (TFitResult*)gDirectory->Get("phiFR");
  phi = phiFR->GetParams()[2];
  phiTrueV = (TVectorD*)gDirectory->Get("phiTrue");
  phiTrue = phiTrueV(0);
  phiDiff = phi - phiTrue;
  T->Fill();
  ff->Close();
  /* printf("%s\t%f\t%f\t%f\n", ff->GetName(), phiTrue, phi, phiDiff); //debug */
}

// init for plot(s)
TCanvas *c = new TCanvas("c", "Difference Distribution, Trad");
c->Divide(1,2);
TVirtualPad *p1 = c->GetPad(1), *p2 = c->GetPad(2);
p1->SetGrid(1,1);
p2->SetGrid(1,1);
Double_t diffLower(T->GetMinimum("phiDiff")), diffUpper(T->GetMaximum("phiDiff"));
/* Double_t diffLimit = TMath::Max( TMath::Abs(diffLower), TMath::Abs(diffUpper) ); */
Double_t diffLimit = 20.; //TEMP (or maybe keep?)

// scatter plot
p1->cd();
Long64_t N = T->GetEntries();
// main plot
T->Draw("phiTrue:phiDiff", "", "gOff");
TGraph *g = new TGraph(N, T->GetV2(), T->GetV1());
TAxis *gx = g->GetXaxis(), *gy = g->GetYaxis();
g->Draw("AP");
g->SetTitle("Best-Match Differences from True Value (Trad)");
gx->SetTitle("#varphi_{Best} - #varphi_{True} (^{o})");
gx->SetTitleOffset(1.15);
gx->SetLimits(-diffLimit, diffLimit);
gy->SetTitle("#varphi_{True} (^{o})");
gy->SetRangeUser(T->GetMinimum("phiTrue"), T->GetMaximum("phiTrue"));
g->SetMarkerStyle(kFullSquare);
g->SetMarkerColor(kBlue);
g->SetMarkerSize(1.5);
g->SetFillColor(0);
// reinforce zero-difference line
T->Draw("phiTrue:0", "", "gOff");
TGraph *gBaseLine = new TGraph(N, T->GetV2(), T->GetV1());
gBaseLine->SetLineWidth(3.);
gBaseLine->SetLineColor(kBlack);
gBaseLine->Draw("same");

// distribution
p2->cd();
/* TH1D *h = new TH1D("h", "Difference Distribution", 10, diffLower, diffUpper); */
TH1D *h = new TH1D("h", "Difference Distribution (Trad)", 10, -diffLimit, diffLimit);
T->Draw("phiDiff>>h");
h->SetXTitle("#varphi_{Best} - #varphi_{True} (^{o})");
h->SetLineColor(kBlue);
h->SetLineWidth(2);

// fit
Double_t normGuess(10.), meanGuess(0.), sigmaGuess(5.);
/* TF1 *fg = new TF1("fg", "[0]*TMath::Gaus(x,[1],[2])", diffLower, diffUpper); */
TF1 *fg = new TF1("fg", "[0]*TMath::Gaus(x,[1],[2])", -diffLimit, diffLimit);
fg->SetParNames("Constant", "Mean", "Sigma");
fg->SetParameters(normGuess, meanGuess, sigmaGuess);
fg->SetLineColor(kRed);
/* TFitResultPtr hFRP = h->Fit(fg, "SR"); */
TFitResultPtr hFRP = h->Fit(fg, "S");
TFitResult *hFR = hFRP.Get();

// save
gROOT->SetBatch(kTRUE);
c->Print("tradRes.png");
gROOT->SetBatch(kFALSE);
f->cd();
T->Write("T");
c->Write("c");
h->Write("h");
fg->Write("fg");
hFR->Write("hFR");
f->Close();

// all pau!   )
return;
}
