// dispTree.cxx -- simple macro to create a tree of (reversed) prompt-delayed displacement vectors
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 05/2022 ~ //

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

void dispTree(const char* filename) {

// init
TFile *f = TFile::Open(filename, "update");
Long64_t k = 0, N = T2->GetEntries();
// T2
Double_t xp, xd, yp, yd, zp, zd;
T2->SetBranchAddress("prompt_cand_x", &xp);
T2->SetBranchAddress("prompt_cand_y", &yp);
T2->SetBranchAddress("prompt_cand_z", &zp);
T2->SetBranchAddress("delayed_cand_x", &xd);
T2->SetBranchAddress("delayed_cand_y", &yd);
T2->SetBranchAddress("delayed_cand_z", &zd);
// T_r
TString savename;
savename.Form("%s_dispTree.root", experiment->GetString().Data());
savename.ReplaceAll("\"", "");
/* TFile *f2 = TFile::Open(savename.Data(), "recreate"); */
TTree *T_r = new TTree("T_r", "Prompt-Delayed displacements for direction reconstruction");
TVector3 r;
T_r->Branch("r", &r); // prompt-delayed displacement
/* f->cd(); */

// main
for ( k = 0; k < N; k++ ) {
  T2->GetEntry(k);
  r.SetX(xd - xp);
  r.SetY(yd - yp);
  r.SetZ(zd - zp);
  r = -r; // displacement --> neutrino direction
  T_r->Fill();
}

// save
/* f2->cd(); */
T_r->Write();
f->Write();
/* f2->Write(); */

// all pau!   )
/* f2->Close(); */
f->Close();
}
