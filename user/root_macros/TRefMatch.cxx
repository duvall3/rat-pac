// TRefMatch -- class for implementing the reference-matching algorithm
//   described in this repository at $RATROOT/user/ref_matching/README.{md,html}
// NOTE: UnbinnedKSTest can be called on *any* pair of TTrees; creating
//   an instance of TRefMatch is not necessary
// Standard Usage:
//   1) Instantiate
//   2) Init
//   3) Set reference directory / pattern if needed
//   4) Fill reference list
//   5) Set tree and branch names if needed
//   6) Call RefCompare

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
#pragma "TMath.h"
#pragma "TH1D.h"

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
  fTestFileName = "";
  fTestTreeName = "";
  fTestVarName = "";
  fTestSampleFile = 0x0;
  fTestSampleTree = 0x0;
  fTestSampleBranch = 0x0;
  fReferenceTreeName = "";
  fReferenceFileList = new TList;
  fOutFile = 0x0;
  fReferenceFilePattern = TRegexp("");
  fReferenceFileDir = 0x0;
  fProb = 0.;
  fSig = 0.;
  /* fResults = 0x0; */
  /* TMatrixD fResults; */
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
  fTestSampleFile = TFile::Open( fTestFileName );
  fTestSampleTree = (TTree*)gDirectory->Get(fTestTreeName);
  if (fTestSampleTree) {
    fTestSampleBranch = fTestSampleTree->GetBranch(fTestVarName);
  } else {
    fTestSampleBranch = 0x0;
  }
  fReferenceTreeName = "T";
  fReferenceFileList = new TList;
  fOutFile = 0x0;
  fReferenceFilePattern = TRegexp("[0-9]+DEG.*\.root");
  fReferenceFileDir = new TSystemDirectory;
  fReferenceFileDir->SetDirectory( TString::Format("%s/../", gSystem->WorkingDirectory()) );
  fProb = 0.;
  fSig = 0.;
  /* Init(); */
}

//______________________________________________________________________________
// initialize: validate and fill members
TRefMatch::Init()
{
  // checks
  if (fTestSampleFile==0x0) {
    this->Error("Init()", "Requested file not found.");
    return;
  }
  if (fTestSampleTree==0x0){
    this->Error("Init()", "Requested TTree not found.");
    return;
  }
  if (fTestSampleBranch==0x0){
    this->Error("Init()", "Requested TBranch not found.");
    return;
  }
  // if all of the above check out okay, create outfile
  TSystemDirectory *wd = new TSystemDirectory;
  wd->SetDirectory(gSystem->WorkingDirectory());
  TString outFileName(fTestSampleFile->GetName());
  outFileName.ReplaceAll("\.root", "_RefMatch.root");
  /* cout << "outFileName = " << outFileName.Data() << endl; //debug */
  fOutFile = TFile::Open( outFileName.Data(), "recreate" );
  printf( "Created output file %s at %#lx.\n", fOutFile->GetName(), fOutFile);
  fReferenceFilePattern = TRegexp("[0-9]+DEG.*\.root");
  fReferenceFileDir = new TSystemDirectory;
  fReferenceFileDir->SetDirectory( TString::Format("%s/../", gSystem->WorkingDirectory()) );
  fResults = new TMatrixD;
  printf("Init complete.\n");
}

//______________________________________________________________________________
// Init -- setter version
TRefMatch::Init( const char* fileName, const char* treeName , const char* branchVarName )
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
}

//______________________________________________________________________________
// SetReferenceFileDir
TRefMatch::SetReferenceFileDir( TSystemDirectory* refFileDir )
{
  if (refFileDir!=0x0) {
    fReferenceFileDir = refFileDir;
  } else {
    this->Error("SetReferenceFileDir", "Invalid directory.");
  }
}

//______________________________________________________________________________
// SetReferenceFileDir
TRefMatch::SetReferenceFileDir( const char* refFileDirName )
{
  TSystemDirectory* sd = new TSystemDirectory;
  sd->SetDirectory(refFileDirName);
  SetReferenceFileDir(sd);
}

//______________________________________________________________________________
// SetReferenceFilePattern
TRefMatch::SetReferenceFilePattern( TRegexp patternRE )
{
  fReferenceFilePattern = patternRE;
}

//______________________________________________________________________________
// SetReferenceFilePattern
TRefMatch::SetReferenceFilePattern( const char* pattern )
{
  TRegexp patternRE(pattern);
  SetReferenceFilePattern(patternRE);
}

//______________________________________________________________________________
// FillReferenceFileList
TRefMatch::FillReferenceFileList()
{

  // check
  if (fReferenceFileDir==0x0) {
    this->Error("FillReferenceFileList", "Set fReferenceFileDir first.");
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
TRefMatch::Prob2Sig( Double_t prob )
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
TRefMatch::Sig2Prob( Double_t sig )
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
TRefMatch::UnbinnedKSTest( TTree *T1, TTree *T2, const char* branchName1, const char* branchName2 ) 
{
  // unbinnedKSTest -- function to execute *unbinned* TMath::KolmogorovTest on a pair of TTrees
  //   containing TBranches with matching names
  // -- Usage: Double_t P = unbinnedKSTest( TTree *T1, TTree *T2, const char* branchName )
  // -- Branches must be of type Double_t
  // -- P is the probability for match
  // -- *T1 and *T2 are pointers to the two input trees
  // -- See the notes in TMath::KolmogorovTest and TH1::KolmogorovTest for details
  // Note: Arrays must be sorted before they can be
  //   fed to TMath::KolmogorovTest!

  // arg check
  if (branchName2 == "") branchName2 = branchName1;

  // init
  // basics
  Double_t P;
  Double_t q1, q2; // quantity1, quantity2
  Int_t k;
  Int_t N1 = (Int_t)T1->GetEntries();
  Int_t N2 = (Int_t)T2->GetEntries();
  // TBranches
  TBranch *br1 = T1->GetBranch(branchName1);
  TBranch *br2 = T2->GetBranch(branchName2);
  if ( (br1==0x0) | (br2==0x0) ) {
    gFile->Error("unbinnedKSTest", "Specified branch missing from one or both TTrees.");
    return TMath::QuietNaN();
  }
  T1->SetBranchAddress(branchName1, &q1);
  T2->SetBranchAddress(branchName2, &q2);
  // raw arrays
  Double_t *arr1 = new Double_t[N1];
  Double_t *arr2 = new Double_t[N2];
  // index arrays
  Int_t *ind1 = new Int_t[N1];
  Int_t *ind2 = new Int_t[N2];
  // sorted arrays
  Double_t *arr1S = new Double_t[N1];
  Double_t *arr2S = new Double_t[N2];

  // fill, sort, re-fill (use kFALSE to sort ascending)
  // Note on N1,N2 loops: Yes, there is a more-efficient (single-loop) way to do this;
  // but the switching is non-trivial and code running today is better than code in debug tomorrow, right? (Right?)
  // first fill
  for ( k=0; k<N1; k++ ) {
    T1->GetEntry(k);
    arr1[k] = q1;
  }
  for ( k=0; k<N2; k++ ) {
    T2->GetEntry(k);
    arr2[k] = q2;
  }
  // sort
  TMath::Sort(N1, arr1, ind1, kFALSE);
  TMath::Sort(N2, arr2, ind2, kFALSE);
  // second fill
  for ( k=0; k<N1; k++ ) {
    arr1S[k] = arr1[ind1[k]];
  }
  for ( k=0; k<N2; k++ ) {
    arr2S[k] = arr2[ind2[k]];
  }

  // MAIN: Finally ready to calculate the K-S probability
  // NOTE: THE "OPTION" ARGUMENT IS (ironically) NOT OPTIONAL, EVEN IF EMPTY!
  P = TMath::KolmogorovTest( N1, arr1S, N2, arr2S, "" );

  // all pau!   )
  /* cout << P << endl; //FIXME: keeps returning int(0) */
  /* return P; */
  SetProb(P);
  SetSig( Prob2Sig(P) );
  cout << fProb << endl; //FIXME: keeps returning int(0) */
  return fProb;

}

//______________________________________________________________________________
// refCompare
TRefMatch::RefCompare( Bool_t kDraw )
{
  // refCompare -- function to compare test sample to reference distributions
  // -- Usage: TMatrixD * refCompare( TList *refFileList, TTree *testSample, const char* branchName = "phi", const char* treeName = "T" )
  // -- returned matrix has the following rows:    phi (°) | probability (%) | significance (σ)
  // -- see the README at $RATROOT/user/root_macros/ref_matching/ in this repository for more details
  // ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 07/2022 ~ //

  // file init
  TFile *f_ts = fTestSampleFile;
  TTree *T_ts = fTestSampleTree;

  // branch check on "test sample" T_ts
  if (T_ts->GetBranch(fTestVarName)==0x0) {
    T_ts->Error("RefCompare", "Specified branch not found.");
    return 0x0;
  }

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
  for ( k=0; k<N; k++ ) {
    /* f = TFile::Open( fReferenceFileList->At(k)->GetName() ); */
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
    M(k,1) = unbinnedKSTest( T, T_ts, fTestVarName );
    M(k,2) = prob2sig( M(k,1) );
    f->Close();
  }

  /* // matrix bookkeeping */
  /* TMatrixDColumn mPhi(M,0); */
  /* TMatrixDColumn mProb(M,1); */
  /* TMatrixDColumn mSig(M,2); */

  // sort
  TMatrixD MS(N,3);
  Int_t *ind = new Int_t[N];
  TMath::Sort( N, M.GetSub(0,N-1,1,1).GetMatrixArray(), ind );
  for ( k=0; k<N; k++ ) {
    for ( j=0; j<3; j++ ) {
      MS[k][j] = M[ind[k]][j];
    }
  }

  // show results
  printf("\n/// Comparison Results ///\n\tPhi (°)\t\tProbability (%%)\t\tSignificance (σ)\n");
  printf("\t"); for ( k=0; k<60; k++ ) printf("~"); printf("\n");
  for ( k=0; k<N; k++ ) {
    printf("\t%3d\t\t", MS[k][0]);
    if (MS[k][1]<0.1) printf(" "); // because printf %2.1f doens't want to work for me
    printf("%.1f\t\t\t%.3e\n", 100.*MS[k][1], MS[k][2]);
  }
  printf("///\n\n");

  // store results
  fResults.ResizeTo(N,3);
  SetResults(MS);

  // all pau!   )
  return MS;
}

////______________________________________________________________________________
//TRefMatch::
//{
//}

////______________________________________________________________________________
//TRefMatch::
//{
//}

////______________________________________________________________________________
//TRefMatch::
//{
//}

////______________________________________________________________________________
//TRefMatch::
//{
//}

//______________________________________________________________________________
// override ls
TRefMatch::ls()
{
  if (fTestSampleFile!=0x0) {
    cout << IsA()->GetName() << " " << GetName() << " for file " << fTestSampleFile->GetName();
  } else {
    cout << "Uninitialized " << IsA()->GetName();
  }
  cout << "\tat: " << this << endl;
}

//______________________________________________________________________________
// override print
TRefMatch::Print()
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
}

//______________________________________________________________________________
// PrintVerbose
TRefMatch::PrintVerbose()
{
  Print();
  if (fTestSampleFile==0x0) return;
  printf("Test File Name: \"%s\"\n", fTestFileName);
  printf("Test Tree Name: \"%s\"\n", fTestTreeName);
  printf("Test Branch/Var Name: \"%s\"\n", fTestVarName);
  printf("Reference File List: TList* at: %#lx\n", fReferenceFileList);
  printf("\n");
}


