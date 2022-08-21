// KSSummary -- function to construct and display a set of TRefMatch/KSComparison results
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 08/2022 ~ //

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

// function to print results in a nice format
void printKSResults(TMatrixD resultsMatrix) {
  printf("\nphiTrue\t1st(°)\t1st(\%)\t1st(σ)\t2nd(°)\t2nd(\%)\t2nd(σ)\t3rd(°)\t3rd(\%)\t3rd(σ)\tΔ1st(°)\n");
  Int_t k(0), j(0);
  Double_t DeltaBest;
  for ( k=0; k<resultsMatrix.GetNrows(); k++ ) {
    for ( j=0; j<9; j++ ) {
      printf("%.2f\t", resultsMatrix[k][j]);
    }
    printf("%.2f\t", resultsMatrix[k][9]);
    if (resultsMatrix[k][10]>0) printf("+");
    printf("%.2f\n", resultsMatrix[k][10]);
  }
  printf("\n\n");
  return;
}
// overload to accept pointer for convenience
void printKSResults(TMatrixD *resultsMatrixPtr) {
  TMatrixD resultsMatrix = *resultsMatrixPtr;
  printKSResults(resultsMatrix);
  return;
}

/* TMatrixD KSSummary( const char* filenamePattern = ".*_RefMatch\.root" ) { */
// The documentation strongly recommends not using matrices as return values
//   due to multiple calls to the ctor and dtor, so we'll save the matrix
//   to a file instead.
void KSSummary( const char* datarunName = gSystem->WorkingDirectory(), const char* filenamePattern = ".*_RefMatch\.root" ) {

// include
const char* utilFilename("TDuvallUtils.cxx");
if ( ! gInterpreter->IsLoaded(utilFilename) ) gROOT->LoadMacro(utilFilename);

// init
// datarun name
TString datarun(datarunName);
if ( datarun.Contains('/') ) {
  datarun = datarun( datarun.Last('/')+1, datarun.Length()-1 );
}
// list-level init
TList *fileList = TDuvallUtils::ListFiles(filenamePattern);
if (fileList==0x0) {
  gDirectory->Error("KSSummary", "Requested file(s) not found.\n");
  return;
}
fileList->Sort();
Int_t N = fileList->GetEntries();
// file-level init
TSystemFile *sf;
TFile *f;
TIter i(fileList);
TVectorD* resultsVPtr;
TMatrixD* resultsMPtr;
TVectorD resultsV;
TMatrixD resultsM;
TMatrixD allResultsSummary;
allResultsSummary.ResizeTo(N,11);

// MAIN
Int_t k = 0;
for ( i=fileList->begin(); i!=fileList->end(); ++i ) {
  // open file and retrieve results
  sf = (TSystemFile*)*i;
  f = TFile::Open(sf->GetName());
  resultsVPtr = (TVectorD*)gDirectory->Get("resultsVector");
  resultsMPtr = (TMatrixD*)gDirectory->Get("resultsMatrix");
  if ( (resultsVPtr==0x0) | (resultsMPtr==0x0) ) {
    gDirectory->Error("KSSummary", "Could not find either resultsVector or resultsMatrix in current file.\n");
    return;
  }
  resultsV.ResizeTo(resultsVPtr->GetNoElements());
  resultsM.ResizeTo(resultsMPtr->GetNrows(), resultsMPtr->GetNcols());
  resultsV = *resultsVPtr;
  resultsM = *resultsMPtr;
  // fill summary row for this file / angle
  allResultsSummary[k][0] = resultsV[3];		// phiTrue
  allResultsSummary[k][1] = resultsM[0][0];		// best match
  allResultsSummary[k][2] = resultsM[0][1]*100.;	// best match (probability)
  allResultsSummary[k][3] = resultsM[0][2];		// best match (significance)
  allResultsSummary[k][4] = resultsM[1][0];		// 2nd-best match
  allResultsSummary[k][5] = resultsM[1][1]*100.;	// 2nd-best match (probability)
  allResultsSummary[k][6] = resultsM[1][2];		// 2nd-best match (significance)
  allResultsSummary[k][7] = resultsM[2][0];		// 3rd-best match
  allResultsSummary[k][8] = resultsM[2][1]*100.;	// 3rd-best match (probability)
  allResultsSummary[k][9] = resultsM[2][2];		// 3rd-best match (significance)
  allResultsSummary[k][10] = resultsV[0] - resultsV[3]; // delta(best,true)
  // prepare for next iteration
  f->Close();
  k++;
}

// print results
printKSResults(allResultsSummary);

// save results
TFile *outFile = TFile::Open("KSSummary.root", "recreate");
allResultsSummary.Write("allResultsMatrix");

// plot results
TCanvas *c_kss = new TCanvas("c_kss", "KS Best-Match Summary");
c_kss->SetGrid(1,1);
TMatrixDColumn phiTrueC(allResultsSummary, 0);
TMatrixDColumn phiDeltaC(allResultsSummary, allResultsSummary.GetNcols()-1);
TArrayD phiTrueArr(N);
TArrayD phiDeltaArr(N), baseLine(N);
for ( Int_t j=0; j<N; j++ ) {
  phiTrueArr[j] = phiTrueC[j];
  phiDeltaArr[j] = phiDeltaC[j];
  baseLine[j] = 0.;
}
TGraph *g = new TGraph(N, phiTrueArr.GetArray(), phiDeltaArr.GetArray());
Double_t dY = TMath::Max( TMath::Abs(TMath::MinElement(N,phiDeltaArr.GetArray())), TMath::Abs(TMath::MaxElement(N,phiDeltaArr.GetArray())) );
TString gTitle("Best-Match Difference from True Value");
gTitle.Append( TString::Format(" | \"%s\"", datarun.Data()) );
g->SetTitle(gTitle);
g->SetMarkerStyle(kFullSquare);
g->SetMarkerColor(kMagenta);
g->SetMarkerSize(1.5);
g->SetFillColor(0); // for legend if needed
g->GetXaxis()->SetRangeUser( TMath::MinElement(N,phiTrueArr.GetArray()), TMath::MaxElement(N,phiTrueArr.GetArray()) );
g->GetYaxis()->SetRangeUser( -2*dY, 2*dY );
g->GetXaxis()->SetTitle("#varphi_{True} (^{o})");
g->GetYaxis()->SetTitle("#varphi_{Best} - #varphi_{True} (^{o})");
g->Draw("AP");
TGraph *gBaseLine = new TGraph(N, phiTrueArr.GetArray(), baseLine.GetArray());
gBaseLine->SetLineWidth(3.);
gBaseLine->SetLineColor(kBlack);
gBaseLine->Draw("same");
// save plots
gBaseLine->Write("gBaseLine");
g->Write("gResults");
c_kss->Print("KSSummary.png");
c_kss->Write("c_kss");

// all pau!   )
outFile->Write();
outFile->Close();
return;
}
