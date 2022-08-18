// generateTestSampleDistrib -- simple function for generating test-sample arrays
// -- Note: This macro can easily generate a set of test-sample distributions.
//    For example, to generate a distribution for every degree from 0 through 30
//    with a width of 50 deg, run the following line:
//      for ( Int_t k=0; k<31; k++ ) generateTestSampleDistrib( (Double_t)k, 50. );
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

void generateTestSampleDistrib( Double_t phiTrue, Double_t sigma ) { // phi, sigma both in degrees

// general init
gRandom->SetSeed(0);
Long64_t N = 1e3;
Double_t phiMin = -180., phiMax = 180.;
TString savename;
savename.Form("%02dDEG_testsample.root", (Int_t)phiTrue);
TObjString *savenameOS = new TObjString(savename);
TFile *f = TFile::Open(savename.Data(), "recreate");
TF1 *f_gen = new TF1( "f_gen", "Gaus(x, [0], [1])", phiMin, phiMax );
f_gen->SetParameters(phiTrue, sigma);

// copy params
TVectorD vPhiTrue(1);
TVectorD vSigma(1);
TVectorD vN(1);
TVectorD vPhiLims(2);
vPhiTrue[0] = phiTrue;
vSigma[0] = sigma;
vN[0] = N;
vPhiLims[0] = phiMin;
vPhiLims[1] = phiMax;

// record params -- phiTrue, sigma, N, phiLims, savename, f_gen
// Note: There's got to be a better way to do this
TMap *params = new TMap;
TObjString keynames[6] = {"phiTrue", "sigma", "N", "phiLims", "f_gen", "savename"};
TList *values = new TList;
values->Add(&vPhiTrue);
values->Add(&vSigma);
values->Add(&vN);
values->Add(&vPhiLims);
values->Add(f_gen);
values->Add(savenameOS);
for ( Int_t i=0; i<6; i++ ) {
  params->Add( &(keynames[i]), values->At(i) );
}

// TTree init
Double_t phi;
TTree *T = new TTree("T_ts", "Test-Sample Distribution");
T->Branch("phi", &phi);

// MAIN: fill
Long64_t k;
for ( k = 0; k < N; k++ ) {
  phi = f_gen->GetRandom();
  T->Fill();
}

// draw and fit, just for luck
if (gROOT->GetListOfCanvases()->FindObject("c_testsample")) delete c_testsample;
TCanvas *c_testsample = new TCanvas("c_testsample", "c_testsample");
c_testsample->cd();
T->Draw("phi >> h_phi");
TString hTit;
hTit.Form("Test Sample for #varphi = %2d^{o}", (Int_t)phiTrue);
h_phi->SetLineColor(kBlue);
h_phi->SetAxisRange(phiMin, phiMax, "X");
h_phi->SetTitle(hTit.Data());
h_phi->GetXaxis()->SetTitle("#varphi (^{o})");
h_phi->Fit("gaus", "S"); // expected to include the R(ange) option here, but results seem better without it

// save, print
savename.ReplaceAll(".root", ".png");
c_testsample->Print(savename.Data());
params->Write("params", TObject::kSingleKey);
T->Write();
h_phi->Write();
c_testsample->Write();

// close out
c_testsample->Close();
f->Close();

// all pau!   )
return;
}
