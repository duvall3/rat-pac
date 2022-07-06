// chi2ProbSigma -- simple function to demonstrate applying a Chi-square test
//   to a pair of histograms and converting the resulting probability
//   to a significance level
// -- Update: Also include results of K-S test
// -- Results are returned in the following 2x2 matrix:
//
//                     Probability   Significance
//                    ____________________________
//      Chi^2 Test   |_____________|______________|
//       K-S  Test   |_____________|______________|
//
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

TMatrixD* chi2ProbSigma( Double_t mu2 = 1., Bool_t kDraw = kFALSE, Double_t sig2 = 1., Double_t mu1 = 0., Double_t sig1 = 1. ) {

// init
Double_t xmin(-5.), xmax(5.);
Long64_t nFill = 1e2;
if (gDirectory->Get("h_chi2_original")) delete h_chi2_original;
if (gDirectory->Get("h_chi2_comparison")) delete h_chi2_comparison;
TH1D *h_chi2_original = new TH1D("h_chi2_original", "Original Distribution", 100, xmin, xmax);
TH1D *h_chi2_comparison = new TH1D("h_chi2_comparison", "Distribution for Comparison", 100, xmin, xmax);
TF1 *f1 = new TF1("f1", "Gaus(x, [0], [1])", xmin, xmax);
f1->SetParameters(mu1, sig1);
TF1 *f2 = new TF1("f2", "Gaus(x, [0], [1])", xmin, xmax);
f2->SetParameters(mu2, sig2);

// fill
h_chi2_original->FillRandom("f1", nFill);
h_chi2_comparison->FillRandom("f2", nFill);

// calculate probability and significance,
// accounting for special values
Double_t prob, sigma;
prob = h_chi2_original->Chi2Test(h_chi2_comparison);
if ( prob == 1. ) {
  sigma = TMath::Infinity();
} else if ( prob == 0. ) {
  sigma = 0.;
} else {
  sigma = TMath::Sqrt2() * TMath::ErfInverse(prob);
}

// do the same using the K-S test
Double_t probKS, sigmaKS;
probKS = h_chi2_original->KolmogorovTest(h_chi2_comparison);
if ( probKS == 1. ) {
  sigmaKS = TMath::Infinity();
} else if ( probKS == 0. ) {
  sigmaKS = 0.;
} else {
  sigmaKS = TMath::Sqrt2() * TMath::ErfInverse(probKS);
}

// draw and print if desired
if (kDraw) {
  // draw histograms
  if (gROOT->GetListOfCanvases()->FindObject("c_cps")==0x0) TCanvas *c_cps = new TCanvas("c_cps", "Chi2ProbSigma");
  c_cps->cd();
  h_chi2_original->SetLineColor(kBlue);
  h_chi2_comparison->SetLineColor(kRed);
  h_chi2_original->Draw();
  h_chi2_comparison->Draw("same");
  // print chi2 results
  printf("\nResults of Chi^2 Test for \"%s\" Against \"%s\":\n", h_chi2_original->GetTitle(), h_chi2_comparison->GetTitle());
  printf("\tProbability:\t%.3f %%\n\tSignificance:\t%.3e sigma\n\n", prob*100., sigma);
  // print K-S results
  printf("\nResults of Kolmogorov-Smirnov Test for \"%s\" Against \"%s\":\n", h_chi2_original->GetTitle(), h_chi2_comparison->GetTitle());
  printf("\tprobability:\t%.3f %%\n\tSignificance:\t%.3e sigma\n\n", probKS*100., sigmaKS);
}

// prepare results matrix
TMatrixD *M = new TMatrixD(2,2);
M(0,0) = prob;
M(0,1) = sigma;
M(1,0) = probKS;
M(1,1) = sigmaKS;

// all pau!   )
return M;
}
