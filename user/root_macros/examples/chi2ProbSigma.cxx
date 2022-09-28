// chi2ProbSigma -- simple function to demonstrate applying a Chi-square test
//   to a pair of histograms and converting the resulting probability
//   to a significance level
// -- Update: Also include results of K-S test
// -- Results are returned in the following 4x2 matrix:
//
//                     Probability   Significance
//                     ____________________________
//      Chi^2 Test    |_____________|______________|
//   Binned K-S  Test |_____________|______________|
//     Direct KS (1)  |_____________|______________|
//     Direct KS (2)  |_____________|______________|
//
//       where (1) and (2) refer to pre- and post-filter, respectively
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

TMatrixD* chi2ProbSigma( Double_t mu2 = 0.1, Bool_t kDraw = kTRUE, Long64_t nFill = 1e3, Double_t sig2 = 1., Double_t mu1 = 0., Double_t sig1 = 1. ) {
/* { */

// check for prob2sig
const char* p2sfile = "prob2sig.cxx";
if (! gInterpreter->IsLoaded(p2sfile) ) gROOT->LoadMacro(p2sfile);

// init
Double_t xmin(-5.), xmax(5.);
TVectorD v1(nFill), v2(nFill);
if (gDirectory->Get("h_chi2_original")) delete h_chi2_original;
if (gDirectory->Get("h_chi2_comparison")) delete h_chi2_comparison;
/* TH1D *h_chi2_original = new TH1D("h_chi2_original", "Original Distribution", 100, xmin, xmax); */
TH1D *h_chi2_original = new TH1D("h_chi2_original", "Histogram Comparison Tests", 100, xmin, xmax);
TH1D *h_chi2_comparison = new TH1D("h_chi2_comparison", "Distribution for Comparison", 100, xmin, xmax);
TH1D *h_mask = new TH1D("h_mask", "Mask Distribution", 100, xmin, xmax);
TF1 *f1 = new TF1("f1", "Gaus(x, [0], [1])", xmin, xmax);
f1->SetParameters(mu1, sig1);
TF1 *f2 = new TF1("f2", "Gaus(x, [0], [1])", xmin, xmax);
f2->SetParameters(mu2, sig2);

// fill
/* h_chi2_original->FillRandom("f1", nFill); */
/* h_chi2_comparison->FillRandom("f2", nFill); */
for (Int_t k=xmin; k<xmax; k++) h_mask->Fill( (Double_t)k );
for ( k=0; k<(Int_t)nFill; k++ ) {
  v1[k] = f1->GetRandom();
  v2[k] = f2->GetRandom();
  h_chi2_original->Fill(v1[k]);
  h_chi2_comparison->Fill(v2[k]);
}

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

// prepare results matrix
TMatrixD *M = new TMatrixD(4,2);
M(0,0) = prob;
M(0,1) = sigma;
M(1,0) = probKS;
M(1,1) = sigmaKS;

// ALTERNATE METHOD:
Double_t probKS_direct, sigmaKS_direct;
Int_t nfill = (Int_t)nFill;
Int_t *ind1 = new Int_t[nfill];
Int_t *ind2 = new Int_t[nfill];
Double_t *arr1 = new Double_t[nfill];
Double_t *arr2 = new Double_t[nfill];
TMath::Sort(nfill, v1.GetMatrixArray(), ind1, kFALSE);
TMath::Sort(nfill, v2.GetMatrixArray(), ind2, kFALSE);
/* Double_t *v1arr = v1.GetMatrixArray(); */
/* Double_t *v2arr = v2.GetMatrixArray(); */
/* TMath::Sort(nfill, v1arr, ind1); */
/* TMath::Sort(nfill, v2arr, ind2); */
for ( k = 0; k < nfill; k++ ) {
  arr1[k] = v1.GetMatrixArray()[ind1[k]];
  arr2[k] = v2.GetMatrixArray()[ind2[k]];
  /* arr1[k] = v1arr[ind1[k]]; */
  /* arr2[k] = v2arr[ind2[k]]; */
}
probKS_direct = TMath::KolmogorovTest(nfill, arr1, nfill, arr2, "");
sigmaKS_direct = prob2sig(probKS_direct);
printf("\nDirect / Unbinned Method:\n\tKS Prob = %.3f %%\n\tKS Sig = %e\n\n", 100.*probKS_direct, sigmaKS_direct);
// add matrix entries
M(2,0) = probKS_direct;
M(2,1) = sigmaKS_direct;

// draw and print if desired
if (kDraw) {
  // draw histograms
  if (gROOT->GetListOfCanvases()->FindObject("c_cps")==0x0) {
    TCanvas *c_cps = new TCanvas("c_cps", "Chi2ProbSigma");
  } else {
    c_cps->Clear();
  }
  c_cps->cd();
  c_cps->Divide(1,2);
  c_cps_1->cd();
  h_chi2_original->SetLineColor(kBlue);
  h_chi2_comparison->SetLineColor(kRed);
  h_chi2_original->Draw();
  h_chi2_comparison->Draw("same");
  /* // pre-filter: */
  /* printf("\nBefore Filter:\n"); */
  /* // print chi2 results */
  /* printf("\nResults of Chi^2 Test for \"%s\" Against \"%s\":\n", h_chi2_original->GetTitle(), h_chi2_comparison->GetTitle()); */
  /* printf("\tProbability:\t%.3f %%\n\tSignificance:\t%.3e sigma\n\n", prob*100., sigma); */
  /* // print K-S results */
  /* printf("\nResults of Kolmogorov-Smirnov Test for \"%s\" Against \"%s\":\n", h_chi2_original->GetTitle(), h_chi2_comparison->GetTitle()); */
  /* printf("\tprobability:\t%.3f %%\n\tSignificance:\t%.3e sigma\n\n", probKS*100., sigmaKS); */
}

// apply filter and repeat -- Update: no mask, use filter instead
Double_t prob_m, probKS_m, sigma_m, sigmaKS_m;
Double_t *arr1int = new Double_t[nfill];
Double_t *arr2int = new Double_t[nfill];
/* TH1D *h_chi2_original_m = h_chi2_original->Clone("h_chi2_original_m"); */
/* TH1D *h_chi2_comparison_m = h_chi2_comparison->Clone("h_chi2_comparison_m"); */
/* h_chi2_original_m->Multiply(h_mask); */
/* h_chi2_comparison_m->Multiply(h_mask); */
if (gDirectory->Get("H1")) delete H1;
if (gDirectory->Get("H2")) delete H2;
TH1I *H1 = new TH1I("H1", "Original, Quantized", 2*TMath::Nint(xmax-xmin), TMath::Nint(xmin), TMath::Nint(xmax));
TH1I *H2 = new TH1I("H2", "Comparison, Quantized",2*TMath::Nint(xmax-xmin), TMath::Nint(xmin), TMath::Nint(xmax));
for ( k=0; k<(Int_t)nFill; k++ ) {
  H1->Fill( TMath::Nint(v1[k]) );
  H2->Fill( TMath::Nint(v2[k]) );
  arr1int[k] = TMath::Nint(arr1[k]);
  arr2int[k] = TMath::Nint(arr2[k]);
}
prob_m = H1->Chi2Test(H2);
probKS_m = H1->KolmogorovTest(H2);
sigma_m = prob2sig(prob_m);
sigmaKS_m = prob2sig(probKS_m);
// direct / unbinned method
probKS_direct = TMath::KolmogorovTest(nfill, arr1int, nfill, arr2int, "");
sigmaKS_direct = prob2sig(probKS_direct);
printf("\nDirect / Unbinned Method:\n\tKS Prob = %.3f %%\n\tKS Sig = %e\n\n", 100.*probKS_direct, sigmaKS_direct);
// add matrix entries
M(3,0) = probKS_direct;
M(3,1) = sigmaKS_direct;

// draw and print if desired
if (kDraw) {
  c_cps_2->cd();
  H1->SetLineWidth(3.);
  H2->SetLineWidth(3.);
  H1->SetLineColor(kBlue);
  H2->SetLineColor(kRed);
  H1->Draw();
  H2->Draw("same");
  /* // post-mask: */
  /* printf("\nAfter Filter:\n"); */
  /* // print chi2 results */
  /* printf("\nResults of Chi^2 Test for \"%s\" Against \"%s\":\n", h_chi2_original->GetTitle(), h_chi2_comparison->GetTitle()); */
  /* printf("\tProbability:\t%.3f %%\n\tSignificance:\t%.3e sigma\n\n", prob_m*100., sigma_m); */
  /* // print K-S results */
  /* printf("\nResults of Kolmogorov-Smirnov Test for \"%s\" Against \"%s\":\n", h_chi2_original->GetTitle(), h_chi2_comparison->GetTitle()); */
  /* printf("\tprobability:\t%.3f %%\n\tSignificance:\t%.3e sigma\n\n", probKS_m*100., sigmaKS_m); */
}

// all pau!   )
return M;
}

/* // overload for Int_t nFill */
/* TMatrixD* chi2ProbSigma( Double_t mu2 = 1., Bool_t kDraw = kFALSE, Int_t nFill = 1e3, Double_t sig2 = 1., Double_t mu1 = 0., Double_t sig1 = 1. ) { return TMatrixD(mu2, kDraw, (Long64_t)nFill, sig2, mu1, sig1); } */
