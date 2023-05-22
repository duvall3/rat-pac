// TKSMultiRibbons -- basic template for writing ROOT classes

#include "TKSMultiRibbons.h"

// Call the ClassImp() macro to give the TKSMultiRibbons class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TKSMultiRibbons);
#endif

//______________________________________________________________________________
// default ctor
TKSMultiRibbons::TKSMultiRibbons()
{
  // define here
  fFileList = new TObjArray;
  fOutFileName = "KS_Multi.root";
}

////______________________________________________________________________________
//// normal ctor
///**
// * \param someArg1 -- e.g., a filename
// * \param someArg2 -- e.g., a track ID
// */
//TKSMultiRibbons::TKSMultiRibbons( const char* someArg1, Double_t someArg2 )
//{
//  // define here
//  fSomeData = 0.;
//}

//______________________________________________________________________________
// FillFileList
void TKSMultiRibbons::FillFileList()
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
void TKSMultiRibbons::Init()
{
  // define here
  if (fFileList->GetEntries()==0) FillFileList();
  if (! fOutFile) fOutFile = TFile::Open(fOutFileName.Data(), "recreate");
  return;
}

//______________________________________________________________________________
// Ribbons
void TKSMultiRibbons::Ribbons()
{
  //init
  Int_t k(0), kFile(0), N = fFileList->GetEntries();
  TIter i(fFileList);
  TMatrixD deltas(30,N);
  TArrayD deltArr(N);
  Double_t delta(0.4);
  Double_t angleLow(-1.), angleHigh(31.);
  Double_t diffLim(20.);
  TF2 *g = new TF2("g", "xygaus(0)", -diffLim, diffLim, angleLow, angleHigh);
  /* TF1 *g = new TF1("g", "gaus(0)", -diffLim, diffLim); */
  TCutG cut0("cut0", 5);
  Double_t A_guess(1.), mu_guess(1.), sigma_guess(5.);
  Double_t A, mu, sigma;
  // retrieve data from files //TODO
  deltas[0][0] = 2.; deltas[0][1] =0.; deltas[0][2] = -3.; deltas[0][3] = 0.5; //debug
  // plot
  fRibbonCanvas = new TCanvas("fRibbonCanvas", "Ribbon Plots");
  fRibbonCanvas->SetGrid(1,1); //move me?
  // loop over angles (matrix rows) //TODO
  /* for (k=0; k<31; k++) { */
    k = 0; //debug
    // cut0->SetPoints...
    TMatrixDRow R(deltas, k);
    for (Int_t j=0; j<N; j++) deltArr[j] = R[j];
    A = A_guess; //temp?
    mu = TMath::Mean(N,deltArr.GetArray());
    sigma = TMath::RMS(N,deltArr.GetArray());
    g->SetParameters(A, mu, sigma, mu, sigma);
    /* g->SetParameters(A, mu, sigma); */
    // draw
    g->Draw("surf1");
  /* } */
  return;
}

//______________________________________________________________________________
// Save
void TKSMultiRibbons::Save()
{
  // save
  Bool_t kBatchOrig = gROOT->IsBatch();
  gROOT->SetBatch(kTRUE);
  TString outImageName(fOutFileName);
  outImageName.ReplaceAll("\.root$", "_ribbons.png");
  fHistoCanvas->Print(outImageName.Data());
  fOutFile->cd();
  fRibbonCanvas->Write();
  fOutFile->Write();
  /* fOutFile->Close(); */
  gROOT->SetBatch(kBatchOrig);
  return;
}

//______________________________________________________________________________
// Run()
void TKSMultiRibbons::Run()
{
  Init();
  Ribbons();
  Save();
  return;
}

////______________________________________________________________________________
//TKSMultiRibbons::
//{
//}

////______________________________________________________________________________
//TKSMultiRibbons::
//{
//}


