// fitTest2 -- more-sophisticated fitting, using interevent-times
//   from a RAT-PAC (MC) datarun
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2021 ~ //

//Copyright (C) 2021 Mark J. Duvall
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

{

// init
TTree *T = T_scint;
Long64_t ev=0, N=T->GetEntries();
Double_t dt;
T->SetBranchAddress("interevent_time", &dt);

// hist
Double_t tmin = TMath::Log(1.e-7), tmax = TMath::Log(1.e1);
//TH1D *h = new TH1D("h", "#Delta t", 100, tmin, tmax);
TH1D *h = new TH1D("h", "#Delta t", 100, 0., tmax-tmin);
for ( ev=0; ev<N; ev++ ) {
  T->GetEntry(ev);
  h->Fill(TMath::Log(dt)-tmin);
}

// draw
TCanvas *c1 = new TCanvas("c1","c1");
h->Draw();

// double Gaussian
TF1 *fg = new TF1("fg", "[0] + [1]*TMath::Gaus(x,[2],[3]) + [4]*TMath::Gaus(x,[5],[6])", 0., tmax-tmin);
fg->SetParLimits(1, 1., 1500.);
fg->SetParLimits(4, 1., 1500.);
fg->SetParameters(0., 300., 4., 2., 1000., 15.5, 2.);
fg->SetLineColor(kGreen);

// double Poisson
TF1 *fp = new TF1("fp", "[0] + [1]*TMath::Poisson(x,[2]) + [3]*TMath::Poisson(x,[4])", 0., tmax-tmin);
fp->SetParLimits(1, 1., 1500.);
fp->SetParLimits(3, 1., 1500.);
fp->SetParameters(0., 300., 2., 1000., 15.5);
fp->SetLineColor(kRed);

// fit
TFitResultPtr Rfg = h->Fit(fg, "SR");
TFitResultPtr Rfp = h->Fit(fp, "SR");
TFitResult *rfg = Rfg.Get();
TFitResult *rfp = Rfp.Get();
fg->Draw("same");
fp->Draw("same");
h->SetAxisRange(0.5, 1.2*h->GetMaximum(), "y");
gPad->SetLogy(1);
printf("\nGaussian Chi^2/NDF:\t%e\n\n", rfg->Chi2() / rfg->Ndf());
printf("\nPoisson Chi^2/NDF:\t%e\n\n", rfp->Chi2() / rfp->Ndf());

}
