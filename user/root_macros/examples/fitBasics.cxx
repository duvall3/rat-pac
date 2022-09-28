// fitBasics -- simple reference macro demonstrating
//   certain usages of fitting in ROOT with TF1s
// -- particularly TGraph::Fit and TH1::Fit
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2021 ~ //

//Copyright (C) 2021 Mark J. Duvall / T. Rocks Science
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

//// simple test on DS1 leveling data
printf("\n/// Simple Test on DS1 Leveling Data ///\n");

// import and plot data
TCanvas* c1 = new TCanvas("c1", "Levels");
TGraph g("levels.txt");

// annotations, etc.
g.SetMarkerColor(kBlue);
//g.SetMarkerStyle(7);
g.SetMarkerStyle(kStar);
g.Draw();
TAxis* gx = g.GetXaxis();
TAxis* gy = g.GetYaxis();
gx->SetTitle("Soul Level");
gy->SetTitle("Souls to Next Level");
gy->SetTitleOffset(1.5);
g.Draw("AP");

// exponential fit
TF1* m = new TF1("mark", "[0] + [1] * exp( [2]*(x-[3]) )", 0., 400. );
m->SetLineColor(kGreen);
m->SetParameters(0., 1.e-1, 1.e-2, 0.);
TFitResultPtr RM = g.Fit(m, "SR");
TFitResult* rm = RM.Get();

// cubic fit
//TF1* p = new TF1("cubic", "pol3");
TF1* p = new TF1("cubic", "pol3", 0., 400.);
p->SetLineColor(kRed);
p->Draw("same");
TFitResultPtr RP = g.Fit(p, "SR");
TFitResult* rp = RP.Get();

// gaussian fit
TF1 *G = new TF1("Gaussian", "gaus", 0., 400.);
G->SetLineColor(kMagenta);
G->Draw("same");
TFitResultPtr RG = g.Fit(G, "SR");
TFitResult* rg = RG.Get();

// summarize results
printf("\n* * *\nChi^2 / NDF:\n");
printf( "Exponential\t%e\n", rm->Chi2() / rm->Ndf() );
printf( "Cubic\t\t%e\n", rp->Chi2() / rp->Ndf() );
printf( "Gaussian\t%e\n", rg->Chi2() / rg->Ndf() );

// a little whitespace
printf("\n\n");


//// more complex test on poisson-distributed RAT-PAC data
printf("/// Test on Poisson-distributed RAT-PAC Data ///\n");

// import data and prepare TTree, etc.
/* TFile *f0 = TFile::Open("particleTracks_n0gun_test1_T.root"); */
TFile *f0 = TFile::Open("fitBasics_data.root");
TTree *T = T_scint;
Long64_t ev = 0, N = T->GetEntries();
Double_t dt, dtmin(1.e-2), dtmax(1.e2);
T->SetBranchAddress("interevent_time", &dt);

// plot data
TCanvas *c2 = new TCanvas("c2","c2");
T->Draw("interevent_time>>ht2");

// prepare Poisson-distribution TF1
TF1 f2("f2", "[0] + [1]*TMath::Poisson(x,[2])", 0., 6.);
//TF1 f2("f2", "[0] + [1]*TMath::Poisson([2]*x,[3])", 0., 6.);
f2.SetParameter(0, 0.);
f2.SetParameter(1, 1.);
f2.SetParameter(2, 1.);
f2.SetLineColor(kRed);
f2.Draw("same");

// fit f2 to data (note using address/pointer for f2)
TFitResultPtr Rf2 = ht2->Fit(&f2, "SR");
TFitResult *rf2 = Rf2.Get();

// summarize results
printf("\n* * *\nChi^2 / NDF:\n");
printf( "Poisson\t\t%e\n", rf2->Chi2() / rf2->Ndf() );
printf("\n\n");


////// same thing, but log-scale (shouldn't change anything)
//printf("/// Test on Poisson-distributed RAT-PAC Data (log scale) ///\n");
//
//// plot data
//TCanvas *c3 = new TCanvas("c3","c3");
//Double_t *tbins = logBins(dtmin, dtmax);
//TH1D *ht3 = new TH1D("ht3", "ht3", 100, tbins);
//for ( ev=0; ev<N; ev++ ) {
//  T->GetEntry(ev);
//  ht3->Fill(dt);
//}
//ht3->Draw();
//c3->SetLogx(1);
//c3->SetLogy(1);
//
//// prepare Poisson-distribution TF1
////TF1 f3("f3", "[0] + [1]*TMath::Poisson(x,[2])", dtmin, dtmax);
//TF1 f3("f3", "[0]*TMath::Poisson(x,[1])", dtmin, dtmax);
//f3.SetParameter(0, 0.);
//f3.SetParameter(1, 1.);
//f3.SetParameter(2, 1.);
//f3.SetLineColor(kRed);
//f3.Draw("same");
//
//// fit f3 to data (note using address/pointer for f3)
//TFitResultPtr Rf3 = ht2->Fit(&f3, "SRL");
//TFitResult *rf3 = Rf3.Get();
//
//// summarize results
//printf("\n* * *\nChi^2 / NDF:\n");
//printf( "Poisson\t\t%e\n", rf3->Chi2() / rf3->Ndf() );
//printf("\n\n");

// all pau!   )

}
