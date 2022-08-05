// generateRefDistribSeg -- simple function for generating test reference arrays
// -- Note: This macro can easily generate a set of reference distributions.
//    For example, to generate a distribution for every degree from 0 through 30
//    with a width of 50 deg, run the following line:
//      for ( Int_t k=0; k<31; k++ ) generateRefDistribSeg( (Double_t)k, 50. );
// -- NOTE: currently hard-coded for hexagonal array (periodicity 6)
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

void generateRefDistribSeg( Double_t phiTrue, Double_t sigma, Int_t periods = 6 ) { // phi, sigma both in degrees

// general init
Long64_t N = 1e5;
Double_t phiMin = -180., phiMax = 180.;
TString savename;
savename.Form("%02dDEG_ref.root", (Int_t)phiTrue);
TObjString *savenameOS = new TObjString(savename);
TFile *f = TFile::Open(savename.Data(), "recreate");
TF1 *f_gen = new TF1( "f_gen", "Gaus(x, [0], [1])", 2*phiMin, 2*phiMax );
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
TTree *T = new TTree("T", "Reference Distribution");
T->Branch("phi", &phi);

// SEGMENTATION
Double_t phiSeg;
T->Branch("phiSeg", &phiSeg);
TAxis *phiAx = new TAxis(periods-1, phiMin, phiMax);

// MAIN: fill
Long64_t k;
Double_t x, y, phiGen;
for ( k = 0; k < N; k++ ) {
  phiGen = f_gen->GetRandom() * TMath::DegToRad();
  x = TMath::Cos(phiGen);
  y = TMath::Sin(phiGen);
  phi = TMath::ATan2(y,x) * TMath::RadToDeg();
  phiSeg = phiAx->GetBinCenter( phiAx->FindBin(phi) );
  T->Fill();
}

// draw and fit, just for luck
if (gROOT->GetListOfCanvases()->FindObject("c_genref")) delete c_genref;
TCanvas *c_genref = new TCanvas("c_genref", "c_genref");
c_genref->cd();
T->Draw("phi >> h_phi");
T->Draw("phiSeg >> h_phiSeg");
// settings for h_phi
h_phi->Draw();
TString hTit;
hTit.Form("Reference Distribution for #varphi = %2d^{o}", (Int_t)phiTrue);
h_phi->SetLineColor(kRed);
h_phi->SetAxisRange(phiMin, phiMax, "X");
h_phi->SetTitle(hTit.Data());
h_phi->GetXaxis()->SetTitle("#varphi (^{o})");
h_phi->Fit("gaus", "S"); // expected to include the R(ange) option here, but results seem better without it
// settings for h_phiSeg
Double_t hScale = h_phiSeg->GetMaximum() / h_phi->GetMaximum();
h_phiSeg->Scale(1./hScale);
h_phiSeg->SetLineColor(kBlue);
h_phiSeg->Draw("same");

// save, print
savename.ReplaceAll(".root", ".png");
c_genref->Print(savename.Data());
params->Write("params", TObject::kSingleKey);
T->Write();
h_phi->Write();
h_phiSeg->Write();
c_genref->Write();

// close out
c_genref->Close();
f->Close();

// all pau!   )
return;
}
