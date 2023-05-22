// KSMultiRes -- combine diff. distribs from multiple KSSummaries
// -- TObjArray* fileList should be a list of filenames (relative path is OK)
// -- The input list can be created as follows:
//      TObjArray *fileList = new TObjArray;
//      fileList->Add( new TObjString("Experiment0/KSSummary.root") );
//      fileList->Add( new TObjString("Experiment1/KSSummary.root") );
//      fileList->Add( new TObjString("Experiment2/KSSummary.root") );
//      // etc.
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 01/2023 ~ //

TH1D* KSMultiRes( TObjArray* fileList ) {

  // graphics init
  Bool_t kBatchOrig = gROOT->IsBatch();
  gROOT->SetBatch(kTRUE);
  gStyle->SetOptFit(kTRUE);

  // get number of input files
  Int_t nFiles = fileList->GetEntries();

  // guesses for fitter // alternative: use TF1::SetParLimits with fit option "B"(ounds)
  Double_t
    constantGuess = 1.e1, \
    meanGuess = 0., \
    sigmaGuess = 1.e1 \
    ;

  // outfile
  /* TFile *f = TFile::Open("KS_Multi.root", "create"); */
  TFile *f = TFile::Open("KS_Multi.root", "recreate"); //debug

  // init
  Double_t diffLimit = 20.;
  Int_t k(0);
  TFile *ff;
  TH1D *hh;
  TH1D *h = new TH1D("h_ksm", "Combined KS Difference Distributions", 10, -diffLimit, diffLimit);
  h->SetLineWidth(3);
  h->SetLineColor(kMagenta);
  h->GetXaxis()->SetTitle("#varphi_{Best} - #varphi_{True} (^{o})");

  // add histos from files
  TIter i(fileList);
  TObjString *filename;
  for ( i=fileList->begin(); i!=fileList->end(); ++i ) {
    filename = (TObjString*)*i;
    ff = TFile::Open( filename->GetString().Data() );
    hh = (TH1D*)gDirectory->Get("hDiffs");
    h->Add(hh);
    ff->Close();
  }
  f->cd();

  // plot and fit
  TCanvas *c = new TCanvas("c", "KS_Multi");
  h->Draw();
  TF1 *fh = new TF1("hf", "[0]*TMath::Gaus(x,[1],[2])", -diffLimit, diffLimit);
  fh->SetLineColor(kGreen);
  fh->SetParNames("Constant", "Mean", "Sigma");
  fh->SetParameters(constantGuess, meanGuess, sigmaGuess);
  TFitResultPtr hFRP = h->Fit(fh, "SR");
  TFitResult *hFR = hFRP.Get();

  // tweak graph
  c->SetGrid(1,1);
  Double_t h_max = h->GetMaximum(), hf_max = hf->GetMaximum();
  h->GetYaxis()->SetRangeUser( 0, 1.2*TMath::Max(h_max,hf_max) );

  // save
  gROOT->SetBatch(kTRUE);
  c->Print("KS_Multi.png");
  c->Write();
  h->Write();
  fh->Write();
  hFR->Write("hFR");
  f->Write();
  f->Close();

  //   all pau!   )
  gROOT->SetBatch(kBatchOrig);
  return h;

}


// overload to generate file list automagically;
//   this will add all files that are:
//   1) named "KSSummary.root"
//   2) in an immediate subdirectory of the current directory
TH1D* KSMultiRes() {

  // init
  TObjArray *fileList = new TObjArray;
  TString filePath;
  TSystemFile *sf = new TSystemFile, *file = new TSystemFile;
  TSystemDirectory *dir = new TSystemDirectory, *subdir = new TSystemDirectory;
  dir->SetDirectory( gSystem->WorkingDirectory() );
  TList *l = dir->GetListOfFiles();
  TIter i(l);

  // loop over subdirectories
  for ( i=l->begin(); i!=l->end(); ++i ) {
    sf = (TSystemFile*)*i;
    if (sf->IsDirectory()) {
      subdir = (TSystemDirectory*)sf;
      file = (TSystemFile*)subdir->GetListOfFiles()->FindObject("KSSummary.root");
      if (file) {
	filePath.Form("%s/%s", sf->GetName(), file->GetName() );
	fileList->Add( new TObjString( filePath.Data() ) );
      }
    }
  }

  // finally, call the original function
  TH1D *h = KSMultiRes( fileList );

  // all pau!   )
  return h;

}
