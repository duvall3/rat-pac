// analyzeSingleAngleTests -- it's right there in the name
// -- Note: Use the following BASH loop to create the input data:
//      # in the test-sample directory:
//      N=3 # change if needed
//      ANGLE="12." # change if needed
//      for ((K=0; K<N; K++)) { ROOTCMD="root -q -l -b 'generateTestSampleDistribSeg.cxx($ANGLE., 50.)'"; eval $ROOTCMD; LASTFILE=$(ls -t1 *.root | head -1); RENAMECMD="rename 's/\.root/$K.root/' $LASTFILE"; eval $RENAMECMD; }
//      # then, in the reference directory:
//      TESTDIR="TEST_SAMPLES/single_angle" # change if needed
//      for FILE in $TESTDIR/*.root; do FILE_ID=$(echo $FILE | grep -Eo "[[:digit:]]+\.root" | grep -Eo "[[:digit:]]+"); ROOTCMD="root -q -l -b 'KSComparisonSingleAngle.cxx($FILE_ID,$ANGLE)'"; eval $ROOTCMD; done
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

TTree* analyzeSingleAngleTests() {

// dependency check
const char* utilFile = "TDuvallUtils.cxx";
if (!gInterpreter->IsLoaded(utilFile)) gROOT->LoadMacro(utilFile);

// init
Double_t phiBest;
TTree *T_best = new TTree("T_best", "Tree to contain best-match angles from a batch of single-angle test results");
T_best->Branch("phiBest", &phiBest);
TVectorD V(4), *v(4);
TFile *f;

// prepare file list
TSystemFile *sf;
TList *fileList = TDuvallUtils::ListFiles("[0-9]+DEG.*RefMatch\.root");
TIter i(fileList);

// MAIN
for ( i=fileList->begin(); i!=fileList->end(); ++i ) {
  sf = (TSystemFile*)*i;
  f = TFile::Open(sf->GetName());
  v = (TVectorD*)gDirectory->Get("resultsVector");
  V = *v;
  phiBest = V[0];
  T_best->Fill();
  f->Close();
}

// plot results
TCanvas *c_best = new TCanvas("c_best", "Best-Match Results for Single-Angle Test");
TString hTit;
hTit.Form("Best-Match Results for Single-Angle Test | %d Dataruns", fileList->GetEntries());
/* TH1D *h_best = new TH1D("h_best", hTit.Data(), 100, -180., 180.); */
/* TH1D *h_best; */
T_best->Draw("phiBest>>h_best");
h_best->SetTitle(hTit.Data());
h_best->GetXaxis()->SetTitle("#varphi (^{o})");
h_best->Fit("gaus");
TF1 *fitLine = (TF1*)h_best->GetListOfFunctions()->At(0);
fitLine->SetLineColor(kRed);

// save
if (gROOT->IsBatch()) c_best->Print("SingleAngleTestResults.png");
TFile *fout = TFile::Open("SingleAngleTestResults.root", "create");
fout->cd();
T_best->Write("T_best");
c_best->Write("c_best");
h_best->Write("h_best");
fitLine->Write("fitLine");
fout->Close();

// all pau!   )
return T_best;
}
