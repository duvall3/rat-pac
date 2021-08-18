// correctEnergies -- extract correct energies from old analysis data and
//   add them to new data
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 8/2021 ~ //

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


void correctEnergies( const char* mainFilename, const char* energyFilename ) {


//// INIT

// file operations
TFile* f1 = TFile::Open(mainFilename, "update");
TTree* T1 = (TTree*)f1->FindObjectAny("T_scint");
TFile* f2 = TFile::Open(energyFilename);
TTree* T2 = (TTree*)f2->FindObjectAny("T_scint");
f1->cd();

// init
Double_t time_tol = 0.5e-9; // time tolerance (s)
TString ev_cutstr, time_cutstr, total_cutstr;
TCut ev_cut, time_cut, total_cut;
TEntryList* elist;
Int_t N = T1->GetEntries();
Int_t k;
Int_t _event, event;
//Double_t _x, x, _y, y, _z, z;
Double_t _wall_time_adj, wall_time_adj;
Double_t _corrected_energy, corrected_energy;
Double_t _corrected_energy_q, corrected_energy_q;

// address / create T1 branches
T1->SetBranchAddress("event", &event);
T1->SetBranchAddress("wall_time_adj", &wall_time_adj);
TBranch* cor_en_b = T1->Branch("corrected_energy", &corrected_energy);
TBranch* cor_en_q_b = T1->Branch("corrected_energy_q", &corrected_energy_q);
//T1->SetBranchAddress("corrected_energy", &corrected_energy); //TEMP
//T1->SetBranchAddress("corrected_energy_q", &corrected_energy_q); //TEMP
//TBranch* cor_en_b = T1->GetBranch("corrected_energy"); //TEMP
//TBranch* cor_en_q_b = T1->GetBranch("corrected_energy_q"); //TEMP

// address T2 branches
T2->SetBranchAddress("event", _event);
T2->SetBranchAddress("wall_time_adj", &_wall_time_adj);
T2->SetBranchAddress("energy", &_corrected_energy);
T2->SetBranchAddress("energy_q", &_corrected_energy_q);


//// MAIN
cout << endl;

// burst loop
Int_t N_list, j;
Int_t ent; //debug
for ( k=0; k<N; k++ ) {
//for ( k=0; k<8; k++ ) { //debug

  // setup
  cout << "Main Entry: " << k << endl;
  T1->GetEntry(k);
  T2->GetEntry(k);
  ev_cutstr = TString::Format("event == %d", event);
  time_cutstr = TString::Format("abs(wall_time_adj-%1.20e) < %e", wall_time_adj, time_tol);
  ev_cut = TCut(ev_cutstr);
  time_cut = TCut(time_cutstr);
  total_cut = ev_cut + time_cut;
//total_cut = ev_cut; //debug
//total_cut = time_cut; //debug
//ev_cut.Print(); time_cut.Print(); total_cut.Print(); //debug
//cout << TMath::Abs(_wall_time_adj-wall_time_adj) << endl; //debug
//printf("Time Difference: %e\n", abs(_wall_time_adj - wall_time_adj)); //debug

  // match-finding / tolerance tests
  T2->Draw(">>elist", total_cut, "entrylist");
  elist = (TEntryList*)gDirectory->FindObjectAny("elist");
  N_list = elist->GetN();
  if (N_list > 1) T2->Warning("Match-finding", "Multiple entries passed tolerance tests; using first match.");
  if (N_list == 0) T2->Warning("Match-finding", "No matches found for this entry."); //TODO: add this entry to a "not found" list
  cout << "Matching Entries: " << N_list << endl; //debug
//ent = 0;
//cout << "Entry List:    ";
//while ( elist->GetEntry(ent) > 0 ) {
//  cout << elist->GetEntry(ent) << " ";
//  ent++;
//} //debug
  cout << endl;

  // copy energies
  T2->GetEntry(elist->GetEntry(j));
  corrected_energy = _corrected_energy;
  corrected_energy_q = _corrected_energy_q;
  cor_en_b->Fill();
  cor_en_q_b->Fill();

  cout << endl;
} // end burst loop


//// END

// finish up
f2->Close();
T1->Write("", TObject::kWriteDelete);
f1->Close();

// all pau!   )
return;
}
