// chi2ProbSigma -- simple function to demonstrate applying a Chi-square test
//   to a pair of histograms and converting the resulting probability
//   to a significance level

Double_t chi2ProbSigma( Double_t mu2 = 1., Double_t sig2 = 1., Double_t mu1 = 0., Double_t sig1 = 1. ) {

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

// draw
if (gROOT->GetListOfCanvases()->FindObject("c_cps")==0x0) TCanvas *c_cps = new TCanvas("c_cps", "Chi2ProbSigma");
c_cps->cd();
h_chi2_original->SetLineColor(kBlue);
h_chi2_comparison->SetLineColor(kRed);
h_chi2_original->Draw();
h_chi2_comparison->Draw("same");

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
// print results
printf("\nResults of Chi^2 Test for \"%s\" Against \"%s\":\n", h_chi2_original->GetTitle(), h_chi2_comparison->GetTitle());
printf("\tProbability:\t%.1f %%\n\tSignificance:\t%.3e sigma\n\n", prob*100., sigma);

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
// print results
printf("\nResults of Kolmogorov-Smirnov Test for \"%s\" Against \"%s\":\n", h_chi2_original->GetTitle(), h_chi2_comparison->GetTitle());
printf("\tprobability:\t%.1f %%\n\tSignificance:\t%.3e sigmaKS\n\n", probKS*100., sigmaKS);

// all pau!   )
return sigma;
}
