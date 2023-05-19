// systematicScatterPlot -- make a simple scatter plot of phi_recon vs. phi_true
//   from a KSSummary.root file

// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 05/2023 ~ //

//Copyright (C) 2023 Mark J. Duvall / T. Rocks Science
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

void systematicScatterPlot(const char* filename) {

//// init

// graphics settings
Bool_t kBatchOrig = gROOT->IsBatch();
gROOT->SetBatch(kTRUE);

// general init
TFile *f = TFile::Open(filename, "update");
/* TFile *f = TFile::Open(filename); //debug */
TMatrixT<double> *arm = (TMatrixT<double>*)gDirectory->Get("allResultsMatrix");
if (! arm) {
  printf("Error in <systematicScatterPlot>: TMatrixT<double>* \"allResultsMatrix\" not found in file \"%s\".", filename);
  return;
}
TMatrixT<double> ARM = *arm;
Int_t k = 0, N = ARM.GetNrows();
TMatrixDColumn phiTrueC(ARM, 0), phiReconC(ARM, 1);
TArrayD phiTrueArr(N), phiReconArr(N);
TString c_sysTitle(": Test for Systematics");
c_sysTitle.Prepend(filename);
TCanvas* c_sys = new TCanvas("c_sys", c_sysTitle.Data());

//// MAIN

// fill arrays
for (k=0; k<N; k++) {
  phiTrueArr[k] = phiTrueC[k];
  phiReconArr[k] = phiReconC[k];
}

// create plot
TGraph *g = new TGraph(N, phiTrueArr.GetArray(), phiReconArr.GetArray());
g->Draw("AP");
c_sys->SetGridx(1);
c_sys->SetGridy(1);
g->SetTitle(filename);
g->SetMarkerStyle(kFullSquare);
g->SetMarkerColor(kBlue);
g->SetMarkerSize(1.5);
g->GetXaxis()->SetTitle("#varphi_{True} (^{o})");
g->GetYaxis()->SetTitle("#varphi_{Recon} (^{o})");

// add linear fit
TF1 *linFunc = new TF1("Linear", "pol1", TMath::MinElement(N, phiTrueArr.GetArray()), TMath::MaxElement(N, phiReconArr.GetArray()));
linFunc->SetLineColor(kRed);
linFunc->Draw("same");
TFitResultPtr gFRP = g->Fit(linFunc, "SR");
TFitResult *gFR = gFRP.Get();

// save and exit
TString savename(filename);
savename.ReplaceAll("\.root", "");
savename.Append("_SystematicScatter.png");
c_sys->Print(savename.Data());
c_sys->Write("c_sys");
g->Write("sysScatter");
linFunc->Write("linFunc");
gFR->Write("linFuncFitResult");
f->Close();
gROOT->SetBatch(kBatchOrig);

//   all pau!   )
}
