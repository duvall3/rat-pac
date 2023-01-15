// TradMultiRes -- combine diff. distribs from multiple trad-style (non-KS) azimuth reconstructions
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 01/2023 ~ //

{

  // current list
  TObjArray *fileList = new TObjArray;
  fileList->Add( new TObjString("AllAngles_res/ORIG/tradRes.root") );
  fileList->Add( new TObjString("AllAngles2/tradRes.root") );
  fileList->Add( new TObjString("AllAngles3_res/tradRes.root") );
  Int_t nFiles = fileList->GetEntries();

  // guesses for fitter // alternative: use TF1::SetParLimits with fit option "B"(ounds)
  Double_t
    constantGuess = 1.e1, \
    meanGuess = 0., \
    sigmaGuess = 1.e1 \
    ;

  // outfile
  /* TFile *f = TFile::Open("Trad_Multi.root", "create"); */
  TFile *f = TFile::Open("Trad_Multi.root", "recreate"); //debug

  // init
  Double_t diffLimit = 20.;
  Int_t k(0);
  TFile *ff;
  TH1D *hh;
  TH1D *h = new TH1D("h_ksm", "Combined Trad Difference Distributions", 10, -diffLimit, diffLimit);
  h->SetLineWidth(3);
  h->SetLineColor(kBlue);
  h->GetXaxis()->SetTitle("#varphi_{Best} - #varphi_{True} (^{o})");

  // add histos from files
  TIter i(fileList);
  TObjString *filename;
  for ( i=fileList->begin(); i!=fileList->end(); ++i ) {
    filename = (TObjString*)*i;
    ff = TFile::Open( filename->GetString().Data() );
    hh = (TH1D*)gDirectory->Get("h");
    h->Add(hh);
    ff->Close();
  }
  f->cd();

  // plot and fit
  TCanvas *c = new TCanvas("c", "Trad_Multi");
  h->Draw();
  TF1 *fh = new TF1("hf", "[0]*TMath::Gaus(x,[1],[2])", -diffLimit, diffLimit);
  fh->SetLineColor(kRed);
  fh->SetParNames("Constant", "Mean", "Sigma");
  fh->SetParameters(constantGuess, meanGuess, sigmaGuess);
  TFitResultPtr hFRP = h->Fit(fh, "SR");
  TFitResult *hFR = hFRP.Get();

  // save
  /* gROOT->SetBatch(kTRUE); */
  /* c->Print("Trad_Multi.png"); */
  c->Write();
  h->Write();
  fh->Write();
  hFR->Write();
  f->Write();
  /* f->Close(); */

  //   all pau!   )

}
