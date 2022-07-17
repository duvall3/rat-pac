// refCompare -- function to compare test sample to reference distributions
// -- Usage: TMatrixD * refCompare( TList *refFileList, TTree *testSample, const char* branchName = "phi", const char* treeName = "T" )
// -- returned matrix has the following rows:    phi (°) | probability (%) | significance (σ)
// -- see the README at $RATROOT/user/root_macros/ref_matching/ in this repository for more details
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

/* TMatrixD refCompare( TList *refFileList, TTree *T_ts, const char* branchName = "phi", const char* treeName = "T", Bool_t kDraw = kTRUE ) { */
TMatrixD refCompare( const char* filename, const char* testTreeName = "T_ts", const char* refTreeName = "T", TList *refFileList = 0x0, const char* branchName = "phi", Bool_t kDraw = kTRUE ) {

// file init
TFile *f_ts = TFile::Open( filename, "update" );
TTree *T_ts = (TTree*)gDirectory->Get( testTreeName );
if (refFileList==0x0) TList *refFileList = listFiles("[0-9]+DEG.*\.root");

// branch check on "test sample" T_ts
if (T_ts->GetBranch(branchName)==0x0) {
  T_ts->Error("refCompare", "Specified branch not found.");
  return 0x0;
}

// general init
Int_t k = 0, N = refFileList->GetEntries();
TFile *f;
TTree *T;
TMap *params;
TVectorD V(1), *v = &V;
TMatrixD M(N,3);
Double_t phiRef;

// MAIN
for ( k=0; k<N; k++ ) {
  f = TFile::Open( refFileList->At(k)->GetName() );
  f->cd();
  T = (TTree*)gDirectory->Get("T");
  params = (TMap*)gDirectory->Get("params");
  v = (TVectorD*)params->GetValue("phiTrue");
  V.SetElements( v->GetMatrixArray() );
  phiRef = V[0];
  M(k,0) = phiRef;
  M(k,1) = unbinnedKSTest( T, T_ts, branchName );
  M(k,2) = prob2sig( M(k,1) );
  f->Close();
}

// matrix bookkeeping
TMatrixDColumn mPhi(M,0);
TMatrixDColumn mProb(M,1);
TMatrixDColumn mSig(M,2);

// show results
M.Print(); //debug? //TODO: first, sort by prob/sig


// save?
TMatrixD *m = &M;
m->Write("mRefComp");

// all pau!   )
f_ts->Close();
return M;
}
