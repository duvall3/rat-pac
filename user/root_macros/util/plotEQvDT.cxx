// plotEQvDT -- macro for checking and analyzing scintillation bursts
//   in a *_energies_T.root file
// -- or similar file containing a TTree *T_scint
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 01/2022 ~ //

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

TH2D* plotEQvDT(TTree *T_scint, TCut cut = "") {

// init
TTree *T = T_scint;
Long64_t k = 0, N = T->GetEntries(), Nlist = 0;
Double_t eq, dt;
T->SetBranchAddress("energy_q", &eq);
T->SetBranchAddress("interevent_time", &dt);
Double_t *ebins = logBins(1.e-3, 1.e3);
Double_t *tbins = logBins(1.e-10, 1.e3);
TH2D *het;
if (het != 0) delete het;
het = new TH2D("het", "Quenched Energy vs. Interevent Time", 100, ebins, 100, tbins);

// apply cut
TEntryList *eList;
T->Draw(">>eList", cut, "entrylist");
eList = (TEntryList*)gDirectory->FindObjectAny("eList");
Nlist = eList->GetN();

// fill
for ( k=0; k<Nlist; k++ ) {
  T->GetEntry(eList->GetEntry(k));
  het->Fill(eq, dt);
}

// draw
TCanvas *cet;
if (cet == 0) cet = new TCanvas("cet", "cet");
cet->Clear();
cet->SetLogx(1);
cet->SetLogy(1);
het->Draw("col");
het->GetXaxis()->SetTitle("#Delta t (s)");
het->GetYaxis()->SetTitle("E_{Q} (MeV_{ee})");
het->GetXaxis()->SetTitleOffset(1.2);
het->GetYaxis()->SetTitleOffset(1.2);

// all pau!   )
return het;
}

