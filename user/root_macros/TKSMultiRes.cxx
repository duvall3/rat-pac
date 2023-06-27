// TKSMultiRes -- Class for combining reference-comparison results from multiple runs

#include "TKSMultiRes.h"

// Call the ClassImp() macro to give the TKSMultiRes class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TKSMultiRes);
#endif

//______________________________________________________________________________
// default ctor
TKSMultiRes::TKSMultiRes()
{
  // set name and title
  SetName("TKSMultiRes");
  SetTitle("class for combining angular-resolution results from multiple reference-matching test runs");
  // required init
  fFileList = new TObjArray;
  fRibbons = 0x0; // force null ptr until TKSMultiRibbons::Init()
  /* fkRibbon = kFALSE; */
  fkRibbon = kTRUE;
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
// GenerateRibbonMacro
/**
 * This function is called by Save() if a ribbon plot exists.
 * Because TCanvas::Write() does not seem to record the "cut" options,
 * simply writing the ribbon canvas to a TFile and then attempting to draw
 * the ribbon canvas from the file does not display the ribbon plots correctly.  
 * **This feature enables a user to properly open the ribbon plot interactively
 * without needing to access the source datafiles and TKSMultiRes/TKSMultiRibbons classes.**  
 * *Note: This was written with ROOTv5.34/30 and may not work with other versions.*  
 * \retval mac -- macro for redrawing ribbon plots from output file
 */
TMacro* TKSMultiRes::GenerateRibbonMacro()
{
  // init
  TMacro *mac = new TMacro("ribbonMac", "ROOTv5.34/30 macro for recreating ribbon plot");
  mac->AddLine("{");

  // generate macro line-by-line
  mac->AddLine("// init");
  mac->AddLine("TMatrixD *deltasPtr = (TMatrixD*)gDirectory->Get(\"deltas\");");
  mac->AddLine("TMatrixD deltas = *deltasPtr;");
  mac->AddLine("TCanvas *c_rib = new TCanvas(\"c_rib\", \"Ribbon Plot\");");
  mac->AddLine("Int_t k(0), kFile(0);");
  mac->AddLine("Int_t N = deltas->GetNrows();");
  mac->AddLine("Int_t Nphi = deltas->GetNcols();");
  mac->AddLine("TArrayD deltArr(Nphi);");
  mac->AddLine("Double_t delta(1.0);");
  mac->AddLine("Double_t angleLow(0.), angleHigh(31.);");
  mac->AddLine("Double_t diffLim(20.);");
  mac->AddLine("TF2 *g;");
  mac->AddLine("TString ribbonName, cutName;");
  mac->AddLine("gStyle->SetPalette(54,0);");
  mac->AddLine("TCutG *cut0;");
  mac->AddLine("Double_t A_guess(1.), mu_guess(1.), sigma_guess(5.);");
  mac->AddLine("Double_t A, mu, sigma;");
  mac->AddLine("Int_t nDims;");
  mac->AddLine("Double_t meanMarkerX[2];");
  mac->AddLine("Double_t meanMarkerY[2];");
  mac->AddLine("Double_t meanMarkerZ[2] = {1., 1.};");
  mac->AddLine("TPolyLine *l2;");
  mac->AddLine("TPolyLine3D *l3;");
  mac->AddLine("Int_t meanMarkerCount(0);");
  mac->AddLine("Double_t titleOffset;");
  mac->AddLine("TString rhOption(\"surf2\");");
  mac->AddLine("nDims = 3;");
  mac->AddLine("titleOffset = 2.0;");
  mac->AddLine("TString drawCmd, drawCmd2;");
  mac->AddLine("// plot");
  mac->AddLine("// loop over angles (matrix rows)");
  mac->AddLine("for (k=0; k<N; k++) {");
  mac->AddLine("  // set up cut");
  mac->AddLine("  cutName.Form(\"cut_%02dDEG\", k);");
  mac->AddLine("  cut0 = new TCutG(cutName.Data(), 5);");
  mac->AddLine("  cut0->SetVarX(\"x\");");
  mac->AddLine("  cut0->SetVarY(\"y\");");
  mac->AddLine("  cut0->SetPoint(0, -diffLim, k);");
  mac->AddLine("  cut0->SetPoint(1, -diffLim, k+delta);");
  mac->AddLine("  cut0->SetPoint(2,  diffLim, k+delta);");
  mac->AddLine("  cut0->SetPoint(3,  diffLim, k);");
  mac->AddLine("  cut0->SetPoint(4, -diffLim, k);");
  mac->AddLine("  // calculate parameters");
  mac->AddLine("  TMatrixDRow deltaRow(deltas, k);");
  mac->AddLine("  for (Int_t j=0; j<Nphi; j++) deltArr[j] = deltaRow[j];");
  mac->AddLine("  A = 1.; // each angle has the same number of entries, so they're effectively already normalized (relative to one another)");
  mac->AddLine("  mu = TMath::Mean(Nphi,deltArr.GetArray());");
  mac->AddLine("  sigma = TMath::RMS(Nphi,deltArr.GetArray());");
  mac->AddLine("  meanMarkerX[0] = mu;");
  mac->AddLine("  meanMarkerX[1] = mu;");
  mac->AddLine("  meanMarkerY[0] = k;");
  mac->AddLine("  meanMarkerY[1] = k+1;");
  mac->AddLine("  // create and adjust ribbon plot");
  mac->AddLine("  ribbonName.Form(\"g_%02dDEG\", k);");
  mac->AddLine("  gSystem->RedirectOutput(\"/dev/null\"); // discard the error about number of parameters when creating the next 'new TF2'");
  mac->AddLine("  g = new TF2(ribbonName.Data(), \"gaus(0)\", -diffLim, diffLim, angleLow, angleHigh);");
  mac->AddLine("  gSystem->RedirectOutput(0); // reset stderr,stdout");
  mac->AddLine("  g->SetLineWidth(1);");
  mac->AddLine("  g->SetLineColor(kCyan);");
  mac->AddLine("  g->SetNpx(90);");
  mac->AddLine("  g->SetParameters(A, mu, sigma);");
  mac->AddLine("  // set annotations (first iteration only)");
  mac->AddLine("  if (k==0) {");
  mac->AddLine("    g->SetTitle(\"#Delta#varphi Distributions at Individual Angles\");");
  mac->AddLine("    g->GetXaxis()->SetTitle(\"#varphi_{Best} - #varphi_{True} (^{o})\");");
  mac->AddLine("    g->GetYaxis()->SetTitle(\"#varphi_{True} (^{o})\");");
  mac->AddLine("    g->GetXaxis()->SetTitleOffset(titleOffset);");
  mac->AddLine("    g->GetYaxis()->SetTitleOffset(titleOffset);");
  mac->AddLine("    drawCmd.Form(\"%s [%s]\", rhOption.Data(), cutName.Data());");
  mac->AddLine("  } else {");
  mac->AddLine("    drawCmd.Form(\"same %s [%s]\", rhOption.Data(), cutName.Data()); // default");
  mac->AddLine("  } // end if -- first iteration");
  mac->AddLine("  // draw");
  mac->AddLine("  g->Draw(drawCmd.Data());");
  mac->AddLine("  // add mean markers");
  mac->AddLine("  l3 = new TPolyLine3D(2, meanMarkerX, meanMarkerY, meanMarkerZ);");
  mac->AddLine("  l3->SetLineColor(kRed);");
  mac->AddLine("  l3->SetLineWidth(5.);");
  mac->AddLine("  l3->Draw(\"same\");");
  mac->AddLine("} // end angle loop");

  // finish up
  mac->AddLine("}");
  return mac;
}

//______________________________________________________________________________
// Init
void TKSMultiRes::Init()
{
  FillFileList();
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
  /* fOutFile->cd(); */
  // plot and fit
  fHistoCanvas = new TCanvas("c", "KS_Multi");
  fHistoSum->Draw();
  fHistoSumFit = new TF1("Summed Histogram", "[0]*TMath::Gaus(x,[1],[2])", -diffLimit, diffLimit);
  fHistoSumFit->SetLineColor(kGreen);
  fHistoSumFit->SetParNames("Constant", "Mean", "Sigma");
  fHistoSumFit->SetParameters(constantGuess, meanGuess, sigmaGuess);
  fHistoSumFitResultPtr = fHistoSum->Fit(fHistoSumFit, "SR");
  fHistoSumFitResult = fHistoSumFitResultPtr.Get();
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
  // init
  fRibbons = new TKSMultiRibbons;
  /* fRibbons->SetMultiRes(this); */
  fRibbons->SetOutFile(GetOutFile());
  fRibbons->SetOutFileName(GetOutFileName().Data());
  fRibbons->Run();
  return;
}

//______________________________________________________________________________
// Save
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
 * - A macro for properly opening the saved ribbon plot, if one was created
 */
void TKSMultiRes::Save()
{
  // save
  Bool_t kBatchOrig = gROOT->IsBatch();
  gROOT->SetBatch(kTRUE);
  fOutFile = TFile::Open(fOutFileName.Data(), "recreate");
  TString outImageName(fOutFileName);
  outImageName.ReplaceAll("\.root", ".png");
  fHistoCanvas->Print(outImageName.Data());
  fOutFile->cd();
  fHistoCanvas->Write("c_histo");
  fHistoCanvas->Close();
  fHistoSum->Write("histo");
  fHistoSumFit->Write("gausFit");
  fHistoSumFitResult->Write("fitResult");
  if (fRibbons) {
  /*   fRibbons->Write("ribbons"); */
    fRibbons->Save();
    fRibbons->GetDeltas()->Write("deltas");
    GenerateRibbonMacro()->Write("ribbonMac");
    /* GenerateRibbonMacro(); //debug */
  }
  fOutFile->Write();
  fOutFile->Close();
  gROOT->SetBatch(kBatchOrig);
  return;
}

//______________________________________________________________________________
// Run()
void TKSMultiRes::Run()
{
  Init();
  cout << "Plotting summed histogram..." << endl; //debug
  Histos();
  cout << endl;
  if (fkRibbon) Ribbons();
  /* Save(); */
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


