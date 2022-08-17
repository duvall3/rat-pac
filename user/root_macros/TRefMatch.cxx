// TRefMatch -- class for implementing the reference-matching algorithm
//   described in this repository at $RATROOT/user/ref_matching/README.{md,html}
// NOTE: To run an Unbinned Komogorov-Smirnov Test on *any* pair of TTrees
//   (i.e., without using this class), see the standalone version UnbinnedKSTest
//   in the the TDuvallUtils library at $RATROOT/user/root_macros/TDuvallUtils.{h,cxx}
// Standard Usage (* = always required):
// * 1) Instantiate (NOTE: must construct with "new")
//   2) Call Init ("setter version") if used default ctor
//   3) Set reference directory / pattern if needed
// * 4) Call FillReferenceFileList
//   5) Set tree and branch names if needed
//   6) Set number of events to use from {test-sample, reference-distrib} if desired
// * 7) Call RefCompare
//   8) Call DrawResults if desired
//   9) Call Save if desired
//  10) Call Close when finished

// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 07/2022 ~ //

//Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include <TRefMatch.h>

// Call the ClassImp() macro to give the TRefMatch class RTTI and full I/O capabilities.
#if !defined(__CLING__)
  ClassImp(TRefMatch);
#endif

//______________________________________________________________________________
// default ctor
TRefMatch::TRefMatch()
{
  SetName("TRefMatch");
  SetTitle("class for implementing KS-test reference-matching algorithm");
  fReferenceFileList = new TList;
  fResults.ResizeTo(4);
  fkHasInit = kFALSE;
  fkHasRun = kFALSE;
}

//______________________________________________________________________________
// regular ctor
TRefMatch::TRefMatch( const char* fileName, const char* treeName, const char* branchVarName )
{
  SetName("TRefMatch");
  SetTitle("class for implementing KS-test reference-matching algorithm");
  fTestFileName = fileName;
  fTestTreeName = treeName;
  fTestVarName = branchVarName;
  fReferenceFileDir = new TSystemDirectory; // has to happen before TFile::Open in case file is elsewhere
  fReferenceFileDir->SetDirectory( gSystem->WorkingDirectory() );
  fTestSampleFile = TFile::Open( fTestFileName );
  fTestSampleTree = (TTree*)gDirectory->Get(fTestTreeName);
  if (fTestSampleTree) {
    fTestSampleBranch = fTestSampleTree->GetBranch(fTestVarName);
  } else {
    fTestSampleBranch = 0x0;
  }
  fReferenceTreeName = "T";
  fReferenceFileList = new TList;
  fReferenceFilePattern = TRegexp("[0-9]+DEG.*\.root");
  fResults.ResizeTo(4);
  fkHasInit = kFALSE;
  fkHasRun = kFALSE;
  Init();
}

//______________________________________________________________________________
// initialize: validate and fill members
void TRefMatch::Init()
{
  // checks
  if (fTestSampleFile==0x0) {
    this->Error("TRefMatch::Init", "Requested file not found.");
    return;
  }
  if (fTestSampleTree==0x0){
    this->Error("TRefMatch::Init", "Requested TTree not found.");
    return;
  }
  if (fTestSampleBranch==0x0){
    this->Error("TRefMatch::Init", "Requested TBranch not found.");
    return;
  }
  if (fnTestSampleEvents==0) SetnEvents((Long64_t)(GetTree()->GetEntries()));
  // get true source angle for test sample
  if ( fTestSampleFile->Get("params"!=0) ) { // RNG pseudo-data run
    TMap* testSampleParams = (TMap*)fTestSampleFile->Get("params");
    TVectorD* tsPhiTrueVector = (TVectorD*)testSampleParams->GetValue("phiTrue");
    SetTestSamplePhiTrue( (*tsPhiTrueVector)[0] );
  } else if ( fTestSampleFile->Get("phiTrue"!=0) ) { // regular RATRUN
    TVectorD* tsPhiTrueVector = (TVectorD*)fTestSampleFile->Get("phiTrue");
    SetTestSamplePhiTrue( (*tsPhiTrueVector)[0] );
  } else {
    this->Info("Init", "Could not find either \"params\" or \"phiTrue\" in current ROOT directory.\n");
  }
  // if all of the above check out okay, create outfile
  TSystemDirectory *wd = new TSystemDirectory;
  wd->SetDirectory(gSystem->WorkingDirectory());
  fReferenceFilePattern = TRegexp("[0-9]+DEG.*\.root");
  fReferenceFileDir = new TSystemDirectory;
  fReferenceFileDir->SetDirectory( gSystem->WorkingDirectory() );
  fTestSampleHist = 0x0;
  fResultsGraph = 0x0;
  printf("Init complete.\n");
  fkHasInit = kTRUE;
  return;
}

//______________________________________________________________________________
// Init -- setter version
void TRefMatch::Init( const char* fileName, const char* treeName , const char* branchVarName )
{
  fTestFileName = fileName;
  fTestTreeName = treeName;
  fTestVarName = branchVarName;
  fTestSampleFile = TFile::Open( fTestFileName );
  fTestSampleTree = (TTree*)gDirectory->Get(fTestTreeName);
  if (fTestSampleTree) {
    fTestSampleBranch = fTestSampleTree->GetBranch(fTestVarName);
  } else {
    fTestSampleBranch = 0x0;
  }
  Init();
  return;
}

//______________________________________________________________________________
// SetReferenceFileDir
void TRefMatch::SetReferenceFileDir( TSystemDirectory* refFileDir )
{
  if (refFileDir!=0x0) {
    fReferenceFileDir = refFileDir;
  } else {
    this->Error("TRefMatch::SetReferenceFileDir", "Invalid directory.");
  }
  return;
}

//______________________________________________________________________________
// SetReferenceFileDir
void TRefMatch::SetReferenceFileDir( const char* refFileDirName )
{
  TSystemDirectory* sd = new TSystemDirectory;
  sd->SetDirectory(refFileDirName);
  SetReferenceFileDir(sd);
  return;
}

//______________________________________________________________________________
// SetReferenceFilePattern
void TRefMatch::SetReferenceFilePattern( TRegexp patternRE )
{
  fReferenceFilePattern = patternRE;
  return;
}

//______________________________________________________________________________
// SetReferenceFilePattern
void TRefMatch::SetReferenceFilePattern( const char* pattern )
{
  TRegexp patternRE(pattern);
  SetReferenceFilePattern(patternRE);
  return;
}

//______________________________________________________________________________
// FillReferenceFileList
void TRefMatch::FillReferenceFileList()
{

  // check
  if (fReferenceFileDir==0x0) {
    this->Error("TRefMatch::FillReferenceFileList", "Set fReferenceFileDir first.");
    return;
  }

  // init
  TSystemFile *sf = new TSystemFile;
  TString  sfName;
  fReferenceFileList->Clear();

  // MAIN
  TList *dirFiles = fReferenceFileDir->GetListOfFiles();
  TIter i(dirFiles);
  for ( i = dirFiles->begin(); i != dirFiles->end(); ++i ) {
    sf = (TSystemFile*)*i;
    sfName.Form( sf->GetName() );
    /* cout << sfName.Data(); //debug */
    if ( sfName.Contains(fReferenceFilePattern) ) fReferenceFileList->Add(sf);
  }

  // all pau!   )
  return;

}

//______________________________________________________________________________
// Prob2Sig
Double_t TRefMatch::Prob2Sig( Double_t prob )
{
  // convert, accounting for special values
  Double_t sigma;
  if ( prob == 1. ) {
    sigma = TMath::Infinity();
  } else if ( prob == 0. ) {
    sigma = 0.;
  } else {
    sigma = TMath::Sqrt2() * TMath::ErfInverse(prob);
  }
  // all pau!   )
  return sigma;
}

//______________________________________________________________________________
// Sig2Prob
Double_t TRefMatch::Sig2Prob( Double_t sig )
{
  // convert, accounting for special values
  Double_t prob;
  if (sigma == TMath::Infinity()) {
    prob = 1.;
  } else if ( sigma == 0. ) {
    prob = 0.;
  } else {
    prob = TMath::Erf( sigma / TMath::Sqrt2() );
  }
  // all pau!   )
  return prob;
}

//______________________________________________________________________________
// UnbinnedKSTest
Double_t TRefMatch::UnbinnedKSTest( TTree *T1, TTree *T2, const char* branchName1, const char* branchName2, Long64_t nEvents1, Long64_t nEvents2 ) 
{
  // unbinnedKSTest -- function to execute *unbinned* TMath::KolmogorovTest on a pair of TTrees
  //   containing TBranches with matching names
  // -- Usage: Double_t P = unbinnedKSTest( TTree *T1, TTree *T2, const char* branchName )
  // -- Branches must be of type Double_t
  // -- P is the probability for match
  // -- *T1 and *T2 are pointers to the two input trees
  // -- branchName{1,2} are the branch/variable names in the respective trees
  // -- nEvents{1,2} are the number of entries to use from each tree (default value 0 will use all entries)
  // -- See the notes in TMath::KolmogorovTest and TH1::KolmogorovTest for details
  // Note: Arrays must be sorted before they can be
  //   fed to TMath::KolmogorovTest!

  // arg check
  if (branchName2 == "") branchName2 = branchName1;

  // init
  // basics
  Double_t P;
  Double_t q1, q2; // quantity1, quantity2
  Long64_t k;
  if (nEvents1==0) nEvents1 = (Long64_t)T1->GetEntries();
  if (nEvents2==0) nEvents2 = (Long64_t)T2->GetEntries();
  // TBranches
  TBranch *br1 = T1->GetBranch(branchName1);
  TBranch *br2 = T2->GetBranch(branchName2);
  if ( (br1==0x0) | (br2==0x0) ) {
    gFile->Error("TRefMatch::UnbinnedKSTest", "Specified branch missing from one or both TTrees.");
    return TMath::QuietNaN();
  }
  T1->SetBranchAddress(branchName1, &q1);
  T2->SetBranchAddress(branchName2, &q2);
  // raw arrays
  Double_t *arr1 = new Double_t[nEvents1];
  Double_t *arr2 = new Double_t[nEvents2];
  // index arrays
  Long64_t *ind1 = new Long64_t[nEvents1];
  Long64_t *ind2 = new Long64_t[nEvents2];
  // sorted arrays
  Double_t *arr1S = new Double_t[nEvents1];
  Double_t *arr2S = new Double_t[nEvents2];

  // fill, sort, re-fill (use kFALSE to sort ascending)
  // Note on nEvents1,nEvents2 loops: Yes, there is a more-efficient (single-loop) way to do this;
  // but the switching is non-trivial and code running today is better than code in debug tomorrow, right? (Right?)
  // first fill
  for ( k=0; k<nEvents1; k++ ) {
    T1->GetEntry(k);
    arr1[k] = q1;
  }
  for ( k=0; k<nEvents2; k++ ) {
    T2->GetEntry(k);
    arr2[k] = q2;
  }
  // sort
  TMath::Sort(nEvents1, arr1, ind1, kFALSE);
  TMath::Sort(nEvents2, arr2, ind2, kFALSE);
  // second fill
  for ( k=0; k<nEvents1; k++ ) {
    arr1S[k] = arr1[ind1[k]];
  }
  for ( k=0; k<nEvents2; k++ ) {
    arr2S[k] = arr2[ind2[k]];
  }

  // MAIN: Finally ready to calculate the K-S probability
  // NOTE: THE "OPTION" ARGUMENT IS (ironically) NOT OPTIONAL, EVEN IF EMPTY!
  P = TMath::KolmogorovTest( nEvents1, arr1S, nEvents2, arr2S, "" );

  SetProb(P);
  SetSig( Prob2Sig(P) );

  // all pau!   )
  return fProb;

}

//______________________________________________________________________________
// RefCompare
void TRefMatch::RefCompare()
{
  // refCompare -- function to compare test sample to reference distributions
  // -- results matrix has the following rows:    phi (°) | probability (%) | significance (σ)
  // -- see the README at $RATROOT/user/root_macros/ref_matching/ in this repository for more details

  // Init() check
  if (!fkHasInit) {
    this->Info("RefCompare", "Please initialize before running comparison.");
    return;
  }

  // file check
  if (fReferenceFileList->GetEntries()==0) {
    this->Error("RefCompare", "Reference-file list is empty; please FillReferenceFileList before running comparison.");
    return;
  }

  // file init
  TFile *f_ts = fTestSampleFile;
  TTree *T_ts = fTestSampleTree;

  // branch check on "test sample" T_ts
  if (T_ts->GetBranch(fTestVarName)==0x0) {
    T_ts->Error("RefCompare", "Specified branch not found.");
    return;
  }
  if (fnTestSampleEvents==0) SetnEvents((Long64_t)(GetTree()->GetEntries()));

  // general init
  Int_t k = 0, j = 0, N = fReferenceFileList->GetEntries();
  TSystemFile *sf;
  TString currentFileName;
  TString currentDirName;
  TFile *f;
  TTree *T;
  TMap *params; //TODO: generalize *params
  TVectorD V(1), *v = &V;
  TMatrixD *m = new TMatrixD(N,3);
  TMatrixD M = *m;
  Double_t phiRef;

  // MAIN
  printf("Processing Kolmogorov-Smirnov tests...\n");
  for ( k=0; k<N; k++ ) {
    sf = (TSystemFile*)fReferenceFileList->At(k);
    currentDirName.Form("%s", sf->GetTitle());
    if (currentDirName(currentDirName.Length()-1) != '/') currentDirName.Append('/');
    currentFileName.Form("%s%s", currentDirName.Data(), sf->GetName());
    f = TFile::Open( currentFileName.Data() );
    f->cd();
    T = (TTree*)gDirectory->Get("T");
    params = (TMap*)gDirectory->Get("params");
    v = (TVectorD*)params->GetValue("phiTrue");
    V.SetElements( v->GetMatrixArray() );
    phiRef = V[0];
    M(k,0) = phiRef;
    M(k,1) = UnbinnedKSTest( T_ts, T, fTestVarName, "", fnTestSampleEvents, fnReferenceEvents );
    M(k,2) = Prob2Sig( M(k,1) );
    f->Close();
  }
  printf("Done.\n");

  // sort
  TMatrixD MS(N,3);
  Int_t *ind = new Int_t[N];
  TMath::Sort( N, M.GetSub(0,N-1,1,1).GetMatrixArray(), ind );
  for ( k=0; k<N; k++ ) {
    for ( j=0; j<3; j++ ) {
      MS[k][j] = M[ind[k]][j];
    }
  }
  SetBestMatchFile( (TFile*)fReferenceFileList->At(ind[0]) );

  // show results
  printf("\n/// Comparison Results for P > 0.1 %% ///\n\tPhi (°)\t\tProbability (%%)\t\tSignificance (σ)\n");
  printf("\t"); for ( k=0; k<60; k++ ) printf("~"); printf("\n");
  for ( k=0; k<N; k++ ) {
    if (MS[k]1<0.001) continue;
    printf("\t%3d\t\t", MS[k][0]);
    if (MS[k][1]<0.1) printf(" "); // because printf %2.1f doens't want to work for me today
    printf("%.2f\t\t\t%.3e\n", 100.*MS[k][1], MS[k][2]);
  }
  if (fBestMatchFile!=0x0) printf("Best match found in file \"%s\"\n", fBestMatchFile->GetName());
  printf("###\n\n");

  // store results
  fResultsMatrix.ResizeTo(N,3);
  SetResultsMatrix(MS);
  TVectorD res(4);
  res[0] = MS[0][0];
  res[1] = MS[0][1];
  res[2] = MS[0][2];
  res[3] = GetTestSamplePhiTrue();
  SetResults( res );

  // all pau!   )
  fkHasRun = kTRUE;
  PrintResults();
  return;
}

//______________________________________________________________________________
// DrawResults
void TRefMatch::DrawResults( Bool_t kDrawFit )
{
  // run check
  if (!fkHasRun) {
    this->Info("TRefMatch::DrawResults", "Please run RefCompare first to get results.");
    return;
  }
  // clear previous graphics, if any
  if (gROOT->GetListOfCanvases()->FindObject("c_RefMatch")!=0) delete c_RefMatch;
  if (gDirectory->FindObject("h_TestSample")!=0) delete h_TestSample;
  // retrieve best-match reference tree
  TFile *refFile = TFile::Open( fBestMatchFile->GetName() );
  TTree* TRef = (TTree*)refFile->Get("T");
  // init
  TTree *T = GetTree();
  const char* varName = GetTestVarName();
  TCanvas *c_RefMatch = new TCanvas("c_RefMatch", "Reference-Comparison Results");
  TH1D *h = new TH1D( "h_TestSample", "Test Sample", 100, T->GetMinimum(varName), T->GetMaximum(varName) );
  Int_t N = GetResultsMatrix().GetNrows();
  const Double_t *x = GetResultsMatrix().GetSub(0,N-1,0,0).GetMatrixArray();
  const Double_t *y = GetResultsMatrix().GetSub(0,N-1,1,1).GetMatrixArray();
  TGraph *g = new TGraph(N, x, y);
  // fill
  Double_t q, qRef;
  T->SetBranchAddress(varName, &q);
  /* for (Int_t kT=0; kT<T->GetEntries(); kT++) { */
  for (Int_t kT=0; kT<fnTestSampleEvents; kT++) {
    T->GetEntry(kT);
    h->Fill(q);
  }
  // draw
  c_RefMatch->SetWindowPosition(500, 137);
  c_RefMatch->SetWindowSize(1000, 800);
  c_RefMatch->Divide(1,2);
  TVirtualPad *p1 = c_RefMatch->GetPad(1);
  p1->cd();
  // fit line
  if (kDrawFit) {
    h->Fit("gaus", "Q"); // Q(uiet mode)
    ((TF1*)(h->GetListOfFunctions()->At(0)))->SetLineColor(kGray);
  }
  // reference plot
  Int_t nBinsX = h->GetNbinsX();
  TH1D *hRef = new TH1D("hRef", "best-match reference plot", nBinsX, h->GetBinLowEdge(0), h->GetBinLowEdge(nBinsX)+h->GetBinWidth(nBinsX));
  TRef->SetBranchAddress(varName, &qRef);
  for ( Int_t kTRef=0; kTRef<TRef->GetEntries(); kTRef++ ) {
    TRef->GetEntry(kTRef);
    hRef->Fill(qRef);
  }
  // main plot
  h->Draw();
  TString hTitStr("Test Sample with Ref. Distrib.  |  BEST-MATCH VALUE: ");
  hTitStr.Append( hTitStr.Format("%.1f",fResults[0]) );
  h->SetTitle(hTitStr.Data());
  h->GetXaxis()->SetTitle("phi (^{o})");
  // scaled reference plot
  hRef->Scale( h->GetMaximum() / hRef->GetMaximum() );
  hRef->SetLineColor(kRed);
  /* hRef->SetFillColor(kRed); */
  hRef->SetMarkerColor(kRed);
  hRef->SetMarkerStyle(kStar);
  hRef->SetMarkerSize(3);
  hRef->Draw("Psame");
  // histogram legend
  TLegend *hLeg = new TLegend(.75, .45, .98, .6);
  hLeg->AddEntry(h, "Datarun");
  hLeg->AddEntry(hRef, "Best Reference Match (scaled)");
  hLeg->Draw();
  // KS results
  // log plot from 0.1% to ~100%
  TVirtualPad *p2 = c_RefMatch->GetPad(2);
  p2->cd();
  p2->Divide(2,1);
  TVirtualPad *p2_1 = p2->GetPad(1);
  p2_1->cd();
  p2_1->SetLogy(kTRUE);
  p2_1->SetGrid(1,1);
  g->SetLineWidth(3.);
  g->SetLineColor(kRed);
  g->SetMarkerColor(kRed);
  g->SetMarkerSize(1.25);
  g->SetMarkerStyle(kFullDotLarge);
  g->Draw("AP");
  g->SetTitle("Reference-Matching Results");
  g->GetXaxis()->SetTitle("phi (^{o})");
  g->GetYaxis()->SetTitle("Match Probability");
  g->GetYaxis()->SetTitleOffset(1.25);
  g->GetYaxis()->SetRangeUser(1.e-3, 1.e0.3);
  // linear plot from 90% to ~100%
  TVirtualPad *p2_2 = p2->GetPad(2);
  p2_2->cd();
  TGraph *g2 = g->Clone("g2");
  /* p2_2->SetLogy(kTRUE); */
  p2_2->SetGrid(1,1);
  g2->GetYaxis()->SetRangeUser(0.9, 1.01);
  g2->GetYaxis()->SetTitleOffset(1.25);
  g2->GetXaxis()->SetRangeUser(fResults[0]-2.5, fResults[0]+2.5); // TODO: generalize by, e.g., finding first/last indices for p > 90%
  g2->Draw("AP");
  // store results
  SetCanvas(c_RefMatch);
  SetTestSampleHist(h);
  SetResultsGraph(g);
  return;
}

////______________________________________________________________________________
//TRefMatch::
//{
//}

////______________________________________________________________________________
//TRefMatch::
//{
//}

//______________________________________________________________________________
// SaveResults
void TRefMatch::SaveResults()
{
  // run check
  if (!fkHasRun) {
    this->Info("TRefMatch::SaveResults", "Please run RefCompare first to get results.");
    return;
  }
  // init
  TString outFileName(fTestSampleFile->GetName());
  outFileName.ReplaceAll("\.root", "_RefMatch.root");
  TString outCanvasName(outFileName);
  outCanvasName.ReplaceAll("\.root",".png");
  // create outfile
  fOutFile = TFile::Open( outFileName.Data(), "recreate" );
  printf( "Created output file %s at %#lx.\n", fOutFile->GetName(), fOutFile);
  // write
  fCanvas->Print(outCanvasName.Data());
  fOutFile->cd();
  /* this->Write("refMatch"); */
  /* this->Write("refMatch", TObject::kSingleKey); */
  fCanvas->Write();
  fResultsMatrix.Write("resultsMatrix");
  fResults.Write("resultsVector");
  // close
  fTestSampleFile->Close();
  fOutFile->Close();
  return;
}

//______________________________________________________________________________
// Close
void TRefMatch::Close()
{
  // graphics first
  if (fTestSampleHist!=0x0) delete fTestSampleHist;
  if (fResultsGraph!=0x0) delete fResultsGraph;
  if (fCanvas!=0x0) delete fCanvas;
  // then file(s)
  if (fBestMatchFile->IsOpen()) fBestMatchFile->Close();
  GetFile()->Close();
  return;
}

//______________________________________________________________________________
// override ls
void TRefMatch::ls()
{
  if (fTestSampleFile!=0x0) {
    cout << IsA()->GetName() << " " << GetName() << " for file " << fTestSampleFile->GetName();
  } else {
    cout << "Uninitialized " << IsA()->GetName();
  }
  cout << "\tat: " << this << endl;
  return;
}

//______________________________________________________________________________
// override print
void TRefMatch::Print()
{
  printf("%s:\t%s:\t%s\n", IsA()->GetName(), GetName(), GetTitle());
  if (fTestSampleFile==0x0) {
    printf("Uninitialized.\n");
    return;
  }
  if (fTestSampleFile!=0x0) printf("Test File: %s at: %#lx\n", fTestSampleFile->GetName(), fTestSampleFile);
  if (fTestSampleTree!=0x0) printf("Test Tree: %s at: %#lx\n", fTestSampleTree->GetName(), fTestSampleTree);
  if (fTestSampleBranch!=0x0) printf("Test Branch: %s at: %#lx\n", fTestSampleBranch->GetName(), fTestSampleBranch);
  if (fOutFile!=0x0) printf("Output File: %s at: %#lx\n", fOutFile->GetName(), fOutFile);
  printf("\n");
  return;
}

//______________________________________________________________________________
// PrintVerbose
void TRefMatch::PrintVerbose()
{
  Print();
  if (fTestSampleFile==0x0) return;
  printf("Test File Name: \"%s\"\n", fTestFileName);
  printf("Test Tree Name: \"%s\"\n", fTestTreeName);
  printf("Test Branch/Var Name: \"%s\"\n", fTestVarName);
  printf("Reference File List: TList* at: %#lx\n", fReferenceFileList);
  printf("\n");
  return;
}

//______________________________________________________________________________
// PrintResults -- summary
void TRefMatch::PrintResults()
{
  if (!fkHasRun) {
    this->Info("TRefMatch::PrintResults", "Please run RefCompare first to get results.");
    return;
  }
  printf( "\n/// Results Summary ///\n\tBest Match: %.2f °\n\tMatch Probability: %2.2f %%   <--->   Match Significance: %.3e σ\n###\n\n", fResults[0], 100.*fResults[1], fResults[2] );
  return;
}

