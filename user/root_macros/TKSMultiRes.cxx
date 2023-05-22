// TKSMultiRes -- basic template for writing ROOT classes

#include "TKSMultiRes.h"

// Call the ClassImp() macro to give the TKSMultiRes class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TKSMultiRes);
#endif

//______________________________________________________________________________
// default ctor
TKSMultiRes::TKSMultiRes()
{
  // define here
  fFileList = new TObjArray;
  kRibbon = kFALSE;
  fOutFileName = "KS_Multi.root";
}

////______________________________________________________________________________
//// normal ctor
///**
// * \param someArg1 -- e.g., a filename
// * \param someArg2 -- e.g., a track ID
// */
//TKSMultiRes::TKSMultiRes( const char* someArg1, Double_t someArg2 )
//{
//  // define here
//  fSomeData = 0.;
//}

//______________________________________________________________________________
// FillFileList
void TKSMultiRes::FillFileList()
{
  // init
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
	fFileList->Add( new TObjString( filePath.Data() ) );
      }
    }
  }
  return;
}

//______________________________________________________________________________
// Init
void TKSMultiRes::Init()
{
  // define here
  FillFileList();
  fOutFile = TFile::Open(fOutFileName.Data(), "recreate");
  return;
}

//______________________________________________________________________________
// Histos
void TKSMultiRes::Histos()
{
  // graphics init
  gStyle->SetOptFit(kTRUE);
  // get number of input files
  Int_t nFiles = fFileList->GetEntries();
  // guesses for fitter // alternative: use TF1::SetParLimits with fit option "B"(ounds)
  Double_t
    constantGuess = 1.e1, \
    meanGuess = 0., \
    sigmaGuess = 1.e1 \
    ;
  // init
  Double_t diffLimit = 20.;
  Int_t k(0);
  TFile *ff;
  TH1D *hh;
  fHistoSum = new TH1D("h_ksm", "Combined KS Difference Distributions", 10, -diffLimit, diffLimit);
  fHistoSum->SetLineWidth(3);
  fHistoSum->SetLineColor(kMagenta);
  fHistoSum->GetXaxis()->SetTitle("#varphi_{Best} - #varphi_{True} (^{o})");
  // add histos from files
  TIter i(fFileList);
  TObjString *filename;
  for ( i=fFileList->begin(); i!=fFileList->end(); ++i ) {
    filename = (TObjString*)*i;
    ff = TFile::Open( filename->GetString().Data() );
    hh = (TH1D*)gDirectory->Get("hDiffs");
    fHistoSum->Add(hh);
    ff->Close();
  }
  fOutFile->cd();
  // plot and fit
  fHistoCanvas = new TCanvas("c", "KS_Multi");
  fHistoSum->Draw();
  fHistoSumFit = new TF1("Summed Histogram", "[0]*TMath::Gaus(x,[1],[2])", -diffLimit, diffLimit);
  fHistoSumFit->SetLineColor(kGreen);
  fHistoSumFit->SetParNames("Constant", "Mean", "Sigma");
  fHistoSumFit->SetParameters(constantGuess, meanGuess, sigmaGuess);
  TFitResultPtr hFRP = fHistoSum->Fit(fHistoSumFit, "SR");
  fHistoSumFitResult = hFRP.Get();
  // tweak graph
  fHistoCanvas->SetGrid(1,1);
  Double_t h_max = fHistoSum->GetMaximum(), hf_max = fHistoSumFit->GetMaximum();
  fHistoSum->GetYaxis()->SetRangeUser( 0, 1.2*TMath::Max(h_max,hf_max) );
  //   all pau!   )
  return;
}

//______________________________________________________________________________
// Ribbons
void TKSMultiRes::Ribbons()
{

  return;
}

//______________________________________________________________________________
// Save
void TKSMultiRes::Save()
{
  // save
  Bool_t kBatchOrig = gROOT->IsBatch();
  gROOT->SetBatch(kTRUE);
  TString outImageName(fOutFileName);
  outImageName.ReplaceAll("\.root$", ".png");
  fHistoCanvas->Print(outImageName.Data());
  fOutFile->cd();
  fHistoCanvas->Write();
  fHistoSum->Write();
  fHistoSumFit->Write();
  /* fHistoSumFitResult->Write("fHistoSumFitResult"); //FIXME segfault */
  fOutFile->Write();
  /* fOutFile->Close(); */
  gROOT->SetBatch(kBatchOrig);
  return;
}

//______________________________________________________________________________
// Run()
void TKSMultiRes::Run()
{
  Init();
  Histos();
  if (kRibbon) Ribbons();
  Save();
  return;
}

////______________________________________________________________________________
//TKSMultiRes::
//{
//}

////______________________________________________________________________________
//TKSMultiRes::
//{
//}


