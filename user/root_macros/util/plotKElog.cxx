// plotKElog -- simple macro to make a log-log plot of initial kinetic energies
//   from the top-level MC events in a RAT-PAC run
// -- USAGE: TH1D *h = plotKElog(T);
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

TH1D* plotKElog( TTree* T ) {

// init
Long64_t N = T->GetEntries();
TCanvas *c_ke = new TCanvas("c_ke", "Particle KE_initial");
Double_t emin(1.e-1), emax(2.e3);
Double_t *kebins = logBins(emin, emax);
TH1D *h = new TH1D("h", "Particle Initial KE", 100, kebins);

// use TTree::Draw to get KE from tree
c_ke->cd();
T->Draw("mc.particle.ke");
Double_t *ke = T->GetV1();
c_ke->Clear();

// fill and (re)draw
for ( Int_t j=0; j<N; j++ ) {
  h->Fill( ke[j] );
}
h->Draw();
c_ke->SetLogx(1);
c_ke->SetLogy(1);

// annotations, etc.
h->GetXaxis()->SetTitle("KE (MeV)");
h->GetYaxis()->SetTitle("Entries");
h->GetXaxis()->SetTitleOffset(1.2);
h->GetYaxis()->SetTitleOffset(1.2);
c_ke->SetGridx(1);
c_ke->SetGridy(1);

//// for use fitting muogenic fast-neutron spectrum (at or near sea level):
//.L TRATNeutronGen.cxx
//TRATNeutronGen n;
//TF1 *fNS = n.GetSpectrum();
//TF1 *f = fNS->Clone("f");
//TH1D *h = plotKElog(T);
//Double_t N = h->GetEntries();
//Double_t A1 = N/25., A2 = A1/100.;
//f->SetParameter(0, A1);
//f->SetParameter(3, A2);
//TFitResultPtr F = h->Fit(f, "SR");
//TFitResult *r = F.Get();
////r->Print();

// all pau!   )
return h;
}
