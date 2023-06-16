<<<<<<< HEAD
// TKSMultiRibbons -- Class for combining reference-comparison results from multiple runs
//   See TKSMultiRes for more information
=======
// TKSMultiRibbons -- basic template for writing ROOT classes
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a

#include "TKSMultiRibbons.h"

// Call the ClassImp() macro to give the TKSMultiRibbons class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TKSMultiRibbons);
#endif

//______________________________________________________________________________
// default ctor
TKSMultiRibbons::TKSMultiRibbons()
{
<<<<<<< HEAD
  // set name and title
  SetName("TKSMultiRibbons");
  SetTitle("class for analyzing DeltaPhi for each individual angle alongside TKSMultiRes");
  // necessary init
  fPlotTypes = kBoth;
  fFileList = new TObjArray;
  fOutFileName = "KS_Multi.root";
  fRibbonList = new TList;
  fCutList = new TList;
  // just to be sure
  SetInit(kFALSE);
}

=======
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

>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
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
<<<<<<< HEAD
  if (fFileList->GetEntries()==0) FillFileList();
  SetNFiles(fFileList->GetEntries());
  TFile *_f = TFile::Open(fFileList->At(0)->GetName());
  TMatrixD *arm = (TMatrixD*)gDirectory->Get("allResultsMatrix");
  Int_t nAngles = arm->GetNrows();
  _f->Close();
  SetNAngles(nAngles);
  FillData();
  SetInit(kTRUE);
=======
  // define here
  if (fFileList->GetEntries()==0) FillFileList();
  if (! fOutFile) fOutFile = TFile::Open(fOutFileName.Data(), "recreate");
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
  return;
}

//______________________________________________________________________________
<<<<<<< HEAD
// RetrieveData
TMatrixD TKSMultiRibbons::RetrieveData()
{
  // init
  Int_t nRows, nCols, nFiles = GetNFiles(), nAngles = GetNAngles();
  TFile *ff;
  TSystemFile *sf;
  TMatrixD *arm;
  TMatrixD ARM;
  TMatrixD Deltas(nAngles, nFiles);
  // loop over files to fill Deltas using TMatrixDColumn(allResultsMatrix, Ncols-1)
  Int_t k;
  TIter i(fFileList);
  for ( i=fFileList->begin(); i!=fFileList->end(); ++i ) {
    sf = (TSystemFile*)*i;
    f = TFile::Open(sf->GetName());
    arm = (TMatrixD*)gDirectory->Get("allResultsMatrix");
    nRows = arm->GetNrows();
    nCols = arm->GetNcols();
    ARM.ResizeTo(nRows, nCols);
    ARM = *arm;
    nCols = ARM.GetNcols();
    TMatrixDColumn deltaCol(ARM, nCols-1);
    for ( Int_t j=0; j<nRows; j++ ) {
      Deltas[j][k] = deltaCol[j];
    }
    f->Close();
    k++;
  }
  /* Deltas.Print(); //debug */
  TMatrixD newDeltas( nAngles, nFiles );
  for ( Int_t row=0; row<nAngles; row++ ) {
    for ( Int_t col=0; col<nFiles; col++ ) {
      newDeltas[row][col] = Deltas[row][col];
    }
  }
  return newDeltas;
}

//______________________________________________________________________________
// SetDeltas
void TKSMultiRibbons::SetDeltas(TMatrixD *newDeltas)
{
  fDeltas = new TMatrixD( newDeltas->GetNrows(), newDeltas->GetNcols() );
  fDeltas->SetMatrixArray( newDeltas->GetMatrixArray() );
  return;
}

//______________________________________________________________________________
// FillData
void TKSMultiRibbons::FillData()
{
  SetDeltas( &(RetrieveData()) );
}

//______________________________________________________________________________
// DrawPlots
void TKSMultiRibbons::DrawPlots()
{
  //init
  Int_t k(0), kFile(0);
  Int_t N = GetNAngles();
  Int_t Nphi = GetNFiles();
  TArrayD deltArr(Nphi);
  Double_t delta(1.0);
  Double_t angleLow(0.), angleHigh(31.);
  Double_t diffLim(20.);
  TF2 *g;
  TString ribbonName, cutName;
  gStyle->SetPalette(54,0);
  TCutG *cut0;
  Double_t A_guess(1.), mu_guess(1.), sigma_guess(5.);
  Double_t A, mu, sigma;
  switch (GetCurrentPlotType()) {
    case kRibbons:
      TString rhOption("surf2");
      /* cout << "Current Plot Type: kRibbons" << endl; //debug */
      /* cout << "rhOption: " << rhOption.Data() << endl; //debug */
      break;
    case kHeatmap:
      TString rhOption("colz");
      /* cout << "Current Plot Type: kHeatmap" << endl; //debug */
      /* cout << "rhOption: " << rhOption.Data() << endl; //debug */
      break;
    default:
      this->Error("TKSMultiRibbons", "PlotTypes selection not recognized.\n");
  }
  /* cout << GetCurrentPlotType() << endl; //debug */
  /* cout << rhOption.Data() << endl; //debug */
  TString drawCmd, drawCmd2;
  TMatrixD deltas = *(GetDeltas());
  // plot
  // loop over angles (matrix rows)
  for (k=0; k<N; k++) {
    // set up cut
    cutName.Form("cut_%02dDEG", k);
    cut0 = new TCutG(cutName.Data(), 5);
    cut0->SetVarX("x");
    cut0->SetVarY("y");
    cut0->SetPoint(0, -diffLim, k);
    cut0->SetPoint(1, -diffLim, k+delta);
    cut0->SetPoint(2,  diffLim, k+delta);
    cut0->SetPoint(3,  diffLim, k);
    cut0->SetPoint(4, -diffLim, k);
    // calculate parameters
    TMatrixDRow deltaRow(deltas, k);
    for (Int_t j=0; j<Nphi; j++) deltArr[j] = deltaRow[j];
    A = 1.; // each angle has the same number of entries, so they're effectively already normalized (relative to one another)
    mu = TMath::Mean(Nphi,deltArr.GetArray());
    sigma = TMath::RMS(Nphi,deltArr.GetArray());
    ribbonName.Form("g_%02dDEG", k);
    // create and adjust ribbon plot
    gSystem->RedirectOutput("/dev/null"); // discard the error about number of parameters when creating the next 'new TF2'
    g = new TF2(ribbonName.Data(), "gaus(0)", -diffLim, diffLim, angleLow, angleHigh);
    gSystem->RedirectOutput(0); // reset stderr,stdout
    /* fRibbonList->Add(g); */
    /* fRibbonList->ls(); //debug */
    g->SetLineWidth(1);
    g->SetLineColor(kCyan);
    g->SetNpx(90);
    /* g->SetNpy(90); */
    g->SetParameters(A, mu, sigma);
    // set annotations (first iteration only)
    if (k==0) {
      g->SetTitle("#Delta#varphi Distributions at Individual Angles");
      g->GetXaxis()->SetTitle("#varphi_{Recon} - #varphi_{True} (^{o})");
      g->GetYaxis()->SetTitle("#varphi_{True} (^{o})");
      g->GetXaxis()->SetTitleOffset(2.0);
      g->GetYaxis()->SetTitleOffset(2.0);
      drawCmd.Form("%s [%s]", rhOption.Data(), cutName.Data());
    } else {
      drawCmd.Form("same %s [%s]", rhOption.Data(), cutName.Data()); // default
    }
    // draw
    /* cout << "finished k = " << k << endl << endl; //debug */
    /* cout << drawCmd.Data() << endl; //debug */
    g->Draw(drawCmd.Data());
  }
=======
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
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
  return;
}

//______________________________________________________________________________
<<<<<<< HEAD
// Ribbons
void TKSMultiRibbons::Ribbons()
{
  if (! IsInit()) Init();
  SetCurrentPlotType(kRibbons);
  gSystem->RedirectOutput("/dev/null"); // suppress warning if replacing canvas
  fRibbonCanvas = new TCanvas("fRibbonCanvas", "Ribbon Plots", 1000, 100, 800, 800);
  gSystem->RedirectOutput(0); // reset stderr,stdout
  fRibbonCanvas->SetGrid(1,1);
  fRibbonCanvas->cd();
  DrawPlots();
}

//______________________________________________________________________________
// Heatmap
void TKSMultiRibbons::Heatmap()
{
  if (! IsInit()) Init();
  SetCurrentPlotType(kHeatmap);
  gSystem->RedirectOutput("/dev/null"); // suppress warning if replacing canvas
  fHeatmapCanvas = new TCanvas("fHeatmapCanvas", "Heatmap Plot", 1000, 100, 800, 800);
  gSystem->RedirectOutput(0); // reset stderr,stdout
  fHeatmapCanvas->cd();
  DrawPlots();
}

//______________________________________________________________________________
=======
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
// Save
void TKSMultiRibbons::Save()
{
  // save
  Bool_t kBatchOrig = gROOT->IsBatch();
  gROOT->SetBatch(kTRUE);
<<<<<<< HEAD
  /* cout << GetOutFile() << endl; //debug */
  /* cout << GetOutFileName().Data() << endl; //debug */
  /* if ( GetOutFile() == 0x0 ) { */
  /*   printf("Creating file \"%s\"...\n", GetOutFileName().Data()); */
  /*   TFile *_f = TFile::Open(fOutFileName.Data(), "recreate"); */
  /*   SetOutFile(_f); */
  /* } else { */
  /*   printf("Using OutFile \"%s\"...\n", GetOutFile()->GetName()); */
  /* } */
  /* cout << gFile << endl; //debug */
  /* GetOutFile()->cd(); */
  /* cout << "Current file: " << gFile << endl; //debug */
  /* if (! GetOutFile()->IsOpen()) SetOutFile( TFile::Open(fOutFileName.Data(), "update") ); */
  if (fRibbonCanvas) {
    TString outRibbonName(fOutFileName);
    outRibbonName.ReplaceAll("\.root", "_Ribbons.png");
    /* cout << outRibbonName.Data() << endl;  //debug */
    fRibbonCanvas->Print(outRibbonName.Data());
    /* fRibbonCanvas->Write("c_rib"); */
    /* fRibbonCanvas->Close(); */
  }
  if (fHeatmapCanvas) {
    TString outHeatmapName(fOutFileName);
    outHeatmapName.ReplaceAll("\.root", "_Heatmap.png");
    /* cout << outHeatmapName.Data() << endl;  //debug */
    fHeatmapCanvas->Print(outHeatmapName.Data());
    /* fHeatmapCanvas->Write("c_heat"); */
    /* fHeatmapCanvas->Close(); */
  }
  /* this->Write("MultiRibbons"); */
  /* this->Write("MultiRibbons", TObject::kSingleKey); */
  /* GetOutFile()->Write(); */
  /* GetOutFile()->Close(); */
  gROOT->SetBatch(kBatchOrig);
  if (fHeatmapCanvas) Heatmap();
  if (fRibbonCanvas) Ribbons();
=======
  TString outImageName(fOutFileName);
  outImageName.ReplaceAll("\.root$", "_ribbons.png");
  fHistoCanvas->Print(outImageName.Data());
  fOutFile->cd();
  fRibbonCanvas->Write();
  fOutFile->Write();
  /* fOutFile->Close(); */
  gROOT->SetBatch(kBatchOrig);
>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
  return;
}

//______________________________________________________________________________
// Run()
void TKSMultiRibbons::Run()
{
  Init();
<<<<<<< HEAD
  switch(GetPlotTypes()) {
  /* switch(fPlotTypes) { */
    case kRibbons:
      cout << "Plotting ribbons only..." << endl; //debug
      Ribbons();
      break;
    case kHeatmap:
      cout << "Plotting heatmap only..." << endl; //debug
      Heatmap();
      break;
    case kBoth:
      /* cout << "Plotting ribbons and heatmap..." << endl; //debug */
      cout << "Plotting heatmap..." << endl; //debug
      Heatmap();
      cout << "Plotting ribbons..." << endl; //debug
      Ribbons();
      break;
    default:
      this->Error("TKSMultiRibbons", "PlotTypes selection not recognized.\n");
  }
  /* Save(); */
  return;
}

/* //______________________________________________________________________________ */
/* // override ls // ? */
/* TKSMultiRibbons::ls() */
/* { */
/* } */

//______________________________________________________________________________
// override Print
void TKSMultiRibbons::Print()
{
  printf( "%s: %s\n", GetName(), GetTitle() );
  printf( "Name\t\t\tAddress/Value\t\tEntries (if TCollection)\n" );
  printf( "fFileList\t\t0x%x\t\t%d\n", GetFileList(), GetFileList()->GetEntries() );
  printf( "fOutFileName\t\t%s\n", GetOutFileName().Data() );
  printf( "fOutFile\t\t0x%x\n", GetOutFile() );
  printf( "fRibbonCanvas\t\t0x%x\n", GetRibbonCanvas() );
  printf( "fRibbonList\t\t0x%x\t\t%d\n", GetRibbonList(), GetRibbonList()->GetEntries() );
  printf( "fCutList\t\t0x%x\t\t%d\n", GetCutList(), GetCutList()->GetEntries() );
  printf( "fDeltas\t\t\t0x%x\t\t%dx%d\n", GetDeltas(), GetDeltas()->GetNrows(), GetDeltas()->GetNcols() );
  printf( "\n" );
}

//______________________________________________________________________________
// PrintEnums
void TKSMultiRibbons::PrintEnums()
{
  printf("Enums for class %s:\n", Class_Name());
  printf("EPlotTypes:\n");
  printf("  0:\tkRibbons\n  1:\tkHeatmap\n  2:\tkBoth\n");
}

=======
  Ribbons();
  Save();
  return;
}

>>>>>>> f2017a597cec63025f3562a7bc78f09ef0e5058a
////______________________________________________________________________________
//TKSMultiRibbons::
//{
//}

////______________________________________________________________________________
//TKSMultiRibbons::
//{
//}


