// TKSMultiRibbons -- Class for combining reference-comparison results from multiple runs
//   See TKSMultiRes for more information

#include "TKSMultiRibbons.h"

// Call the ClassImp() macro to give the TKSMultiRibbons class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TKSMultiRibbons);
#endif

//______________________________________________________________________________
// default ctor
TKSMultiRibbons::TKSMultiRibbons()
{
  // set name and title
  SetName("TKSMultiRibbons");
  SetTitle("class for analyzing DeltaPhi for each individual angle alongside TKSMultiRes");
  // necessary init
  fFileList = new TObjArray;
  fOutFileName = "KS_Multi.root";
  fRibbonList = new TList;
  fCutList = new TList;
  /* TMatrixD fDeltas(0,0); // use ResizeTo in Init() //TODO */
  fDeltas = new TMatrixD(31,4); // HC/debug
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
  if (fFileList->GetEntries()==0) FillFileList();
  /* fDeltas->ResizeTo(fFileList->GetEntries(), 4); //TODO: N_cols */
  return;
}

//______________________________________________________________________________
// RetrieveData
void TKSMultiRibbons::RetrieveData()
{
  //TODO
  cout << endl;
  return;
}

//______________________________________________________________________________
// Ribbons
void TKSMultiRibbons::Ribbons()
{
  //init
  Int_t k(0), kFile(0);
  /* Int_t N = fFileList->GetEntries(); */
  Int_t N = 31; //debug
  Int_t Nphi = 4; //debug
  TIter i(fFileList);
  TArrayD deltArr(Nphi);
  Double_t delta(1.0);
  Double_t angleLow(-1.), angleHigh(31.);
  Double_t diffLim(20.);
  TF2 *g;
  TString ribbonName, cutName;
  gStyle->SetPalette(54,0);
  TCutG *cut0;
  Double_t A_guess(1.), mu_guess(1.), sigma_guess(5.);
  Double_t A, mu, sigma;
  TString drawCmd, drawCmd2;
  /* fDeltas->Print(); //debug */
  TMatrixD deltas = *fDeltas;
  // retrieve data from files //TODO
  /* RetrieveData(); */
  deltas[0][0] =  2.; deltas[0][1] =  0.; deltas[0][2] = -3.; deltas[0][3] =  1; //debug
  deltas[1][0] = -1.; deltas[1][1] =  1.; deltas[1][2] = -2.; deltas[1][3] =  5; //debug
  deltas[2][0] =  3.; deltas[2][1] =  2.; deltas[2][2] = -1.; deltas[2][3] = -2; //debug
  deltas[3][0] =  2.; deltas[3][1] =  0.; deltas[3][2] = -3.; deltas[3][3] =  1; //debug
  deltas[4][0] =  2.; deltas[4][1] =  0.; deltas[4][2] = -3.; deltas[4][3] =  1; //debug
  deltas[5][0] = -1.; deltas[5][1] =  1.; deltas[5][2] = -2.; deltas[5][3] =  5; //debug
  deltas[6][0] =  3.; deltas[6][1] =  2.; deltas[6][2] = -1.; deltas[6][3] = -2; //debug
  deltas[7][0] =  2.; deltas[7][1] =  0.; deltas[7][2] = -3.; deltas[7][3] =  1; //debug
  deltas[8][0] =  2.; deltas[8][1] =  0.; deltas[8][2] = -3.; deltas[8][3] =  1; //debug
  deltas[9][0] = -1.; deltas[9][1] =  1.; deltas[9][2] = -2.; deltas[9][3] =  5; //debug
  deltas[10][0] =  3.; deltas[10][1] =  2.; deltas[10][2] = -1.; deltas[10][3] = -2; //debug
  deltas[11][0] =  2.; deltas[11][1] =  0.; deltas[11][2] = -3.; deltas[11][3] =  1; //debug
  deltas[12][0] =  2.; deltas[12][1] =  0.; deltas[12][2] = -3.; deltas[12][3] =  1; //debug
  deltas[13][0] = -1.; deltas[13][1] =  1.; deltas[13][2] = -2.; deltas[13][3] =  5; //debug
  deltas[14][0] =  3.; deltas[14][1] =  2.; deltas[14][2] = -1.; deltas[14][3] = -2; //debug
  deltas[15][0] =  2.; deltas[15][1] =  0.; deltas[15][2] = -3.; deltas[15][3] =  1; //debug
  deltas[16][0] =  2.; deltas[16][1] =  0.; deltas[16][2] = -3.; deltas[16][3] =  1; //debug
  deltas[17][0] = -1.; deltas[17][1] =  1.; deltas[17][2] = -2.; deltas[17][3] =  5; //debug
  deltas[18][0] =  3.; deltas[18][1] =  2.; deltas[18][2] = -1.; deltas[18][3] = -2; //debug
  deltas[19][0] =  2.; deltas[19][1] =  0.; deltas[19][2] = -3.; deltas[19][3] =  1; //debug
  deltas[20][0] =  2.; deltas[20][1] =  0.; deltas[20][2] = -3.; deltas[20][3] =  1; //debug
  deltas[21][0] = -1.; deltas[21][1] =  1.; deltas[21][2] = -2.; deltas[21][3] =  5; //debug
  deltas[22][0] =  3.; deltas[22][1] =  2.; deltas[22][2] = -1.; deltas[22][3] = -2; //debug
  deltas[23][0] =  2.; deltas[23][1] =  0.; deltas[23][2] = -3.; deltas[23][3] =  1; //debug
  /* cout << "Sample Data:" << endl; //debug */
  /* deltas.Print(); //debug */
  // plot
  fRibbonCanvas = new TCanvas("fRibbonCanvas", "Ribbon Plots", 1000, 100, 800, 800);
  fRibbonCanvas->SetGrid(1,1); //move me?
  // loop over angles (matrix rows)
  /* for (k=0; k<N; k++) { */
  for (k=0; k<23; k++) { //debug
    /* cout << "Beginning iteration k = " << k << endl; //debug */
    // set up cut
    cutName.Form("cut_%02dDEG", k);
    /* cout << "fCutList: " << fCutList << endl; //debug */
    /* if (fCutList) { */
    /*   /1* fCutList->ls(); //debug *1/ */
    /*   cout << "fCutList: " << fCutList << endl; */
    /* } else { */
    /*   cout << "Could not print fCutList = " << fCutList << endl; //debug */
    /* } */
    /* fCutList->Add( new TCutG(cutName.Data(),5) ); */
    /* cut0 = (TCutG*)fCutList->At(k); */
    cut0 = new TCutG(cutName.Data(), 5);
    /* cout << "created new cut" << endl; //debug */
    /* if (fCutList) { */
    /*   fCutList->Add(cut0); */
    /*   cout << "Added cut " << cut0->GetName() << endl; */
    /* } else { */
    /*   cout << "Error: fCutList = " << fCutList << endl; */
    /* } */
    cut0->SetVarX("x");
    cut0->SetVarY("y");
    cut0->SetPoint(0, -diffLim, k);
    cut0->SetPoint(1, -diffLim, k+delta);
    cut0->SetPoint(2,  diffLim, k+delta);
    cut0->SetPoint(3,  diffLim, k);
    cut0->SetPoint(4, -diffLim, k);
    /* cout << "finished " << cut0->GetName() << endl; //debug */
    // calculate parameters
    /* cout << "getting data..." << endl; //debug */
    TMatrixDRow R(deltas, k);
    /* cout << "data got" << endl; //debug */
    for (Int_t j=0; j<Nphi; j++) deltArr[j] = R[j];
    A = 1.; // each angle has the same number of entries, so they're effectively already normalized (relative to one another)
    mu = TMath::Mean(Nphi,deltArr.GetArray());
    sigma = TMath::RMS(Nphi,deltArr.GetArray());
    /* cout << "finished fit stats for k = " << k << endl; //debug */
    ribbonName.Form("g_%02dDEG", k);
    // create and adjust ribbon plot
    /* cout << "creating ribbon plot " << ribbonName.Data() << endl; //debug */
    /* fRibbonList->ls(); //debug */
    /* fRibbonList->Add( new TF2(ribbonName.Data(), "gaus(0)", -diffLim, diffLim, angleLow, angleHigh) ); */
    g = new TF2(ribbonName.Data(), "gaus(0)", -diffLim, diffLim, angleLow, angleHigh);
    /* cout << ribbonName.Data() << " created" << endl; //debug */
    /* cout << g << "\t" << fRibbonList << endl; //debug */
    /* fRibbonList->Add(g); */
    /* cout << ribbonName.Data() << " added" << endl; //debug */
    /* fRibbonList->ls(); //debug */
    /* g = (TF2*)fRibbonList->At(k); */
    g->SetLineWidth(1);
    g->SetLineColor(kCyan);
    g->SetNpx(90);
    /* g->SetNpy(90); */
    g->SetParameters(A, mu, sigma);
    // set annotations (first iteration only)
    if (k==0) {
      g->SetTitle("#Delta#varphi Distributions at Individual Angles");
      g->GetXaxis()->SetTitle("#varphi_{Recon}-#varphi_{True} (^{o})");
      g->GetYaxis()->SetTitle("#varphi_{True} (^{o})");
      g->GetXaxis()->SetTitleOffset(2.0);
      g->GetYaxis()->SetTitleOffset(2.0);
      drawCmd.Form("surf1 [%s]", cutName.Data());
      drawCmd2.Form("same surf3 [%s]", cutName.Data());
    } else {
      drawCmd.Form("same surf1 [%s]", cutName.Data());
    }
    drawCmd2.Form("same surf3 [%s]", cutName.Data());
    // draw
    /* cout << "finished k = " << k << endl << endl; //debug */
    g->Draw(drawCmd.Data());
    /* if (k==0)  g->GetZaxis()->SetLimits(0.0, 2.0); //debug //HC //TODO */
    if (k==0)  g->GetZaxis()->SetRangeUser(0.0, 2.0); //debug //HC //TODO
    /* g->Draw(drawCmd2.Data()); // turn off to disable projected heatmap */
  }
  return;
}

//______________________________________________________________________________
// Save
void TKSMultiRibbons::Save()
{
  // save
  if (! fOutFile) fOutFile = TFile::Open(fOutFileName.Data(), "recreate");
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


