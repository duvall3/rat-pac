<<<<<<< HEAD
// TKSMultiRes -- Class for combining reference-comparison results from multiple runs
=======
// TKSMultiRes -- basic template for writing ROOT classes
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a

#include "TKSMultiRes.h"

// Call the ClassImp() macro to give the TKSMultiRes class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TKSMultiRes);
#endif

//______________________________________________________________________________
// default ctor
TKSMultiRes::TKSMultiRes()
{
<<<<<<< HEAD
  // set name and title
  SetName("TKSMultiRes");
  SetTitle("class for combining angular-resolution results from multiple reference-matching test runs");
  // required init
  fFileList = new TObjArray;
  fRibbons = 0x0; // force null ptr until TKSMultiRibbons::Init()
  /* fkRibbon = kFALSE; */
  fkRibbon = kTRUE;
=======
  // define here
  fFileList = new TObjArray;
  kRibbon = kFALSE;
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
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
<<<<<<< HEAD
  /* cout << fRibbons << endl; //debug */
  FillFileList();
=======
  FillFileList();
  fOutFile = TFile::Open(fOutFileName.Data(), "recreate");
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
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
<<<<<<< HEAD
  /* fOutFile->cd(); */
=======
  fOutFile->cd();
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
  // plot and fit
  fHistoCanvas = new TCanvas("c", "KS_Multi");
  fHistoSum->Draw();
  fHistoSumFit = new TF1("Summed Histogram", "[0]*TMath::Gaus(x,[1],[2])", -diffLimit, diffLimit);
  fHistoSumFit->SetLineColor(kGreen);
  fHistoSumFit->SetParNames("Constant", "Mean", "Sigma");
  fHistoSumFit->SetParameters(constantGuess, meanGuess, sigmaGuess);
<<<<<<< HEAD
  fHistoSumFitResultPtr = fHistoSum->Fit(fHistoSumFit, "SR");
  fHistoSumFitResult = fHistoSumFitResultPtr.Get();
=======
  TFitResultPtr hFRP = fHistoSum->Fit(fHistoSumFit, "SR");
  fHistoSumFitResult = hFRP.Get();
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
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
<<<<<<< HEAD
  // init
  fRibbons = new TKSMultiRibbons;
  fRibbons->SetOutFile(GetOutFile());
  fRibbons->SetOutFileName(GetOutFileName().Data());
  fRibbons->Run();
=======

>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
  return;
}

//______________________________________________________________________________
// Save
<<<<<<< HEAD
/**
 * Calling Save() will :
 *
 * 1) Export the current view of all existing canvases, in `.png` format; and
 *
 * 2) Write the following objects to the output file:
 *
 * - The histogram canvas, as `TCanvas* c_histo`
 * - The histogram itself, as `TH1D* histo`
 * - The fitted Gaussian function, as `TF1* gaussFit`
 * - The fit result, as `TFitResult* fitResult`
 */
=======
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
void TKSMultiRes::Save()
{
  // save
  Bool_t kBatchOrig = gROOT->IsBatch();
  gROOT->SetBatch(kTRUE);
<<<<<<< HEAD
  fOutFile = TFile::Open(fOutFileName.Data(), "recreate");
  TString outImageName(fOutFileName);
  outImageName.ReplaceAll("\.root", ".png");
  fHistoCanvas->Print(outImageName.Data());
  fOutFile->cd();
  fHistoCanvas->Write("c_histo");
  fHistoCanvas->Close();
  fHistoSum->Write("histo");
  fHistoSumFit->Write("gausFit");
  GetHistoSumFitResult()->Write("fitResult");
  if (fRibbons) {
    fRibbons->Write("ribbons");
    fRibbons->Save();
  }
  fOutFile->Write();
  fOutFile->Close();
=======
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
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
  gROOT->SetBatch(kBatchOrig);
  return;
}

//______________________________________________________________________________
// Run()
void TKSMultiRes::Run()
{
  Init();
<<<<<<< HEAD
  cout << "Plotting summed histogram..." << endl; //debug
  Histos();
  cout << endl;
  if (fkRibbon) Ribbons();
  /* Save(); */
=======
  Histos();
  if (kRibbon) Ribbons();
  Save();
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
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


